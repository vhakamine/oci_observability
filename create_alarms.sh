#!/bin/bash
IFS=',' #DELIMITADOR
while read -r col1 col2 col3; do
    echo "OCID: $ocid"
    echo "COMPARTMENT_OCID: $compartment"
    echo "METRICS_COMPARTMENT_OCID: $metrics_c"
	
	
	#HIGH CPU
	oci monitoring alarm create --compartment-id $compartment --metric-compartment-id $metrics_c --metric-namespace "oci_computeagent" --metric-name "CpuUtilization" --query "average() > 70" --period-seconds 600 --evaluation-periods 2 --threshold 70 --action-enabled true --alarm-type "THRESHOLD" --severity "CRITICAL" --is-enabled true --display-name "High CPU Usage Alarm" --description "This alarm triggers when the average CPU usage of an instance exceeds 70% over a period of 10 minutes"
	
	#CREATE OTHER ALARMS
	#oci monitoring alarm create --compartment-id $compartment --metric-compartment-id $metrics_c --metric-namespace "oci_computeagent" --metric-name "CpuUtilization" --query "average() > 70" --period-seconds 600 --evaluation-periods 2 --threshold 70 --action-enabled true --alarm-type "THRESHOLD" --severity "CRITICAL" --is-enabled true --body "High CPU Usage Alarm > 70% for longer than 10 minutes" --description "This alarm triggers when the average CPU usage of an instance exceeds 70% over a period of 10 minutes"
	

done < source.csv
