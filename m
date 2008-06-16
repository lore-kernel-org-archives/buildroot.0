From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 16 Jun 2008 03:51:59 -0700
Subject: [Buildroot] =?windows-1252?q?=5Bbuildroot_0003364=5D=3A_ARM-EABI_?=
	=?windows-1252?q?build_!_=93Illegal_Instruction=94?=
Message-ID: <99d473119bbbdc0d29e3171a084731d5@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3364 
====================================================================== 
Reported By:                noel_v
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3364
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-19-2008 02:24 PDT
Last Modified:              06-16-2008 03:51 PDT
====================================================================== 
Summary:                    ARM-EABI build ! ?Illegal Instruction?
Description: 
ARM-EABI build ! ?Illegal Instruction? 

Buildroot: 01/05/2008 
Target : ARM cpu (AT91SAM9260)
Kernel : 2.6.25 with latest TARGET patches.


+ Buildroot/busybox compiles and runs fine in OABI .
+ Buildroot/busybox in EABI, compiles BUT lots of things are not working..
PING fails , UDHCPC fails, INSMOD/MODPROBE fails .. etc... 
(kernel boots, but some tools (in busybox) are not working).

Double checked build, kernel,buildroot and uclibc have all enabled EABI
and OABI is disabled ! 

NOTE: started clean new dir .. untarred buildroot .. and rebuild all.






====================================================================== 

---------------------------------------------------------------------- 
 tklas - 06-16-08 03:51  
---------------------------------------------------------------------- 
Maybe you should set GNU target to "linux-uclibcgnueabi" instead of
"linux-uclibcgnu". (See bug http://busybox.net/bugs/view.php?id=0003804.) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-19-08 02:24  noel_v         New Issue                                    
05-19-08 02:24  noel_v         Status                   new => assigned     
05-19-08 02:24  noel_v         Assigned To               => buildroot       
05-19-08 05:57  noel_v         Issue Monitored: noel_v                      
06-16-08 03:51  tklas          Note Added: 0008294                          
======================================================================
