From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:16 -0800
Subject: [Buildroot] [buildroot 0000194]: ntp package does not compile
Message-ID: <7ac64b3d8153bf91f17b9e8eef9eee27@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=194 
====================================================================== 
Reported By:                clausklein
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   194
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-28-2005 08:22 PST
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    ntp package does not compile
Description: 
There is an error while make ntp

The ntp program: ntpdc - special NTP query program
can't be build while crosscompiling.

# make[1]: Entering directory
`/home/claus/src/buildroot/build_i386/ntp-4.2.0/ntpdc'
# ./ntpdc-layout > layout.here
# /bin/sh: line 1: ./ntpdc-layout: No such file or directory
# make[1]: *** [layout.here] Error 127
# make[1]: Leaving directory
`/home/claus/src/buildroot/build_i386/ntp-4.2.0/ntpdc'
# make: *** [maybe-layout] Error 2

My patch prevent the build of ntpdc as a configure option:

--disable-ntpdc         Disable build of special NTP query program (while
crosscompileing)

Too the CPPFLAGS and LDFLAGS are set while configure to prevent host
header or libs to be used.

The sntp program is now compiled too.

claus

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-07-05 17:51  
---------------------------------------------------------------------- 
fixed in cvs 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-28-05 08:22  clausklein     New Issue                                    
03-28-05 08:22  clausklein     File Added: ntp.diff                         
03-30-05 11:25  Cy8aer         Issue Monitored: Cy8aer                      
09-07-05 17:51  vapier         Note Added: 0000504                          
09-07-05 17:51  vapier         Status                   assigned => closed  
09-07-05 17:51  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
