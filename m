From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 13:30:36 +0000 (UTC)
Subject: [Buildroot] svn commit: [25796] trunk/buildroot/target/u-boot
Message-ID: <20090323133037.040277656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 13:30:36 +0000 (Mon, 23 Mar 2009)
New Revision: 25796

Log:
u-boot: add 2009.03 release

Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-03-23 13:30:30 UTC (rev 25795)
+++ trunk/buildroot/target/u-boot/Config.in	2009-03-23 13:30:36 UTC (rev 25796)
@@ -13,16 +13,20 @@
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2009_01
+	default BR2_TARGET_UBOOT_2009_03
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2009_03
+	bool "u-boot-2009.03"
+
 config BR2_TARGET_UBOOT_2009_01
 	bool "u-boot-2009.01"
+	depends on BR2_DEPRECATED || BR2_RECENT
 
 config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
-	depends on BR2_DEPRECATED || BR2_RECENT
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_1_3_4
 	bool "u-boot-1.3.4"
@@ -36,6 +40,7 @@
 
 config BR2_UBOOT_VERSION
 	string
+	default "2009.03"	if BR2_TARGET_UBOOT_2009_03
 	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
 	default "2008.10"	if BR2_TARGET_UBOOT_2008_10
 	default "1.3.4"		if BR2_TARGET_UBOOT_1_3_4
