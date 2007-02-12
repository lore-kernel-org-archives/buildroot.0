From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:34:04 -0800
Subject: [Buildroot] [buildroot 0000891]: Segfault in snmpd apparantly
	caused by non initialised shared library BSS
Message-ID: <b166d331b140e516f076a0a3a218804d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=891 
====================================================================== 
Reported By:                mfuzzey
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   891
Category:                   Shared Library Support
Reproducibility:            sometimes
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-01-2006 08:45 PDT
Last Modified:              02-12-2007 05:34 PST
====================================================================== 
Summary:                    Segfault in snmpd apparantly caused by non
initialised shared library BSS
Description: 
net-snmpd 5.1.2 built with buildroot sometimes segfaults on startup.
Once this occurs it is 100% reproducable until reboot...

Prelimery investigation points to uClibc shared library support (but I may
be wrong...)

Segfault occurs because external_signal_scheduled[] and
external_signal_handler[] defined in agents/agent_registry.c and compiled
to libnetsnmpagent.so are not initialised but the code assumes they are
zero filled on startup.


====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 03:06  
---------------------------------------------------------------------- 
Please provide a
package/netsnmp/netsnmp-5.2.1-fix-extern-initializers.patch
that corrects this bug in netsnmp.
Make sure to send the patch upstream too.

TIA, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-01-06 08:45  mfuzzey        New Issue                                    
06-01-06 08:45  mfuzzey        Status                   new => assigned     
06-01-06 08:45  mfuzzey        Assigned To               => uClibc          
06-01-06 09:06  mfuzzey        Issue Monitored: mfuzzey                     
12-22-06 03:06  bernhardf      Note Added: 0001910                          
12-22-06 03:06  bernhardf      Status                   assigned => feedback
02-12-07 05:34  vapier         Status                   feedback => assigned
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
======================================================================
