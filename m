From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 17:50:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] uboot: fix target uboot
	defconfig warning
Message-ID: <20170424193338.84BA6826FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24d80453afd77e2d8b1c3384ae023b6dfe8ee38d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The warning currently reads:

  No board defconfig name specified, check your
  BR2_TARGET_UBOOT_DEFCONFIG setting.

It should read:

  No board defconfig name specified, check your
  BR2_TARGET_UBOOT_BOARD_DEFCONFIG setting.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit b7f095920a147c58f07b18f1b68553a1af03ae75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6b9d544..782609a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -293,7 +293,7 @@ endif # UBOOT_BOARD_NAME
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
 ifeq ($(BR2_TARGET_UBOOT_USE_DEFCONFIG),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_BOARD_DEFCONFIG)),)
-$(error No board defconfig name specified, check your BR2_TARGET_UBOOT_DEFCONFIG setting)
+$(error No board defconfig name specified, check your BR2_TARGET_UBOOT_BOARD_DEFCONFIG setting)
 endif # qstrip BR2_TARGET_UBOOT_BOARD_DEFCONFIG
 endif # BR2_TARGET_UBOOT_USE_DEFCONFIG
 ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
