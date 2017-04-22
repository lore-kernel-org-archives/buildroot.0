From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:05:50 +0200
Subject: [Buildroot] [git commit] uboot: fix target uboot defconfig warning
Message-ID: <20170422130554.76D2C8222C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7f095920a147c58f07b18f1b68553a1af03ae75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The warning currently reads:

  No board defconfig name specified, check your
  BR2_TARGET_UBOOT_DEFCONFIG setting.

It should read:

  No board defconfig name specified, check your
  BR2_TARGET_UBOOT_BOARD_DEFCONFIG setting.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 91f8ec4..5320d5c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -311,7 +311,7 @@ endif # UBOOT_BOARD_NAME
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
 ifeq ($(BR2_TARGET_UBOOT_USE_DEFCONFIG),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_BOARD_DEFCONFIG)),)
-$(error No board defconfig name specified, check your BR2_TARGET_UBOOT_DEFCONFIG setting)
+$(error No board defconfig name specified, check your BR2_TARGET_UBOOT_BOARD_DEFCONFIG setting)
 endif # qstrip BR2_TARGET_UBOOT_BOARD_DEFCONFIG
 endif # BR2_TARGET_UBOOT_USE_DEFCONFIG
 ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
