From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Sep 2007 06:32:12 -0700
Subject: [Buildroot] [buildroot 0001502]: BR2_TOOLCHAIN_SYSROOT should
	depend on BR2_GCC_VERSION_4_2_0 or higher
Message-ID: <b36c2988943bdf2db15ad0c4241e902f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1502 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1502
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-19-2007 06:32 PDT
Last Modified:              09-19-2007 06:32 PDT
====================================================================== 
Summary:                    BR2_TOOLCHAIN_SYSROOT should depend on
BR2_GCC_VERSION_4_2_0 or higher
Description: 
The sysroot feature is only available on gcc 4.2.0 and higher. Building it
with gcc 4.1.x will cause an error (as sysroot's help string already
specifies).

toolchain/gcc/Config.in should be changed. Preferably, the rule should be
changed from exclusive:
depends on !BR2_GCC_VERSION_3_3_5 ...
to inclusive:
depends on BR2_GCC_VERSION_4_2_0 || BR2_GCC_VERSION_4_2_1 ||
BR2_GCC_VERSION_4_3
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-19-07 06:32  ikonst         New Issue                                    
09-19-07 06:32  ikonst         Status                   new => assigned     
09-19-07 06:32  ikonst         Assigned To               => buildroot       
======================================================================
