From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:10 +0100
Subject: [Buildroot] [PATCH 39/55] board: add Qemu Versatile defconfig
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e0de51bc314de53f506b9e4ba9e0d1bd98b4bee2.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/arm-versatile/linux-2.6.36.config |   88 ++++++++++++++++++++++++++
 configs/qemu_arm_versatile_defconfig         |   11 +++
 2 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/arm-versatile/linux-2.6.36.config
 create mode 100644 configs/qemu_arm_versatile_defconfig

diff --git a/board/qemu/arm-versatile/linux-2.6.36.config b/board/qemu/arm-versatile/linux-2.6.36.config
new file mode 100644
index 0000000..ac58e1a
--- /dev/null
+++ b/board/qemu/arm-versatile/linux-2.6.36.config
@@ -0,0 +1,88 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MACH_VERSATILE_AB=y
+CONFIG_PCI=y
+CONFIG_LEDS=y
+CONFIG_LEDS_CPU=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="root=1f03 mem=32M"
+CONFIG_FPE_NWFPE=y
+CONFIG_VFP=y
+CONFIG_PM=y
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
+CONFIG_MTD_PARTITIONS=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_ARM_INTEGRATOR=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_EEPROM_LEGACY=m
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_SYM53C8XX_2=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_ETHERNET=y
+CONFIG_SMC91X=y
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=m
+# CONFIG_HWMON is not set
+CONFIG_FB=y
+CONFIG_FB_ARMCLCD=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FONTS=y
+CONFIG_FONT_ACORN_8x8=y
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
+CONFIG_NFS_V3=y
+CONFIG_ROOT_NFS=y
+CONFIG_NFSD=y
+CONFIG_NFSD_V3=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_NLS_CODEPAGE_850=m
+CONFIG_NLS_ISO8859_1=m
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_USER=y
+CONFIG_DEBUG_ERRORS=y
+CONFIG_DEBUG_LL=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
new file mode 100644
index 0000000..6c349d3
--- /dev/null
+++ b/configs/qemu_arm_versatile_defconfig
@@ -0,0 +1,11 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.36"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-2.6.36.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.0.4
