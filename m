From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 16:24:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20090103162415.4D1CF76BC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 16:24:14 +0000 (Sat, 03 Jan 2009)
New Revision: 24676

Log:
Fix binutils Config for AVR32 (hopefully final version)

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2009-01-03 16:10:50 UTC (rev 24675)
+++ trunk/buildroot/toolchain/binutils/Config.in	2009-01-03 16:24:14 UTC (rev 24676)
@@ -9,14 +9,10 @@
 	  Select the version of binutils you wish to use.
 
 	config BR2_BINUTILS_VERSION_2_17
-		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED
+		depends on !BR2_nios2
+		depends on BR2_DEPRECATED || (BR2_avr32 && BR2_EXT_BINUTILS_VERSION_2_17)
 		bool "binutils 2.17"
 
-	config BR2_BINUTILS_VERSION_2_17
-		depends on BR2_avr32
-		depends on BR2_EXT_BINUTILS_VERSION_2_17
-		bool "binutils 2.17"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_17
 		depends on !BR2_avr32 && !BR2_nios2
