From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 20 Dec 2008 22:31:02 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	ext_source/Atmel/avr32
Message-ID: <20081220223102.7E1D376CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-20 22:31:02 +0000 (Sat, 20 Dec 2008)
New Revision: 24474

Log:
Add updated binutils-2.18 prepatched toolchain for AVR32

Added:
   trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/2.18-avr32-1.0.1/

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2008-12-20 22:27:56 UTC (rev 24473)
+++ trunk/buildroot/toolchain/binutils/Config.in	2008-12-20 22:31:02 UTC (rev 24474)
@@ -10,7 +10,7 @@
 
 	config BR2_BINUTILS_VERSION_2_17
 		depends on BR2_avr32 || !BR2_nios2
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_avr32
 		depends on BR2_EXT_BINUTILS_VERSION_2_17
 		bool "binutils 2.17"
 
@@ -20,7 +20,8 @@
 		bool "binutils 2.17.50.0.17"
 
 	config BR2_BINUTILS_VERSION_2_18
-		depends on !BR2_avr32 && !BR2_nios2
+		depends on !BR2_nios2
+		depends on BR2_EXT_BINUTILS_VERSION_2_18
 		bool "binutils 2.18"
 
 	config BR2_BINUTILS_VERSION_2_18_50_0_1
