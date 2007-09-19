From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Sep 2007 07:00:34 -0700
Subject: [Buildroot] [buildroot 0001502]: BR2_TOOLCHAIN_SYSROOT should
	depend on BR2_GCC_VERSION_4_2_0 or higher
Message-ID: <343daf204bd75482e1392bc48d8009f3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              09-19-2007 07:00 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 09-19-07 07:00  
---------------------------------------------------------------------- 
No, the !ancient is fine. I don't want to special-case working version but
special case deprecat, ancient, unsupported stuff, if anything.

If you select BR2_DEPRECATED, you're on your own anyway, at least in my
POV. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-19-07 06:32  ikonst         New Issue                                    
09-19-07 06:32  ikonst         Status                   new => assigned     
09-19-07 06:32  ikonst         Assigned To               => buildroot       
09-19-07 07:00  bernhardf      Note Added: 0002752                          
======================================================================
