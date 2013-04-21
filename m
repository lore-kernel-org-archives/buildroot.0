From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:37:38 +0200
Subject: [Buildroot] [git commit] configs: add sample for freescale p1010rdb
Message-ID: <20130421215212.ABFF39B7A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=326c21bcc26954e285eedb6f6945708132d77e19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/freescale/p1010rdb/linux-3.8.config |  143 +++++++++++++++++++++++++++++
 board/freescale/p1010rdb/readme.txt       |   63 +++++++++++++
 configs/freescale_p1010rdb_defconfig      |   32 +++++++
 3 files changed, 238 insertions(+), 0 deletions(-)

diff --git a/board/freescale/p1010rdb/linux-3.8.config b/board/freescale/p1010rdb/linux-3.8.config
new file mode 100644
index 0000000..5cdb413
--- /dev/null
+++ b/board/freescale/p1010rdb/linux-3.8.config
@@ -0,0 +1,143 @@
+CONFIG_PPC_85xx=y
+CONFIG_PHYS_64BIT=y
+CONFIG_EXPERIMENTAL=y
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_AUDIT=y
+CONFIG_IRQ_DOMAIN_DEBUG=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_P1010_RDB=y
+CONFIG_HIGHMEM=y
+CONFIG_SWIOTLB=y
+CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_RAPIDIO=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM_USER=y
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_ROUTE_MULTIPATH=y
+CONFIG_IP_ROUTE_VERBOSE=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_NET_IPIP=y
+CONFIG_IP_MROUTE=y
+CONFIG_IP_PIMSM_V1=y
+CONFIG_IP_PIMSM_V2=y
+CONFIG_ARPD=y
+CONFIG_INET_ESP=y
+# CONFIG_INET_XFRM_MODE_BEET is not set
+CONFIG_INET_LRO=y
+CONFIG_IPV6=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_FTL=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_FSL_ELBC=y
+CONFIG_MTD_NAND_FSL_IFC=y
+CONFIG_PROC_DEVICETREE=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_NBD=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=131072
+CONFIG_EEPROM_LEGACY=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_ST=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_MULTI_LUN=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_ATA=y
+CONFIG_SATA_FSL=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=y
+CONFIG_GIANFAR=y
+CONFIG_VITESSE_PHY=y
+CONFIG_FIXED_PHY=y
+CONFIG_SERIO_LIBPS2=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_DETECT_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+CONFIG_SERIAL_QE=m
+CONFIG_NVRAM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_CPM=m
+CONFIG_I2C_MPC=y
+CONFIG_SPI=y
+CONFIG_SPI_FSL_SPI=y
+CONFIG_SPI_FSL_ESPI=y
+CONFIG_GPIO_MPC8XXX=y
+# CONFIG_HWMON is not set
+CONFIG_USB=y
+CONFIG_USB_MON=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_FSL=y
+CONFIG_USB_STORAGE=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ESDHC=y
+CONFIG_EDAC=y
+CONFIG_EDAC_MM_EDAC=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_CMOS=y
+CONFIG_DMADEVICES=y
+CONFIG_FSL_DMA=y
+# CONFIG_NET_DMA is not set
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_USE_FOR_EXT23=y
+CONFIG_MSDOS_FS=m
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_JFFS2_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_ROOT_NFS=y
+CONFIG_NFSD=y
+CONFIG_CRC_T10DIF=y
+CONFIG_DEBUG_FS=y
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_DEBUG_INFO=y
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_SHA256=y
+CONFIG_CRYPTO_SHA512=y
+CONFIG_CRYPTO_AES=y
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_DEV_FSL_CAAM=y
diff --git a/board/freescale/p1010rdb/readme.txt b/board/freescale/p1010rdb/readme.txt
new file mode 100644
index 0000000..96293b7
--- /dev/null
+++ b/board/freescale/p1010rdb/readme.txt
@@ -0,0 +1,63 @@
+
+******************** WARNING ********************
+The compiled U-Boot binary is intended for NOR flash only!
+It won't work for NAND or SPI and will brick those bootloaders!
+
+Also don't go playing around with different U-boot versions or flash targets
+unless you've got the necessary hardware and/or know-how to unbrick your kit.
+
+2012.10 is known good for NOR, but BAD for NAND and SPI.
+******************** WARNING ********************
+
+You'll need to program the files created by buildroot into the flash.
+The fast way is to tftp transfer the files via one of the network interfaces.
+
+Alternatively you can transfer the files via serial console with an Ymodem
+file transfer from your terminal program by using a "loady" command
+from the u-boot prompt instead of the "tftp ..." commands stated below.
+Beware that serial console file transfers are quite slow!
+
+Remember to set the P1010RDB switches to NOR boot if you want to use
+your newly built U-Boot.
+
+1. Program the new U-Boot binary to NOR flash (optional)
+    If you don't feel confident upgrading your bootloader then don't do it,
+    it's unnecessary most of the time.
+
+    => tftp $loadaddr u-boot.bin
+    => protect off 0xeff80000 +$filesize
+    => erase 0xeff80000 +$filesize
+    => cp.b $loadaddr 0xeff80000 $filesize
+
+2. Program the DTB to NOR flash
+
+    => tftp $loadaddr p1010rdb.dtb
+    => erase 0xee000000 +$filesize
+    => cp.b $loadaddr 0xee000000 $filesize
+
+3. Program the kernel to NOR flash
+
+    => tftp $loadaddr uImage
+    => erase 0xee080000 +$filesize
+    => cp.b $loadaddr 0xee080000 $filesize
+
+4. Program the root filesystem to NOR flash
+
+    => tftp $loadaddr rootfs.jffs2
+    => erase 0xee800000 0xeff5ffff
+    => cp.b $loadaddr 0xee800000 $filesize
+
+5. Booting your new system
+
+    => setenv norboot 'setenv bootargs root=/dev/mtdblock2 rootfstype=jffs2 console=$consoledev,$baudrate;bootm 0xee080000 - 0xee000000'
+
+    If you want to set this boot option as default:
+
+    => setenv bootcmd 'run norboot'
+    => saveenv
+
+    ...or for a single boot:
+
+    => run norboot
+
+    You can login with user "root".
diff --git a/configs/freescale_p1010rdb_defconfig b/configs/freescale_p1010rdb_defconfig
new file mode 100644
index 0000000..a36f07c
--- /dev/null
+++ b/configs/freescale_p1010rdb_defconfig
@@ -0,0 +1,32 @@
+# Architecture
+BR2_powerpc=y
+BR2_powerpc_8548=y
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_JFFS2=y
+BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
+BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x20
+BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
+
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.8"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.8.config"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="p1010rdb"
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="P1010RDB_NOR"
+BR2_TARGET_UBOOT_2012_10=y
