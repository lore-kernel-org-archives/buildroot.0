From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 22:40:28 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/arch-arm
Message-ID: <20090129224029.376BC7741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 22:40:27 +0000 (Thu, 29 Jan 2009)
New Revision: 25150

Log:
Delete AT91 patches before 2.6.22

Removed:
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.20/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.21/

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2009-01-29 22:33:23 UTC (rev 25149)
+++ trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2009-01-29 22:40:27 UTC (rev 25150)
@@ -9,8 +9,6 @@
 	default BR2_ARCH_AT91_2_6_24		if BR2_LINUX_2_6_24
 	default BR2_ARCH_AT91_2_6_23		if BR2_LINUX_2_6_23
 	default BR2_ARCH_AT91_2_6_22		if BR2_LINUX_2_6_22
-	default BR2_ARCH_AT91_2_6_21		if BR2_LINUX_2_6_21
-	default BR2_ARCH_AT91_2_6_20		if BR2_LINUX_2_6_20
 	default BR2_ARCH_AT91_2_6_28
 	help
 	  Select a patch to add to the Linux kernel
@@ -29,37 +27,32 @@
 	bool "2.6.26"
 	help
 	  Apply the at91 linux-2.6.26 patches
+	  Will apply on latest 2.6.2
 
 config	BR2_ARCH_AT91_2_6_25
 	bool "2.6.25"
 	help
 	  Apply the at91 linux-2.6.25 patches
+	  Will apply on latest 2.6.2
 
 config	BR2_ARCH_AT91_2_6_24
 	bool "2.6.24"
 	help
 	  Apply the at91 linux-2.6.24 patches
+	  Will apply on latest 2.6.2
 
 config	BR2_ARCH_AT91_2_6_23
 	bool "2.6.23"
 	help
 	  Apply the at91 linux-2.6.23 patches
+	  Will apply on latest 2.6.2
 
 config	BR2_ARCH_AT91_2_6_22
 	bool "2.6.22"
 	help
 	  Apply the at91 linux-2.6.22 patches
+	  Will apply on latest 2.6.2
 
-config	BR2_ARCH_AT91_2_6_21
-	bool "2.6.21"
-	help
-	  Apply the at91 linux-2.6.21 patches
-
-config	BR2_ARCH_AT91_2_6_20
-	bool "2.6.20"
-	help
-	  Apply the at91 linux-2.6.20 patches
-
 endchoice
 
 config	BR2_KERNEL_ARCH_PATCH_VERSION
@@ -73,8 +66,6 @@
 	default "2.6.24" if BR2_ARCH_AT91_2_6_24
 	default "2.6.24" if BR2_ARCH_AT91_2_6_23
 	default "2.6.22" if BR2_ARCH_AT91_2_6_22
-	default "2.6.21" if BR2_ARCH_AT91_2_6_21
-	default "2.6.20" if BR2_ARCH_AT91_2_6_20
 
 config	BR2_KERNEL_ARCH_PATCH_DIR
 	string
