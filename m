From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 22:52:47 +0100
Subject: [Buildroot] [git commit] boot/uboot: handle generated defconfigs
Message-ID: <20151222215317.C3DC4826C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7afb1d29fef01c535fb1a9403767c488ac653cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0e3f808..868bf08 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -147,13 +147,11 @@ define UBOOT_CONFIGURE_CMDS
 endef
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
 ifeq ($(BR2_TARGET_UBOOT_USE_DEFCONFIG),y)
-UBOOT_SOURCE_CONFIG = $(UBOOT_DIR)/configs/$(call qstrip,\
-	$(BR2_TARGET_UBOOT_BOARD_DEFCONFIG))_defconfig
+UBOOT_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_UBOOT_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
-UBOOT_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE))
+UBOOT_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE))
 endif # BR2_TARGET_UBOOT_USE_DEFCONFIG
 
-UBOOT_KCONFIG_FILE = $(UBOOT_SOURCE_CONFIG)
 UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS)
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
