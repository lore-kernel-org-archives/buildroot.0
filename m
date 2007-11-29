From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 29 Nov 2007 05:26:14 -0800
Subject: [Buildroot] [buildroot 0001618]: busybox modutils crash with
	Illegal instruction on ARM
Message-ID: <bee2af1184aa8509f96b377e78f69099@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1618 
====================================================================== 
Reported By:                vanokuten
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1618
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-29-2007 05:26 PST
Last Modified:              11-29-2007 05:26 PST
====================================================================== 
Summary:                    busybox modutils crash with Illegal instruction on
ARM
Description: 
Illegal instruction when using busybox modutils applets,
insmod and rmmod are not working

busybox-1.7.2:

CONFIG_INSMOD=y
# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
CONFIG_FEATURE_INSMOD_LOAD_MAP=y
CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL=y
CONFIG_RMMOD=y
CONFIG_LSMOD=y
CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=y
CONFIG_MODPROBE=y
CONFIG_FEATURE_MODPROBE_MULTIPLE_OPTIONS=y
CONFIG_FEATURE_MODPROBE_FANCY_ALIAS=y

kernel 2.6.22 ARM 920T :

CONFIG_AEABI=y
CONFIG_OABI_COMPAT=y

---------------

insmod /hello_test.ko
Illegal instruction

if using compiled module-init-tools:
/insmod /hello_test.ko
hello_test: module license 'unspecified' taints kernel.
# lsmod
Module                  Size  Used by    Tainted: P
hello_test                1672  0

---------------------
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-29-07 05:26  vanokuten      New Issue                                    
11-29-07 05:26  vanokuten      Status                   new => assigned     
11-29-07 05:26  vanokuten      Assigned To               => buildroot       
======================================================================
