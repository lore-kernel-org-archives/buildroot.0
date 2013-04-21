From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:51:24 +0200
Subject: [Buildroot] [git commit] configs: add sample for freescale
	mpc8315erdb
Message-ID: <20130421215213.045CF9B7A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5260f30b2e702d9441f65f60e708b561935cc80f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/freescale/mpc8315erdb/linux-3.8.config |  107 ++++++++++++++++++++++++++
 board/freescale/mpc8315erdb/readme.txt       |   62 +++++++++++++++
 configs/freescale_mpc8315erdb_defconfig      |   33 ++++++++
 3 files changed, 202 insertions(+), 0 deletions(-)

diff --git a/board/freescale/mpc8315erdb/linux-3.8.config b/board/freescale/mpc8315erdb/linux-3.8.config
new file mode 100644
index 0000000..120314c
--- /dev/null
+++ b/board/freescale/mpc8315erdb/linux-3.8.config
@@ -0,0 +1,107 @@
+CONFIG_EXPERIMENTAL=y
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_EXPERT=y
+# CONFIG_KALLSYMS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_PPC_CHRP is not set
+# CONFIG_PPC_PMAC is not set
+CONFIG_PPC_83xx=y
+CONFIG_MPC831x_RDB=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_SPARSE_IRQ=y
+CONFIG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_SYN_COOKIES=y
+# CONFIG_INET_LRO is not set
+# CONFIG_IPV6 is not set
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+# CONFIG_FW_LOADER is not set
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_FSL_ELBC=y
+CONFIG_PROC_DEVICETREE=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=32768
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_SPI_ATTRS=y
+CONFIG_ATA=y
+CONFIG_SATA_FSL=y
+CONFIG_MD=y
+CONFIG_BLK_DEV_MD=y
+CONFIG_MD_LINEAR=y
+CONFIG_MD_RAID0=y
+CONFIG_MD_RAID1=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_ETHERNET=y
+CONFIG_NET_PCI=y
+CONFIG_E100=y
+CONFIG_GIANFAR=y
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MPC=y
+CONFIG_SPI=y
+CONFIG_SPI_BITBANG=y
+CONFIG_WATCHDOG=y
+CONFIG_VIDEO_OUTPUT_CONTROL=m
+# CONFIG_USB_HID is not set
+CONFIG_USB=y
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_MON=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_FSL=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PPC_OF_BE=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_NET2280=y
+CONFIG_USB_ETH=m
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_INTF_DEV_UIE_EMUL=y
+CONFIG_RTC_DRV_DS1307=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_INOTIFY=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_JFFS2_FS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_NFS_V4=y
+CONFIG_ROOT_NFS=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DETECT_HUNG_TASK=y
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+CONFIG_CRYPTO_PCBC=m
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/board/freescale/mpc8315erdb/readme.txt b/board/freescale/mpc8315erdb/readme.txt
new file mode 100644
index 0000000..91e58e4
--- /dev/null
+++ b/board/freescale/mpc8315erdb/readme.txt
@@ -0,0 +1,62 @@
+
+******************** WARNING ********************
+The compiled U-Boot binary is intended for NAND flash only!
+It won't work for NOR and will brick that bootloader!
+
+Also don't go playing around with different U-boot versions or flash targets
+unless you've got the necessary hardware and/or know-how to unbrick your kit.
+
+2012.10 is known good for NAND.
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
+Remember to set the MPC8315ERDB switches to NAND boot if you want to use
+your newly built U-Boot.
+
+1. Program the new U-Boot binary to NAND flash (optional)
+    If you don't feel confident upgrading your bootloader then don't do it,
+    it's unnecessary most of the time.
+
+    => tftp $loadaddr u-boot-nand.bin
+    => nand erase 0 0x80000
+    => nand write $loadaddr 0 0x80000 $filesize
+
+2. Program the kernel to NAND flash
+
+    => tftp $loadaddr uImage
+    => nand erase 0x100000 0x1e0000
+    => nand write $loadaddr 0x100000 0x1e0000
+
+3. Program the DTB to NAND flash
+
+    => tftp $loadaddr mpc8315erdb.dtb
+    => nand erase 0x2e0000 0x20000
+    => nand write $loadaddr 0x2e0000 0x20000
+
+4. Program the root filesystem to NAND flash
+
+    => tftp $loadaddr rootfs.jffs2
+    => nand erase 0x400000 0x1c00000
+    => nand write $loadaddr 0x400000 $filesize
+
+5. Booting your new system
+
+    => setenv nandboot 'setenv bootargs root=/dev/mtdblock3 rootfstype=jffs2 console=$consoledev,$baudrate;nand read $fdtaddr 0x2e0000 0x20000;nand read $loadaddr 0x100000 0x1e0000;bootm $loadaddr - $fdtaddr'
+
+    If you want to set this boot option as default:
+
+    => setenv bootcmd 'run nandboot'
+    => saveenv
+
+    ...or for a single boot:
+
+    => run nandboot
+
+    You can login with user "root".
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
new file mode 100644
index 0000000..9f733fa
--- /dev/null
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -0,0 +1,33 @@
+# Architecture
+BR2_powerpc=y
+BR2_powerpc_e300c3=y
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_JFFS2=y
+BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
+BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x200
+BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x4000
+BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
+
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.8"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.8.config"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="mpc8315erdb"
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="MPC8315ERDB_NAND"
+BR2_TARGET_UBOOT_2012_10=y
