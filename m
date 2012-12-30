From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Dec 2012 12:32:56 +0100
Subject: [Buildroot] [git commit] qemu/arm-versatile: update to use kernel
	3.7.1
Message-ID: <20121230113341.2BD6481ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa5d13568d193b741d4c20fb8670a3f7334efdcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.6.config => linux-3.7.config}         |    6 +++---
 board/qemu/arm-versatile/readme.txt                |    2 +-
 configs/qemu_arm_versatile_defconfig               |    8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/qemu/arm-versatile/linux-3.6.config b/board/qemu/arm-versatile/linux-3.7.config
similarity index 96%
rename from board/qemu/arm-versatile/linux-3.6.config
rename to board/qemu/arm-versatile/linux-3.7.config
index 5f58b97..da73575 100644
--- a/board/qemu/arm-versatile/linux-3.6.config
+++ b/board/qemu/arm-versatile/linux-3.7.config
@@ -1,3 +1,4 @@
+CONFIG_ARCH_VERSATILE=y
 CONFIG_EXPERIMENTAL=y
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
@@ -15,7 +16,6 @@ CONFIG_LEDS_CPU=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_CMDLINE="root=1f03 mem=32M"
-CONFIG_VFP=y
 CONFIG_PM=y
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -34,11 +34,12 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_ADV_OPTIONS=y
 CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_ARM_INTEGRATOR=y
+CONFIG_MTD_PHYSMAP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_SYM53C8XX_2=y
+CONFIG_EEPROM_LEGACY=m
 CONFIG_NETDEVICES=y
 CONFIG_NET_ETHERNET=y
 CONFIG_SMC91X=y
@@ -69,7 +70,6 @@ CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=m
 CONFIG_EXT2_FS=y
 CONFIG_VFAT_FS=m
-CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 CONFIG_CRAMFS=y
 CONFIG_MINIX_FS=y
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 7868204..51364c7 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.2.0
+Tested with QEMU 1.3.0
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 85efa2b..428e07e 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.6 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_6=y
+# Lock to 3.7 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_7=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.7.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
