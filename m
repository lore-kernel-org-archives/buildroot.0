From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 16 Jun 2008 03:40:18 -0700
Subject: [Buildroot] [buildroot 0003804]: GCC default ABI (EABI/OABI) on ARM
	depens on "GNU target suffix"
Message-ID: <f649aba48b6f23d96b37fcb5663a93bd@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3804 
====================================================================== 
Reported By:                tklas
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3804
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-16-2008 03:40 PDT
Last Modified:              06-16-2008 03:40 PDT
====================================================================== 
Summary:                    GCC default ABI (EABI/OABI) on ARM depens on "GNU
target suffix"
Description: 
When "GNU target suffix" (BR2_GNU_TARGET_SUFFIX) is set to linux-*gnueabi,
GCC uses EABI as default, elsewhere it uses OABI. So when BR2_ARM_EABI is
selected and BR2_GNU_TARGET_SUFFIX is not *gnueabi, some code is compiled
with EABI and some with OABI. Compilation is succesfull, but applications
may crash or do some mysterious things.

This problem shoud be documented and BR2_ARM_EABI & BR2_GNU_TARGET_SUFFIX
combination should be checked before build.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-16-08 03:40  tklas          New Issue                                    
06-16-08 03:40  tklas          Status                   new => assigned     
06-16-08 03:40  tklas          Assigned To               => buildroot       
======================================================================
