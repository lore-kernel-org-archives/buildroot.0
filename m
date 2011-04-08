From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  8 Apr 2011 16:46:23 +0200
Subject: [Buildroot] [PATCH v2] u-boot: add 2011.03 release
In-Reply-To: <1302204474-21172-1-git-send-email-luca@lucaceresoli.net>
References: <1302204474-21172-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1302273983-15137-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
Changed in v2:
 - updated boot/u-boot/u-boot.mk too

 boot/u-boot/Config.in |    6 +++++-
 boot/u-boot/u-boot.mk |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 3ba1ef3..00a4a5f 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2010_12
+	default BR2_TARGET_UBOOT_2011_03
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2011_03
+	bool "2011.03"
+
 config BR2_TARGET_UBOOT_2010_12
 	bool "2010.12"
 
@@ -42,6 +45,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
 	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
 	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
 	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index a86819b..d859cf5 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -11,7 +11,7 @@ U_BOOT_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 # pick some random stable U-Boot version that will be used just to
 # build mkimage.
 ifeq ($(U_BOOT_VERSION),)
-U_BOOT_VERSION=2010.12
+U_BOOT_VERSION=2011.03
 endif
 
 ifeq ($(U_BOOT_VERSION),custom)
-- 
1.7.1
