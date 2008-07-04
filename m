From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 03:36:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device:
	Atmel/arch-arm KwikByte
Message-ID: <20080704103655.6FF1F3C632@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 03:36:55 -0700 (Fri, 04 Jul 2008)
New Revision: 22629

Log:
Fix Config conflict caused by duplicate definition in KB9202 BSP

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
   trunk/buildroot/target/device/Config.in.toolchain
   trunk/buildroot/target/device/KwikByte/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2008-07-04 10:36:18 UTC (rev 22628)
+++ trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2008-07-04 10:36:55 UTC (rev 22629)
@@ -17,37 +17,37 @@
 config	BR2_ARCH_AT91_2_6_26_RC3
 	bool "2.6.26-rc3"
 	help
-	  Apply the at91 linux-2.6.26-rc3 patches"
+	  Apply the at91 linux-2.6.26-rc3 patches
 
 config	BR2_ARCH_AT91_2_6_25
 	bool "2.6.25"
 	help
-	  Apply the at91 linux-2.6.25 patches"
+	  Apply the at91 linux-2.6.25 patches
 
 config	BR2_ARCH_AT91_2_6_24
 	bool "2.6.24"
 	help
-	  Apply the at91 linux-2.6.24 patches"
+	  Apply the at91 linux-2.6.24 patches
 
 config	BR2_ARCH_AT91_2_6_22_1
 	bool "2.6.22.1"
 	help
-	  Apply the at91 linux-2.6.22.1 patches"
+	  Apply the at91 linux-2.6.22.1 patches
 
 config	BR2_ARCH_AT91_2_6_21_5
 	bool "2.6.21.5"
 	help
-	  Apply the at91 linux-2.6.21.5 patches"
+	  Apply the at91 linux-2.6.21.5 patches
 
 config	BR2_ARCH_AT91_2_6_21_1
 	bool "2.6.21.1"
 	help
-	  Apply the at91 linux-2.6.21.1 patches"
+	  Apply the at91 linux-2.6.21.1 patches
 
 config	BR2_ARCH_AT91_2_6_20_4
 	bool "2.6.20.4"
 	help
-	  Apply the at91 linux-2.6.20.4 patches"
+	  Apply the at91 linux-2.6.20.4 patches
 
 endchoice
 

Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2008-07-04 10:36:18 UTC (rev 22628)
+++ trunk/buildroot/target/device/Config.in.toolchain	2008-07-04 10:36:55 UTC (rev 22629)
@@ -48,10 +48,6 @@
 	  It is generated from buildroot-avr32-v2.2.0-rc4
 	  in http://www.atmel.no/buildroot
 
-config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE
-	bool
-	default n
-
 config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
 	bool "Use prepatched source for AVR32 gcc-4.2.3 toolchain"
 	depends on BR2_avr32
@@ -74,6 +70,10 @@
 
 endchoice
 
+config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE
+	bool
+	default n
+
 config BR2_TOOLCHAIN_ATMEL_AVR32
 	bool
 	default n

Modified: trunk/buildroot/target/device/KwikByte/Config.in
===================================================================
--- trunk/buildroot/target/device/KwikByte/Config.in	2008-07-04 10:36:18 UTC (rev 22628)
+++ trunk/buildroot/target/device/KwikByte/Config.in	2008-07-04 10:36:55 UTC (rev 22629)
@@ -27,37 +27,37 @@
 	prompt "Add AT91 specific patches"
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_arm
-	default BR2_ARCH_AT91_2_6_24		if BR2_LINUX_2_6_24
-#	default BR2_ARCH_AT91_2_6_24		if BR2_LINUX_2_6_23
-#	default BR2_ARCH_AT91_2_6_22_1		if BR2_LINUX_2_6_22_1
-#	default BR2_ARCH_AT91_2_6_21_5		if BR2_LINUX_2_6_21 || BR2_LINUX_2_6_21_5
-#	default BR2_ARCH_AT91_2_6_21_1		if BR2_LINUX_2_6_21_1
-#	default BR2_ARCH_AT91_2_6_20_4		if BR2_LINUX_2_6_20 || BR2_LINUX_2_6_20_4
-#	default BR2_ARCH_AT91_2_6_24
+	default BR2_ARCH_AT91_2_6_24_KB		if BR2_LINUX_2_6_24
+#	default BR2_ARCH_AT91_2_6_24_KB		if BR2_LINUX_2_6_23
+#	default BR2_ARCH_AT91_2_6_22_1_KB	if BR2_LINUX_2_6_22_1
+#	default BR2_ARCH_AT91_2_6_21_5_KB	if BR2_LINUX_2_6_21 || BR2_LINUX_2_6_21_5
+#	default BR2_ARCH_AT91_2_6_21_1_KB	if BR2_LINUX_2_6_21_1
+#	default BR2_ARCH_AT91_2_6_20_4_KB	if BR2_LINUX_2_6_20 || BR2_LINUX_2_6_20_4
+#	default BR2_ARCH_AT91_2_6_24_KB
 	help
 	  Select a patch to add to the Linux kernel
 
-config	BR2_ARCH_AT91_2_6_24
+config	BR2_ARCH_AT91_2_6_24_KB
 	bool "2.6.24"
 	help
 	  Apply the at91 linux-2.6.24 patches"
 
-#config	BR2_ARCH_AT91_2_6_22_1
+#config	BR2_ARCH_AT91_2_6_22_1_KB
 #	bool "2.6.22.1"
 #	help
 #	  Apply the at91 linux-2.6.22.1 patches"
 #
-#config	BR2_ARCH_AT91_2_6_21_5
+#config	BR2_ARCH_AT91_2_6_21_5_KB
 #	bool "2.6.21.5"
 #	help
 #	  Apply the at91 linux-2.6.21.5 patches"
 #
-#config	BR2_ARCH_AT91_2_6_21_1
+#config	BR2_ARCH_AT91_2_6_21_1_KB
 #	bool "2.6.21.1"
 #	help
 #	  Apply the at91 linux-2.6.21.1 patches"
 #
-#config	BR2_ARCH_AT91_2_6_20_4
+#config	BR2_ARCH_AT91_2_6_20_4_KB
 #	bool "2.6.20.4"
 #	help
 #	  Apply the at91 linux-2.6.20.4 patches"
@@ -68,11 +68,11 @@
 	string
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_arm
-	default "2.6.24" if BR2_ARCH_AT91_2_6_24
-#	default "2.6.22.1" if BR2_ARCH_AT91_2_6_22_1
-#	default "2.6.21.5" if BR2_ARCH_AT91_2_6_21_5
-#	default "2.6.21.1" if BR2_ARCH_AT91_2_6_21_1
-#	default "2.6.20.4" if BR2_ARCH_AT91_2_6_20_4
+	default "2.6.24" if BR2_ARCH_AT91_2_6_24_KB
+#	default "2.6.22.1" if BR2_ARCH_AT91_2_6_22_1_KB
+#	default "2.6.21.5" if BR2_ARCH_AT91_2_6_21_5_KB
+#	default "2.6.21.1" if BR2_ARCH_AT91_2_6_21_1_KB
+#	default "2.6.20.4" if BR2_ARCH_AT91_2_6_20_4_KB
 
 config	BR2_KERNEL_ARCH_PATCH_DIR
 	string
