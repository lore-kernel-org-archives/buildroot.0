From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Apr 2011 15:12:19 +0200
Subject: [Buildroot] [git commit] qemu/arm-versatile: use 2.6.38.3 kernel
Message-ID: <20110422132110.142EC82973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f550c1bdbb22df15d297303599e85c2a7511a8ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-2.6.36.config => linux-2.6.38.config}   |    4 ++--
 configs/qemu_arm_versatile_defconfig               |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/qemu/arm-versatile/{linux-2.6.36.config => linux-2.6.38.config} (97%)

diff --git a/board/qemu/arm-versatile/linux-2.6.36.config b/board/qemu/arm-versatile/linux-2.6.38.config
similarity index 97%
rename from board/qemu/arm-versatile/linux-2.6.36.config
rename to board/qemu/arm-versatile/linux-2.6.38.config
index 597fd23..5f58b97 100644
--- a/board/qemu/arm-versatile/linux-2.6.36.config
+++ b/board/qemu/arm-versatile/linux-2.6.38.config
@@ -8,12 +8,13 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MACH_VERSATILE_AB=y
 CONFIG_PCI=y
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
 CONFIG_LEDS=y
 CONFIG_LEDS_CPU=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_CMDLINE="root=1f03 mem=32M"
-CONFIG_FPE_NWFPE=y
 CONFIG_VFP=y
 CONFIG_PM=y
 CONFIG_NET=y
@@ -35,7 +36,6 @@ CONFIG_MTD_CFI_ADV_OPTIONS=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_ARM_INTEGRATOR=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_EEPROM_LEGACY=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_SYM53C8XX_2=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 9c990fb..6b3d954 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-2.6.36.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-2.6.38.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.3.4
