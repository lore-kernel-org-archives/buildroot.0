From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon,  7 Jul 2014 14:46:49 -0400
Subject: [Buildroot] [PATCH] configs: add defconfig for TS-5x00 SBCs
Message-ID: <1404758809-21008-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the TS-5x00 serie of Technologic Systems
x86-based Single Board Computers, featuring an AMD Elan520 processor.

http://wiki.embeddedarm.com/wiki/#AMD

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 .../ts5x00/fs-overlay/boot/syslinux/syslinux.cfg   |   9 ++
 board/ts/ts5x00/linux-3.15.config                  | 113 +++++++++++++++++++++
 .../linux/linux-001-add-support-for-ts5400.patch   |  98 ++++++++++++++++++
 board/ts/ts5x00/readme.txt                         |  54 ++++++++++
 configs/ts5x00_defconfig                           |  11 ++
 5 files changed, 285 insertions(+)
 create mode 100644 board/ts/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg
 create mode 100644 board/ts/ts5x00/linux-3.15.config
 create mode 100644 board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch
 create mode 100644 board/ts/ts5x00/readme.txt
 create mode 100644 configs/ts5x00_defconfig

diff --git a/board/ts/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg b/board/ts/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg
new file mode 100644
index 0000000..64f8187
--- /dev/null
+++ b/board/ts/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg
@@ -0,0 +1,9 @@
+SERIAL 1 115200
+CONSOLE 0
+
+DEFAULT linux
+
+LABEL linux
+  SAY Now booting the kernel from SYSLINUX...
+  LINUX /boot/bzImage
+  APPEND console=ttyS1,115200n8 root=/dev/sda1 rootfstype=ext4 rw
diff --git a/board/ts/ts5x00/linux-3.15.config b/board/ts/ts5x00/linux-3.15.config
new file mode 100644
index 0000000..60cd8a0
--- /dev/null
+++ b/board/ts/ts5x00/linux-3.15.config
@@ -0,0 +1,113 @@
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_X86_EXTENDED_PLATFORM is not set
+CONFIG_MELAN=y
+CONFIG_X86_GENERIC=y
+CONFIG_X86_REBOOTFIXUPS=y
+CONFIG_NOHIGHMEM=y
+# CONFIG_COMPACTION is not set
+# CONFIG_BOUNCE is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+# CONFIG_RELOCATABLE is not set
+# CONFIG_SUSPEND is not set
+# CONFIG_ACPI is not set
+CONFIG_CPU_IDLE=y
+CONFIG_TS5500=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_BLK_DEV is not set
+CONFIG_BLK_DEV_SD=y
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+CONFIG_ATA_GENERIC=y
+CONFIG_PATA_LEGACY=y
+CONFIG_NETDEVICES=y
+# CONFIG_NET_CORE is not set
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_ALTEON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ATHEROS is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+CONFIG_NET_TULIP=y
+CONFIG_DM9102=y
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_EXAR is not set
+# CONFIG_NET_VENDOR_HP is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_PACKET_ENGINE is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_REALTEK is not set
+# CONFIG_NET_VENDOR_RDC is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
+# CONFIG_NET_VENDOR_TI is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_PHYLIB=y
+CONFIG_DAVICOM_PHY=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_TS5500=y
+CONFIG_SENSORS_MAX197=y
+CONFIG_WATCHDOG=y
+CONFIG_SC520_WDT=y
+CONFIG_USB=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_FTDI_SIO=y
+CONFIG_USB_SERIAL_PL2303=y
+# CONFIG_X86_PLATFORM_DEVICES is not set
+# CONFIG_IOMMU_SUPPORT is not set
+# CONFIG_DMIID is not set
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_15=y
+CONFIG_NLS_UTF8=y
+# CONFIG_VIRTUALIZATION is not set
+CONFIG_XZ_DEC=y
diff --git a/board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch b/board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch
new file mode 100644
index 0000000..72b5252
--- /dev/null
+++ b/board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch
@@ -0,0 +1,98 @@
+diff --git a/arch/x86/platform/ts5500/ts5500.c b/arch/x86/platform/ts5500/ts5500.c
+index 9471b94..127fce2 100644
+--- a/arch/x86/platform/ts5500/ts5500.c
++++ b/arch/x86/platform/ts5500/ts5500.c
+@@ -31,7 +31,6 @@
+ 
+ /* Product code register */
+ #define TS5500_PRODUCT_CODE_ADDR	0x74
+-#define TS5500_PRODUCT_CODE		0x60	/* TS-5500 product code */
+ 
+ /* SRAM/RS-485/ADC options, and RS-485 RTS/Automatic RS-485 flags register */
+ #define TS5500_SRAM_RS485_ADC_ADDR	0x75
+@@ -64,9 +63,17 @@
+ #define TS5500_ADC_CONV_MSB_ADDR	0x197	/* MSB register */
+ #define TS5500_ADC_CONV_DELAY		12	/* usec */
+ 
++static const struct ts5x00_info {
++	const int id;
++	const char * const name;
++} ts5x00_info[] = {
++	{ 0x40, "TS-5400" },
++	{ 0x60, "TS-5500" },
++};
++
+ /**
+  * struct ts5500_sbc - TS-5500 board description
+- * @id:		Board product ID.
++ * @info:	Board identification.
+  * @sram:	Flag for SRAM option.
+  * @rs485:	Flag for RS-485 option.
+  * @adc:	Flag for Analog/Digital converter option.
+@@ -75,7 +82,7 @@
+  * @jumpers:	Bitfield for jumpers' state.
+  */
+ struct ts5500_sbc {
+-	int	id;
++	const struct ts5x00_info *info;
+ 	bool	sram;
+ 	bool	rs485;
+ 	bool	adc;
+@@ -117,18 +124,21 @@ static int __init ts5500_check_signature(void)
+ static int __init ts5500_detect_config(struct ts5500_sbc *sbc)
+ {
+ 	u8 tmp;
++	int i;
+ 	int ret = 0;
+ 
+ 	if (!request_region(TS5500_PRODUCT_CODE_ADDR, 4, "ts5500"))
+ 		return -EBUSY;
+ 
+ 	tmp = inb(TS5500_PRODUCT_CODE_ADDR);
+-	if (tmp != TS5500_PRODUCT_CODE) {
+-		pr_err("This platform is not a TS-5500 (found ID 0x%x)\n", tmp);
++	for (i = 0; i < ARRAY_SIZE(ts5x00_info) && !sbc->info; ++i)
++		if (tmp == ts5x00_info[i].id)
++			sbc->info = &ts5x00_info[i];
++	if (!sbc->info) {
++		pr_err("Not a known TS-5x00 platform (found ID 0x%x)\n", tmp);
+ 		ret = -ENODEV;
+ 		goto cleanup;
+ 	}
+-	sbc->id = tmp;
+ 
+ 	tmp = inb(TS5500_SRAM_RS485_ADC_ADDR);
+ 	sbc->sram = tmp & TS5500_SRAM;
+@@ -152,7 +162,15 @@ static ssize_t ts5500_show_id(struct device *dev,
+ {
+ 	struct ts5500_sbc *sbc = dev_get_drvdata(dev);
+ 
+-	return sprintf(buf, "0x%.2x\n", sbc->id);
++	return sprintf(buf, "0x%.2x\n", sbc->info->id);
++}
++
++static ssize_t ts5500_show_name(struct device *dev,
++			        struct device_attribute *attr, char *buf)
++{
++	struct ts5500_sbc *sbc = dev_get_drvdata(dev);
++
++	return sprintf(buf, "%s\n", sbc->info->name);
+ }
+ 
+ static ssize_t ts5500_show_jumpers(struct device *dev,
+@@ -180,6 +198,7 @@ TS5500_SHOW(ereset)
+ TS5500_SHOW(itr)
+ 
+ static DEVICE_ATTR(id, S_IRUGO, ts5500_show_id, NULL);
++static DEVICE_ATTR(name, S_IRUGO, ts5500_show_name, NULL);
+ static DEVICE_ATTR(jumpers, S_IRUGO, ts5500_show_jumpers, NULL);
+ static DEVICE_ATTR(sram, S_IRUGO, ts5500_show_sram, NULL);
+ static DEVICE_ATTR(rs485, S_IRUGO, ts5500_show_rs485, NULL);
+@@ -189,6 +208,7 @@ static DEVICE_ATTR(itr, S_IRUGO, ts5500_show_itr, NULL);
+ 
+ static struct attribute *ts5500_attributes[] = {
+ 	&dev_attr_id.attr,
++	&dev_attr_name.attr,
+ 	&dev_attr_jumpers.attr,
+ 	&dev_attr_sram.attr,
+ 	&dev_attr_rs485.attr,
diff --git a/board/ts/ts5x00/readme.txt b/board/ts/ts5x00/readme.txt
new file mode 100644
index 0000000..2b056f2
--- /dev/null
+++ b/board/ts/ts5x00/readme.txt
@@ -0,0 +1,54 @@
+Technologic Systems TS-5x00 SBCs
+================================
+
+This document explains how to set up a basic Buildroot system for the 
+Technologic Systems TS-5x00 serie of x86-based Single Board Computers.
+
+TS-5x00 Single Board Computers are based on the AMD Elan520 processor. For more 
+information please have a look at http://wiki.embeddedarm.com/wiki/#AMD
+
+The kernel configuration works for any AMD Elan520-based SBCs, but the support 
+is enhanced for the TS-5500 and TS-5400 models (on-board devices registration 
+and additional sysfs attributes under /sys/devices/platform/).
+
+To build the default configuration you only have to:
+
+    $ make ts5x00_defconfig
+    $ make
+
+You will need a Compact Flash card of sufficient size and the first or only
+partition configured as Linux type, with the bootable flag.
+
+To transfer the system to the card do:
+
+    # dd if=output/images/rootfs.ext4 of=/dev/sdX1
+
+You can optionally extend the filesystem size to the whole partition:
+
+    # resize2fs /dev/sdX1
+
+You can also update the card image without completely rewriting it:
+
+    # mount /dev/sdX1 /mnt
+    # tar -pxf output/images/rootfs.tar -C /mnt
+    # umount /mnt
+
+To install the bootloader, you will need to copy the MBR:
+
+    # cat output/images/syslinux/mbr.bin > /dev/sdX
+
+Then install SYSLINUX in the mounted partition:
+
+    # mount /dev/sdX1 /mnt
+    # output/host/sbin/extlinux --install /mnt/boot/syslinux
+    # umount /mnt
+
+IMPORTANT: In order for the board to boot the Compact Flash with a recent 
+config, the BIOS must use Logical Block Addressing (LBA). You can do it by 
+choosing "Ide 0: AUTOCONFIG, LBA" under "IDE DRIVE GEOMETRY" in the "Basic CMOS 
+Configuration" screen. For details about the CMOS setup, please see: 
+http://wiki.embeddedarm.com/wiki/TS-5500#System_BIOS_Setup_Screens
+
+Connect a terminal program to the rs232 connector marked "COM2"
+with baudrate set to 115200, insert the Compact Flash card into the socket, 
+power up the board, and enjoy.
diff --git a/configs/ts5x00_defconfig b/configs/ts5x00_defconfig
new file mode 100644
index 0000000..9f0f4dd
--- /dev/null
+++ b/configs/ts5x00_defconfig
@@ -0,0 +1,11 @@
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
+BR2_ROOTFS_OVERLAY="board/ts/ts5x00/fs-overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_PATCH="board/ts/ts5x00/patches/linux/"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ts/ts5x00/linux-3.15.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_SYSLINUX=y
+BR2_TARGET_SYSLINUX_MBR=y
-- 
1.9.1
