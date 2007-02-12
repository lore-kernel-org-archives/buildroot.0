From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:55 -0800
Subject: [Buildroot] [buildroot 0000472]: buildroot missing daemon() support
	for system daemons
Message-ID: <dc3719f2107ac041f6feaa75dae7a644@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=472 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   472
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-05-2005 13:40 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    buildroot missing daemon() support for system
daemons
Description: 
buildroot/build_arm_nofpu/busybox/networking/udhcp/udhcp.a(common.o):
  In function `udhcp_background': common.c:(.text+0x30): undefined
reference to `daemon'

udhcp and sysklogd are affected, as well as debianutils'
start-stop-daemon

I am not sure wether this is due to buildroot not configuring the latest
uclibc correctly, or wether uclibc does not have daemon.c in
libc/unistd/Makefile

====================================================================== 

---------------------------------------------------------------------- 
 psm - 10-05-05 13:47  
---------------------------------------------------------------------- 
try a newer uClibc snapshot (or 0.9.28) 

---------------------------------------------------------------------- 
 bjdooks - 10-05-05 14:17  
---------------------------------------------------------------------- 
The configuration (buildroot snapshot 05-Oct-2005 00:13) was
configured for the latest snapshot, which downloaded the file
http://www.uclibc.org/downloads/snapshots/uClibc-snapshot.tar.bz2

Both the 05Oct2005 and the uClibc-snapshot files are 0.9.27 

---------------------------------------------------------------------- 
 psm - 10-05-05 14:23  
---------------------------------------------------------------------- 
it was corrected today, so wait a day for a new snapshot 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-05-05 13:40  bjdooks        New Issue                                    
10-05-05 13:40  bjdooks        Status                   new => assigned     
10-05-05 13:40  bjdooks        Assigned To               => uClibc          
10-05-05 13:48  psm            Note Added: 0000599                          
10-05-05 13:51  bjdooks        Issue Monitored: bjdooks                     
10-05-05 14:17  bjdooks        Note Added: 0000601                          
10-05-05 14:23  psm            Note Added: 0000602                          
01-25-06 07:54  prpplague      Status                   assigned => resolved
01-25-06 07:54  prpplague      Resolution               open => fixed       
01-25-06 07:54  prpplague      Additional Information Updated                   

03-08-06 16:52  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
