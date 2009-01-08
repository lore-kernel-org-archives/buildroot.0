From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  8 Jan 2009 14:58:51 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090108145851.9BBCC77106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-08 14:58:51 +0000 (Thu, 08 Jan 2009)
New Revision: 24723

Log:
target/u-boot: cleanup

Fix s/Linux/U-Boot/ typo, default to the latest stable version, mark
old versions as deprecated and comment out unreleased version for now.

Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-08 14:58:45 UTC (rev 24722)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-08 14:58:51 UTC (rev 24723)
@@ -14,10 +14,10 @@
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2009_01_RC1
+	default BR2_TARGET_UBOOT_2008_10
 	help
-	  Select the specific Linux version you want to use
-	
+	  Select the specific U-Boot version you want to use
+
 config BR2_TARGET_UBOOT_2009_01_RC1
 	bool "u-boot-2009.01-rc1"
 	depends on BR2_TARGET_UBOOT
@@ -25,20 +25,22 @@
 config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
 	depends on BR2_TARGET_UBOOT
-	
+
 config BR2_TARGET_UBOOT_1_3_4
 	bool "u-boot-1.3.4"
 	depends on BR2_TARGET_UBOOT
-	
+	depends on BR2_DEPRECATED
+
 config BR2_TARGET_UBOOT_1_2_0_ATMEL
 	bool "u-boot-1.2.0-atmel"
 	depends on BR2_TARGET_AT91
 	depends on BR2_TARGET_UBOOT
-	
-config BR2_TARGET_UBOOT_2009_01
-	bool "u-boot-2009.01"
-	depends on BR2_TARGET_UBOOT
+	depends on BR2_DEPRECATED
 
+#config BR2_TARGET_UBOOT_2009_01
+#	bool "u-boot-2009.01"
+#	depends on BR2_TARGET_UBOOT
+
 endchoice
 
 config BR2_UBOOT_VERSION
