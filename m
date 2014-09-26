From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 26 Sep 2014 18:56:15 +0200
Subject: [Buildroot] [PATCH 2/3] qemu-arm: update versatile config to latest
	kernel
Message-ID: <20140926165612.GA23299@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to Kernel 3.16.3.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/arm-versatile/linux-3.13.config |   79 ----------------------------
 board/qemu/arm-versatile/linux-3.16.config |   79 ++++++++++++++++++++++++++++
 board/qemu/arm-versatile/readme.txt        |    2 +-
 configs/qemu_arm_versatile_defconfig       |   10 ++--
 4 files changed, 85 insertions(+), 85 deletions(-)
 delete mode 100644 board/qemu/arm-versatile/linux-3.13.config
 create mode 100644 board/qemu/arm-versatile/linux-3.16.config

diff --git a/board/qemu/arm-versatile/linux-3.13.config b/board/qemu/arm-versatile/linux-3.13.config
deleted file mode 100644
index 38c6466..0000000
--- a/board/qemu/arm-versatile/linux-3.13.config
+++ /dev/null
@@ -1,79 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_ARCH_VERSATILE=y
-CONFIG_MACH_VERSATILE_AB=y
-CONFIG_PCI=y
-CONFIG_AEABI=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="root=1f03 mem=32M"
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_ADV_OPTIONS=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_PHYSMAP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_EEPROM_LEGACY=m
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_SCSI_SYM53C8XX_2=y
-CONFIG_NETDEVICES=y
-CONFIG_SMC91X=y
-# CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIO_AMBAKMI=y
-CONFIG_LEGACY_PTY_COUNT=16
-CONFIG_SERIAL_8250=m
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_8250_RSA=y
-CONFIG_SERIAL_AMBA_PL011=y
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=m
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FB_ARMCLCD=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_SOUND=y
-CONFIG_SND=m
-CONFIG_SND_MIXER_OSS=m
-CONFIG_SND_PCM_OSS=m
-CONFIG_SND_ARMAACI=m
-CONFIG_MMC=y
-CONFIG_MMC_ARMMMCI=m
-CONFIG_EXT2_FS=y
-CONFIG_VFAT_FS=m
-CONFIG_JFFS2_FS=y
-CONFIG_CRAMFS=y
-CONFIG_MINIX_FS=y
-CONFIG_ROMFS_FS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NFSD=y
-CONFIG_NFSD_V3=y
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_LL=y
-CONFIG_FONTS=y
-CONFIG_FONT_ACORN_8x8=y
diff --git a/board/qemu/arm-versatile/linux-3.16.config b/board/qemu/arm-versatile/linux-3.16.config
new file mode 100644
index 0000000..38c6466
--- /dev/null
+++ b/board/qemu/arm-versatile/linux-3.16.config
@@ -0,0 +1,79 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_ARCH_VERSATILE=y
+CONFIG_MACH_VERSATILE_AB=y
+CONFIG_PCI=y
+CONFIG_AEABI=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="root=1f03 mem=32M"
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_BOOTP=y
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_EEPROM_LEGACY=m
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_SYM53C8XX_2=y
+CONFIG_NETDEVICES=y
+CONFIG_SMC91X=y
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=m
+# CONFIG_HWMON is not set
+CONFIG_FB=y
+CONFIG_FB_ARMCLCD=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_SOUND=y
+CONFIG_SND=m
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_ARMAACI=m
+CONFIG_MMC=y
+CONFIG_MMC_ARMMMCI=m
+CONFIG_EXT2_FS=y
+CONFIG_VFAT_FS=m
+CONFIG_JFFS2_FS=y
+CONFIG_CRAMFS=y
+CONFIG_MINIX_FS=y
+CONFIG_ROMFS_FS=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_NFSD=y
+CONFIG_NFSD_V3=y
+CONFIG_NLS_CODEPAGE_850=m
+CONFIG_NLS_ISO8859_1=m
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_USER=y
+CONFIG_DEBUG_LL=y
+CONFIG_FONTS=y
+CONFIG_FONT_ACORN_8x8=y
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 2c02e26..d2eeb19 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.7.0
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 1348bab..510e739 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.13 headers to avoid breaking with newer kernels
+# Lock to 3.16 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.16.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.16.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.10.4
