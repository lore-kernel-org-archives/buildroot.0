From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Apr 2011 23:37:43 +0200
Subject: [Buildroot] [git commit] u-boot: add 2011.03 release
Message-ID: <20110424214918.E7FEC82A32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=31fb724fd2c271fcaf204abcdc26e4afe82618ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
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
index ff3f65e..047f2c8 100644
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
1.7.3.4
