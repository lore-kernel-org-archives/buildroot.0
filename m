From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: use
	BR2_TARGET_UBOOT_VERSION instead of BR2_UBOOT_VERSION
Message-ID: <20100614203438.3145180E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=db86f18ed7ce0659f3eda3b2101c5862f07ac18b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to be coherent with all other BR2_TARGET_UBOOT_* options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |    2 +-
 boot/u-boot/u-boot.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 00fd03a..aa680cf 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -37,7 +37,7 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
 
 endif
 
-config BR2_UBOOT_VERSION
+config BR2_TARGET_UBOOT_VERSION
 	string
 	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
 	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index ee56611..ad67343 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -3,7 +3,7 @@
 # U-Boot
 #
 #############################################################
-U_BOOT_VERSION:=$(call qstrip,$(BR2_UBOOT_VERSION))
+U_BOOT_VERSION:=$(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 U_BOOT_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
 # U-Boot may not be selected in the configuration, but mkimage might
-- 
1.7.1
