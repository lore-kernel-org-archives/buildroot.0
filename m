From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sun, 30 Mar 2008 01:12:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device/x86/i386
	toolchain/gcc
Message-ID: <20080330081223.623403C4CD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-03-30 01:12:22 -0700 (Sun, 30 Mar 2008)
New Revision: 21577

Log:
* Removed GCC 4.2.0, added GCC 4.2.3  (take 2)


Added:
   trunk/buildroot/toolchain/gcc/4.2.3/

Removed:
   trunk/buildroot/toolchain/gcc/4.2.2/

Modified:
   trunk/buildroot/target/device/x86/i386/i686_defconfig
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/i686_defconfig
===================================================================
--- trunk/buildroot/target/device/x86/i386/i686_defconfig	2008-03-30 08:07:53 UTC (rev 21576)
+++ trunk/buildroot/target/device/x86/i386/i686_defconfig	2008-03-30 08:12:22 UTC (rev 21577)
@@ -198,12 +198,12 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_3=y
 # BR2_GCC_IS_SNAP is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.3"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Copied: trunk/buildroot/toolchain/gcc/4.2.3 (from rev 21562, trunk/buildroot/toolchain/gcc/4.2.2)

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2008-03-30 08:07:53 UTC (rev 21576)
+++ trunk/buildroot/toolchain/gcc/Config.in	2008-03-30 08:12:22 UTC (rev 21577)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_2_1 if !BR2_avr32
+	default BR2_GCC_VERSION_4_2_3 if !BR2_avr32
 	default BR2_GCC_VERSION_4_1_2 if BR2_avr32
 	help
 	  Select the version of gcc you wish to use.
@@ -23,16 +23,15 @@
 		depends BR2_EXT_GCC_VERSION_4_1_2
 		bool "gcc 4.1.2"
 
-	config BR2_GCC_VERSION_4_2_0
-		depends !BR2_avr32 && !BR2_nios2
-		depends BR2_DEPRECATED || BR2_RECENT
-		bool "gcc 4.2.0"
-
 	config BR2_GCC_VERSION_4_2_1
 		depends !BR2_nios2
 		depends BR2_EXT_GCC_VERSION_4_2_1
 		bool "gcc 4.2.1"
 
+	config BR2_GCC_VERSION_4_2_3
+		depends !BR2_nios2 && !BR2_avr32
+		bool "gcc 4.2.3"
+
 #	config BR2_GCC_VERSION_4_3
 #		depends !BR2_avr32 && !BR2_nios2
 #		select BR2_GCC_IS_SNAP
@@ -52,8 +51,8 @@
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
-	default n if BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_2 || BR2_GCC_VERSION_4_2_0 || BR2_GCC_VERSION_4_2_1
-	default y if !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_2 && !BR2_GCC_VERSION_4_2_0 && !BR2_GCC_VERSION_4_2_1
+	default n if BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_2 || BR2_GCC_VERSION_4_2_1 || BR2_GCC_VERSION_4_2_3
+	default y if !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_2 && !BR2_GCC_VERSION_4_2_1 && !BR2_GCC_VERSION_4_2_3
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
@@ -68,8 +67,8 @@
 	default "3.4.6"     if BR2_GCC_VERSION_3_4_6
 	default "4.0.4"     if BR2_GCC_VERSION_4_0_4
 	default "4.1.2"     if BR2_GCC_VERSION_4_1_2
-	default "4.2.0"     if BR2_GCC_VERSION_4_2_0
 	default "4.2.1"     if BR2_GCC_VERSION_4_2_1
+	default "4.2.3"     if BR2_GCC_VERSION_4_2_3
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
 config BR2_TOOLCHAIN_SYSROOT
