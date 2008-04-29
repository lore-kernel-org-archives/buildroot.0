From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 28 Apr 2008 23:01:23 -0700
Subject: [Buildroot] [buildroot 0003204]: buildroot MIPS OABI problem
Message-ID: <2e5bada4b99d17acc3c3c6faaa3d65b0@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3204 
====================================================================== 
Reported By:                Luc Perneel
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3204
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-28-2008 23:01 PDT
Last Modified:              04-28-2008 23:01 PDT
====================================================================== 
Summary:                    buildroot MIPS OABI problem
Description: 
Setting up the buildroot for MIPS (be) with OABI selects the wrong compiler
options (gcc 3.4.x compiler).
Strange that for little endian the option "32" would be used, but for big
endian platforms "o64"...

Patch below fixes this issue

diff -Naur buildroot.orig/target/Config.in.arch
buildroot.lper/target/Config.in.arch
--- buildroot.orig/target/Config.in.arch        2008-03-19
08:15:11.000000000 +0100
+++ buildroot.lper/target/Config.in.arch        2008-04-18
08:53:25.000000000 +0200
@@ -696,7 +696,7 @@
        default iwmmxt          if BR2_iwmmxt
        default 32              if BR2_mipsel && BR2_MIPS_OABI
        default n32             if BR2_mipsel && BR2_MIPS_EABI
-       default o64             if BR2_mips && BR2_MIPS_OABI
+       default 32              if BR2_mips && BR2_MIPS_OABI
        default eabi            if BR2_mips && BR2_MIPS_EABI
        default 64              if BR2_mips && BR2_MIPS_ABI64
        default mmixware        if BR2_mmix && BR2_MMIX_ABI_native

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-28-08 23:01  Luc Perneel    New Issue                                    
04-28-08 23:01  Luc Perneel    Status                   new => assigned     
04-28-08 23:01  Luc Perneel    Assigned To               => buildroot       
======================================================================
