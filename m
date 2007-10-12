From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 12 Oct 2007 08:58:48 -0700
Subject: [Buildroot] [buildroot 0001525]: BR2_ARCH not set for Pentium3
	resulting in failure to create directories
Message-ID: <1bec5e04724c18d3db689fa0b78bc23e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1525 
====================================================================== 
Reported By:                Leon Bailly
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1525
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-12-2007 08:58 PDT
Last Modified:              10-12-2007 08:58 PDT
====================================================================== 
Summary:                    BR2_ARCH not set for Pentium3  resulting in failure
to create directories
Description: 
Buildroot fails to create architecture specific directories caused by
BR2_ARCH not set by make menuconfig.

I am using the following patch to correct this:

*** Config.in.arch.org  2007-10-12 12:16:04.000000000 +0200
--- Config.in.arch      2007-10-12 14:43:59.000000000 +0200
***************
*** 475,480 ****
--- 475,485 ----
        default "i486"          if BR2_x86_i486
        default "i586"          if BR2_x86_i586
        default "i686"          if BR2_x86_i686
+       default "i686"          if BR2_x86_pentium_mmx
+       default "i686"          if BR2_x86_pentiumpro
+       default "i686"          if BR2_x86_pentium_m
+       default "i686"          if BR2_x86_pentium2
+       default "i686"          if BR2_x86_pentium3
        default "i686"          if BR2_x86_pentium4
        default "i686"          if BR2_x86_nocona
        default "i686"          if BR2_x86_core2
***************
*** 507,513 ****
        string
        default "LITTLE" if BR2_arm || BR2_cris || BR2_i386 || BR2_mipsel
|| \
                            BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_nios2
|| \
!                           BR2_sh64
        default "BIG"    if BR2_alpha || BR2_armeb || BR2_avr32 ||
BR2_m68k || BR2_mips || \
                            BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb
|| \
                            BR2_sh3eb || BR2_sh4eb || BR2_sparc ||
BR2_sparc64
--- 512,518 ----
        string
        default "LITTLE" if BR2_arm || BR2_cris || BR2_i386 || BR2_mipsel
|| \
                            BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_nios2
|| \
!                           BR2_sh64 || BR2_i686
        default "BIG"    if BR2_alpha || BR2_armeb || BR2_avr32 ||
BR2_m68k || BR2_mips || \
                            BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb
|| \
                            BR2_sh3eb || BR2_sh4eb || BR2_sparc ||
BR2_sparc64

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-12-07 08:58  Leon Bailly    New Issue                                    
10-12-07 08:58  Leon Bailly    Status                   new => assigned     
10-12-07 08:58  Leon Bailly    Assigned To               => buildroot       
======================================================================
