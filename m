From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:07 -0800
Subject: [Buildroot] [buildroot 0000626]: strace fails with a "syscall:
	unknown syscall trap..." failure on arm plattform
Message-ID: <41ac51edb988871e777d05f25da812c2@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=626 
====================================================================== 
Reported By:                hagepe
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   626
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-06-2006 06:26 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    strace fails with a "syscall: unknown syscall
trap..." failure on arm plattform
Description: 
tested with the daily snapshot from 5.1.2005:
strace (version 4.5.12) fails with a "syscall: unknown syscall trap..."
failure on a arm920T plattform

====================================================================== 

---------------------------------------------------------------------- 
 hagepe - 01-06-06 06:31  
---------------------------------------------------------------------- 
There is a patch file strace-fix-arm-bad-syscall.patch
available at:
http://www.fluff.org/ben/patches/strace/
Adding this patch to packaging/strace works (Tested with 
an arm920T plattform). 

---------------------------------------------------------------------- 
 Infinoid - 05-08-06 09:57  
---------------------------------------------------------------------- 
I've also hit this with strace-4.5.14 running on an IXP425 processor
(armv5b toolchain).  The patch supplied by hagepe fixes it for me as well. 

---------------------------------------------------------------------- 
 bjdooks - 07-06-06 08:51  
---------------------------------------------------------------------- 
This patch fixes a problem with strace that arm didn't get the fix
that has been applied to the other architectures to filter out fake
syscall events created by execve()

I am the original authour of this patch. 

---------------------------------------------------------------------- 
 bernhardf - 01-20-07 04:57  
---------------------------------------------------------------------- 
Fixed on trunk in r17395.
Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-06-06 06:26  hagepe         New Issue                                    
01-06-06 06:26  hagepe         Status                   new => assigned     
01-06-06 06:26  hagepe         Assigned To               => uClibc          
01-06-06 06:31  hagepe         Note Added: 0000864                          
01-06-06 08:43  hagepe         Issue Monitored: hagepe                      
01-06-06 08:43  hagepe         Issue End Monitor: hagepe                    
05-08-06 09:57  Infinoid       Note Added: 0001361                          
07-06-06 08:51  bjdooks        Note Added: 0001500                          
07-06-06 08:52  bjdooks        Issue Monitored: bjdooks                     
01-20-07 04:57  bernhardf      Status                   assigned => closed  
01-20-07 04:57  bernhardf      Note Added: 0002010                          
01-20-07 04:57  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
