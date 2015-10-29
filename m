From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 29 Oct 2015 12:14:21 -0300
Subject: [Buildroot] [PATCH] configs/mpc8315erdb: bump to linux 4.2.5
Message-ID: <1446131661-21507-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also revamp the kernel config a bit to make it more featured, enabling
SATA ports and storage.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-4.1.config => linux-4.2.config}         | 44 ++++++++++++++++------
 configs/freescale_mpc8315erdb_defconfig            |  8 ++--
 2 files changed, 37 insertions(+), 15 deletions(-)
 rename board/freescale/mpc8315erdb/{linux-4.1.config => linux-4.2.config} (51%)

diff --git a/board/freescale/mpc8315erdb/linux-4.1.config b/board/freescale/mpc8315erdb/linux-4.2.config
similarity index 51%
rename from board/freescale/mpc8315erdb/linux-4.1.config
rename to board/freescale/mpc8315erdb/linux-4.2.config
index c9f17b7..8f56069 100644
--- a/board/freescale/mpc8315erdb/linux-4.1.config
+++ b/board/freescale/mpc8315erdb/linux-4.2.config
@@ -1,18 +1,26 @@
+CONFIG_FSL_EMB_PERFMON=y
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
+CONFIG_POSIX_MQUEUE=y
 CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_EXPERT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_EMBEDDED=y
 CONFIG_MODULES=y
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC831x_RDB=y
+CONFIG_MCU_MPC8349EMITX=y
 CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+# CONFIG_PCIEASPM is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
@@ -21,28 +29,42 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_FSL_ELBC=y
-CONFIG_MD=y
-CONFIG_BLK_DEV_MD=y
-CONFIG_MD_LINEAR=y
-CONFIG_MD_RAID0=y
-CONFIG_MD_RAID1=y
+CONFIG_SCSI_MQ_DEFAULT=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_CONSTANTS=y
+CONFIG_ATA=y
+CONFIG_SATA_FSL=y
 CONFIG_NETDEVICES=y
 CONFIG_GIANFAR=y
-CONFIG_E100=y
+CONFIG_REALTEK_PHY=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MPC=y
 CONFIG_SPI=y
-CONFIG_SPI_BITBANG=y
+CONFIG_SPI_FSL_SPI=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_MPC8XXX=y
 CONFIG_WATCHDOG=y
+CONFIG_8xxx_WDT=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_FSL=y
+CONFIG_USB_STORAGE=y
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_INTF_DEV_UIE_EMUL=y
 CONFIG_RTC_DRV_DS1307=y
+CONFIG_RTC_DRV_GENERIC=y
+CONFIG_DMADEVICES=y
+CONFIG_FSL_DMA=y
+CONFIG_ASYNC_TX_DMA=y
+CONFIG_EXT4_FS=y
+CONFIG_FANOTIFY=y
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_DEV_TALITOS=y
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index 4910ebe..9ffef82 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -12,15 +12,15 @@ BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-4.2.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="mpc8315erdb"
-- 
2.4.10
