From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Apr 2012 12:05:09 -0300
Subject: [Buildroot] [PATCH 2/2] u-boot: bump to 2012.04.01 release
In-Reply-To: <1335539109-6447-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335539109-6447-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335539109-6447-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump from 2012.04 to 2012.04.01
Fixes a nasty bug in the command line processing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/uboot/Config.in                               |    8 ++++----
 ...012.04-change-kernel-address-in-dataflash.patch |    0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename boot/uboot/{uboot-2012.04 => uboot-2012.04.01}/uboot-2012.04-change-kernel-address-in-dataflash.patch (100%)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7c5f2c6..0d6a2b2 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -12,12 +12,12 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2012_04
+	default BR2_TARGET_UBOOT_2012_04_01
 	help
 	  Select the specific U-Boot version you want to use
 
-config BR2_TARGET_UBOOT_2012_04
-	bool "2012.04"
+config BR2_TARGET_UBOOT_2012_04_01
+	bool "2012.04.01"
 
 config BR2_TARGET_UBOOT_2011_12
 	bool "2011.12"
@@ -50,7 +50,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2012.04"	if BR2_TARGET_UBOOT_2012_04
+	default "2012.04.01"	if BR2_TARGET_UBOOT_2012_04_01
 	default "2011.12"	if BR2_TARGET_UBOOT_2011_12
 	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
 	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
diff --git a/boot/uboot/uboot-2012.04/uboot-2012.04-change-kernel-address-in-dataflash.patch b/boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch
similarity index 100%
rename from boot/uboot/uboot-2012.04/uboot-2012.04-change-kernel-address-in-dataflash.patch
rename to boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch
-- 
1.7.3.4
