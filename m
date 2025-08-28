Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE15CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B28A83B81;
	Thu, 28 Aug 2025 13:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjmVy_l5fkjf; Thu, 28 Aug 2025 13:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D974983BA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D974983BA9;
	Thu, 28 Aug 2025 13:26:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A9E2B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2538340D81
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88kNZAndqdWw for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:26:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF2BE40CFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF2BE40CFB
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF7C987CF4; Thu, 28 Aug 2025 13:26:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 15:01:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d1a7f52543dba79d014b9b230c0a4e3ae669895
X-Git-Newrev: ce76a11630241ed6560b13e5c55686e8441bebd0
X-Patchwork-Hint: ignore
Message-Id: <20250828132627.BF7C987CF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/galileo: remove defconfig, broken
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce76a11630241ed6560b13e5c55686e8441bebd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273310

It started to break not long ago, about 1 month ago, most likely due a
toolchain update:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dgalileo&kind=BUILD

However, it is build a very old 3.14, which is anyway unmaintained,
and issues with newer toolchains are going to get worse and worse.

Unless a fix is provided, this defconfig is going to be removed.

Cc: Nicholas Sielicki <sielicki@yandex.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                                |   4 -
 DEVELOPERS                                         |   4 -
 board/intel/galileo/genimage.cfg                   |  29 --
 board/intel/galileo/grub.cfg                       |  11 -
 board/intel/galileo/linux-3.14.config              | 311 ---------------------
 ...-x86-relocs-Make-per_cpu_load_addr-static.patch |  39 ---
 board/intel/galileo/post-build.sh                  |   2 -
 board/intel/galileo/post-image.sh                  |  13 -
 board/intel/galileo/readme.txt                     |  52 ----
 .../galileo/rootfs_overlay/etc/init.d/S09modload   |  33 ---
 .../etc/modules-load.galileo/galileo.conf          |   3 -
 .../etc/modules-load.galileo/galileo_gen2.conf     |   4 -
 configs/galileo_defconfig                          |  22 --
 13 files changed, 527 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index efbb8b9527..1a885e1b7a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -29,9 +29,6 @@ board/friendlyarm/nanopi-r2s/post-build.sh Shellcheck
 board/hardkernel/odroidc2/post-image.sh Shellcheck
 board/hardkernel/odroidc2/rootfs_overlay/etc/init.d/S09modload Shellcheck lib_sysv.Variables
 board/hardkernel/odroidxu4/post-image.sh Shellcheck lib_shellscript.EmptyLastLine
-board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch lib_patch.Upstream
-board/intel/galileo/post-build.sh Shellcheck
-board/intel/galileo/rootfs_overlay/etc/init.d/S09modload Shellcheck lib_sysv.Variables
 board/kontron/bl-imx8mm/post-build.sh Shellcheck
 board/kontron/smarc-sal28/post-build.sh Shellcheck
 board/lego/ev3/post-image.sh Shellcheck
@@ -131,7 +128,6 @@ configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
 configs/friendlyarm_nanopi_r2s_defconfig lib_defconfig.ForceCheckHash
-configs/galileo_defconfig lib_defconfig.ForceCheckHash
 configs/globalscale_espressobin_defconfig lib_defconfig.ForceCheckHash
 configs/imx23evk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabreauto_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 1acca2a2ba..38eeafc59d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2529,10 +2529,6 @@ F:	toolchain/toolchain-bare-metal-buildroot/
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
 
-N:	Nicholas Sielicki <sielicki@yandex.com>
-F:	board/intel/galileo/
-F:	configs/galileo_defconfig
-
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/bmap-tools/
 F:	package/composer/
diff --git a/board/intel/galileo/genimage.cfg b/board/intel/galileo/genimage.cfg
deleted file mode 100644
index 76c3d9c36e..0000000000
--- a/board/intel/galileo/genimage.cfg
+++ /dev/null
@@ -1,29 +0,0 @@
-# Create an image of the efi partition
-image efi-part.vfat {
-	vfat {
-		file EFI {
-			image = "efi-part/EFI"
-		}
-	}
-
-	size = 512K
-}
-
-# Create the sdcard image, pulling in
-#  * the image created by buildroot
-#  * the efi-partition created above
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		image = "efi-part.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext2"
-		size = 512M
-	}
-}
diff --git a/board/intel/galileo/grub.cfg b/board/intel/galileo/grub.cfg
deleted file mode 100644
index dde2f762f0..0000000000
--- a/board/intel/galileo/grub.cfg
+++ /dev/null
@@ -1,11 +0,0 @@
-set default="0"
-set timeout="0"
-
-menuentry "Buildroot" {
-	# Grub2 supports ext4, load the kernel from the Linux rootfs partition
-	# Set root tells grub to search the 2nd partition for the bzImage
-	set root=(hd0,msdos2)
-
-	# Set Linux to boot from the 2nd partition, SD/MMC support is baked into the kernel
-	linux /boot/bzImage root=/dev/mmcblk0p2 rootwait console=ttyS1,115200n8 earlycon=uart8250,mmio32,0x9000b000,115200n8 reboot=efi,warm apic=debug rw
-}
diff --git a/board/intel/galileo/linux-3.14.config b/board/intel/galileo/linux-3.14.config
deleted file mode 100644
index c658afb88e..0000000000
--- a/board/intel/galileo/linux-3.14.config
+++ /dev/null
@@ -1,311 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-# CONFIG_SWAP is not set
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
-CONFIG_KERNEL_LZMA=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=18
-CONFIG_CGROUPS=y
-CONFIG_CGROUP_FREEZER=y
-CONFIG_CPUSETS=y
-CONFIG_CGROUP_CPUACCT=y
-CONFIG_RESOURCE_COUNTERS=y
-CONFIG_CGROUP_SCHED=y
-CONFIG_NAMESPACES=y
-CONFIG_RELAY=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_RD_BZIP2=y
-CONFIG_RD_LZMA=y
-CONFIG_SYSCTL_SYSCALL=y
-# CONFIG_PCSPKR_PLATFORM is not set
-CONFIG_EMBEDDED=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_JUMP_LABEL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_LBDAF=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_BSD_DISKLABEL=y
-# CONFIG_ZONE_DMA is not set
-CONFIG_X86_INTEL_QUARK=y
-CONFIG_M586TSC=y
-CONFIG_X86_GENERIC=y
-CONFIG_HPET_TIMER=y
-CONFIG_PREEMPT_VOLUNTARY=y
-CONFIG_X86_UP_IOAPIC=y
-# CONFIG_X86_MCE_AMD is not set
-# CONFIG_X86_16BIT is not set
-CONFIG_X86_REBOOTFIXUPS=y
-CONFIG_MICROCODE=y
-CONFIG_X86_MSR=y
-CONFIG_X86_CPUID=y
-CONFIG_HIGHMEM64G=y
-# CONFIG_COMPACTION is not set
-# CONFIG_MTRR is not set
-# CONFIG_ARCH_RANDOM is not set
-CONFIG_EFI=y
-CONFIG_EFI_STUB=y
-CONFIG_EFI_CAPSULE=m
-CONFIG_HZ_100=y
-CONFIG_KEXEC=y
-CONFIG_PHYSICAL_START=0x400000
-CONFIG_PHYSICAL_ALIGN=0x1000000
-# CONFIG_COMPAT_VDSO is not set
-CONFIG_PM_RUNTIME=y
-CONFIG_PM_DEBUG=y
-CONFIG_PM_TRACE_RTC=y
-CONFIG_ACPI_PROCFS=y
-CONFIG_ACPI_PROCFS_POWER=y
-CONFIG_ACPI_EC_DEBUGFS=y
-# CONFIG_ACPI_BATTERY is not set
-# CONFIG_ACPI_FAN is not set
-CONFIG_ACPI_DEBUG=y
-CONFIG_ACPI_PCI_SLOT=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_PCI_MSI=y
-CONFIG_PCI_DEBUG=y
-CONFIG_PCI_IOAPIC=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_SYN_COOKIES=y
-# CONFIG_IPV6_SIT is not set
-CONFIG_IPV6_MULTIPLE_TABLES=y
-CONFIG_IPV6_SUBTREES=y
-CONFIG_VLAN_8021Q=m
-CONFIG_VLAN_8021Q_GVRP=y
-CONFIG_CAN=m
-# CONFIG_CAN_GW is not set
-CONFIG_CAN_J1939=m
-CONFIG_CAN_VCAN=m
-CONFIG_CAN_SLCAN=m
-# CONFIG_CAN_DEV is not set
-CONFIG_BT=m
-CONFIG_BT_RFCOMM=m
-CONFIG_BT_RFCOMM_TTY=y
-CONFIG_BT_BNEP=m
-CONFIG_BT_BNEP_MC_FILTER=y
-CONFIG_BT_BNEP_PROTO_FILTER=y
-CONFIG_BT_HIDP=m
-CONFIG_BT_HCIBTUSB=m
-CONFIG_CFG80211=m
-CONFIG_CFG80211_WEXT=y
-CONFIG_MAC80211=m
-CONFIG_MAC80211_LEDS=y
-CONFIG_RFKILL=m
-CONFIG_RFKILL_INPUT=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_FW_LOADER_USER_HELPER is not set
-CONFIG_DEBUG_DEVRES=y
-CONFIG_MTD=y
-CONFIG_MTD_BLOCK=m
-# CONFIG_PNP_DEBUG_MESSAGES is not set
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_LOOP_MIN_COUNT=2
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_COUNT=1
-CONFIG_BLK_DEV_RAM_SIZE=81920
-CONFIG_EEPROM_AT24=m
-CONFIG_EEPROM_93CX6=m
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_CONSTANTS=y
-CONFIG_SCSI_SPI_ATTRS=y
-# CONFIG_SCSI_LOWLEVEL is not set
-CONFIG_NETDEVICES=y
-CONFIG_TUN=y
-# CONFIG_NET_VENDOR_3COM is not set
-# CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
-# CONFIG_NET_VENDOR_AMD is not set
-# CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_VENDOR_ATHEROS is not set
-# CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_BROCADE is not set
-# CONFIG_NET_VENDOR_CHELSIO is not set
-# CONFIG_NET_VENDOR_CISCO is not set
-# CONFIG_NET_VENDOR_DEC is not set
-# CONFIG_NET_VENDOR_DLINK is not set
-# CONFIG_NET_VENDOR_EMULEX is not set
-# CONFIG_NET_VENDOR_EXAR is not set
-# CONFIG_NET_VENDOR_HP is not set
-# CONFIG_NET_VENDOR_I825XX is not set
-# CONFIG_NET_VENDOR_MARVELL is not set
-# CONFIG_NET_VENDOR_MELLANOX is not set
-# CONFIG_NET_VENDOR_MICREL is not set
-# CONFIG_NET_VENDOR_MICROCHIP is not set
-# CONFIG_NET_VENDOR_MYRI is not set
-# CONFIG_NET_VENDOR_NATSEMI is not set
-# CONFIG_NET_VENDOR_NVIDIA is not set
-# CONFIG_NET_VENDOR_OKI is not set
-# CONFIG_NET_PACKET_ENGINE is not set
-# CONFIG_NET_VENDOR_QLOGIC is not set
-# CONFIG_NET_VENDOR_REALTEK is not set
-# CONFIG_NET_VENDOR_RDC is not set
-# CONFIG_NET_VENDOR_SEEQ is not set
-# CONFIG_NET_VENDOR_SILAN is not set
-# CONFIG_NET_VENDOR_SIS is not set
-# CONFIG_NET_VENDOR_SMSC is not set
-CONFIG_STMMAC_ETH=y
-# CONFIG_STMMAC_PLATFORM is not set
-CONFIG_STMMAC_PCI=y
-# CONFIG_NET_VENDOR_SUN is not set
-# CONFIG_NET_VENDOR_TEHUTI is not set
-# CONFIG_NET_VENDOR_TI is not set
-# CONFIG_NET_VENDOR_VIA is not set
-# CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_PHYLIB=y
-CONFIG_PPP=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPP_ASYNC=m
-# CONFIG_RTL_CARDS is not set
-# CONFIG_INPUT_MOUSEDEV is not set
-CONFIG_INPUT_EVDEV=m
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_LEGACY_PTY_COUNT=32
-CONFIG_SERIAL_NONSTANDARD=y
-CONFIG_SERIAL_8250=y
-# CONFIG_SERIAL_8250_PNP is not set
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_SERIAL_8250_PCI is not set
-CONFIG_SERIAL_8250_NR_UARTS=8
-CONFIG_SERIAL_8250_RUNTIME_UARTS=2
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_8250_DETECT_IRQ=y
-CONFIG_SERIAL_8250_RSA=y
-CONFIG_SERIAL_8250_DW=y
-CONFIG_SERIAL_SC16IS7XX=m
-CONFIG_SERIAL_SC16IS7XX_SPI=m
-# CONFIG_HW_RANDOM is not set
-CONFIG_HPET=y
-# CONFIG_HPET_MMAP is not set
-CONFIG_I2C=y
-CONFIG_SPI_DEBUG=y
-CONFIG_SPI_GPIO=y
-CONFIG_SPI_PXA2XX=y
-CONFIG_PTP_1588_CLOCK=y
-CONFIG_GPIO_SCH=y
-CONFIG_GPIO_PCA953X=y
-CONFIG_GPIO_PCA953X_IRQ=y
-CONFIG_GPIO_PCF857X=y
-CONFIG_HWMON=m
-CONFIG_SENSORS_LM75=m
-# CONFIG_X86_PKG_TEMP_THERMAL is not set
-CONFIG_MFD_INTEL_QUARK_HSUART_DMA=y
-CONFIG_CY8C9540A=m
-CONFIG_MFD_PCA9685=m
-CONFIG_INTEL_QRK_GIP=m
-CONFIG_INTEL_QRK_GIP_TEST=m
-CONFIG_MEDIA_SUPPORT=m
-CONFIG_MEDIA_CAMERA_SUPPORT=y
-CONFIG_MEDIA_USB_SUPPORT=y
-CONFIG_USB_VIDEO_CLASS=m
-# CONFIG_USB_GSPCA is not set
-# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
-# CONFIG_VGA_ARB is not set
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_SOUND=m
-CONFIG_SND=m
-CONFIG_SND_USB_AUDIO=m
-CONFIG_USB=m
-# CONFIG_USB_DEFAULT_PERSIST is not set
-CONFIG_USB_EHCI_HCD=m
-CONFIG_USB_OHCI_HCD=m
-CONFIG_USB_UHCI_HCD=m
-CONFIG_USB_ACM=m
-CONFIG_USB_STORAGE=m
-CONFIG_USB_SERIAL=m
-CONFIG_USB_SERIAL_GENERIC=y
-CONFIG_USB_SERIAL_PL2303=m
-CONFIG_USB_GADGET=m
-CONFIG_USB_EG20T=m
-CONFIG_USB_ZERO=m
-CONFIG_USB_ETH=m
-CONFIG_USB_MASS_STORAGE=m
-CONFIG_USB_G_SERIAL=y
-CONFIG_USB_G_ACM_MS=m
-CONFIG_MMC=y
-CONFIG_MMC_UNSAFE_RESUME=y
-CONFIG_MMC_SDHCI=y
-CONFIG_MMC_SDHCI_PCI=y
-CONFIG_MMC_SDHCI_PLTFM=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=m
-CONFIG_RTC_CLASS=y
-# CONFIG_RTC_SYSTOHC is not set
-CONFIG_DMADEVICES=y
-CONFIG_DW_DMAC=y
-CONFIG_UIO=y
-CONFIG_STAGING=y
-CONFIG_INTEL_QRK_THERMAL=y
-CONFIG_INTEL_QRK_AUDIO_CTRL=m
-CONFIG_INTEL_QRK_J1708=m
-CONFIG_INTEL_QRK_ESRAM=y
-# CONFIG_IOMMU_SUPPORT is not set
-CONFIG_IIO=y
-CONFIG_IIO_BUFFER_CB=y
-CONFIG_IIO_LIS331DLH_INTEL_QRK=y
-CONFIG_IIO_ST_ACCEL_3AXIS=y
-CONFIG_AD7298=m
-CONFIG_ADC1x8S102=m
-CONFIG_IIO_SYSFS_TRIGGER=m
-CONFIG_IIO_HRTIMER_TRIGGER=m
-CONFIG_PWM=y
-CONFIG_DMI_SYSFS=y
-CONFIG_EFI_VARS=m
-# CONFIG_EFI_RUNTIME_MAP is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
-CONFIG_EXT4_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_HUGETLBFS=y
-# CONFIG_MISC_FILESYSTEMS is not set
-CONFIG_NLS_DEFAULT="utf8"
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_CODEPAGE_850=y
-CONFIG_NLS_ASCII=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_PRINTK_TIME=y
-# CONFIG_ENABLE_WARN_DEPRECATED is not set
-CONFIG_FRAME_WARN=2048
-# CONFIG_UNUSED_SYMBOLS is not set
-CONFIG_HEADERS_CHECK=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_MEMORY_INIT=y
-CONFIG_DEBUG_STACKOVERFLOW=y
-CONFIG_TIMER_STATS=y
-CONFIG_LATENCYTOP=y
-# CONFIG_FTRACE is not set
-CONFIG_X86_PTDUMP=y
-# CONFIG_DEBUG_RODATA_TEST is not set
-CONFIG_DEBUG_SET_MODULE_RONX=y
-# CONFIG_DOUBLEFAULT is not set
-CONFIG_OPTIMIZE_INLINING=y
-CONFIG_KEYS=y
-CONFIG_KEYS_DEBUG_PROC_KEYS=y
-CONFIG_SECURITY=y
-CONFIG_SECURITY_NETWORK=y
-# CONFIG_VIRTUALIZATION is not set
-CONFIG_CRC_T10DIF=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_IP_PNP=y
diff --git a/board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch b/board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch
deleted file mode 100644
index 1d206cc6d1..0000000000
--- a/board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From eeeda4cd06e828b331b15741a204ff9f5874d28d Mon Sep 17 00:00:00 2001
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Wed, 24 Sep 2014 13:30:12 +0100
-Subject: [PATCH] x86/relocs: Make per_cpu_load_addr static
-
-per_cpu_load_addr is only used for 64-bit relocations, but is
-declared in both configurations of relocs.c - with different
-types.  This has undefined behaviour in general.  GNU ld is
-documented to use the larger size in this case, but other tools
-may differ and some warn about this.
-
-References: https://bugs.debian.org/748577
-Reported-by: Michael Tautschnig <mt@debian.org>
-Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
-Cc: 748577@bugs.debian.org
-Cc: Linus Torvalds <torvalds@linux-foundation.org>
-Link: http://lkml.kernel.org/r/1411561812.3659.23.camel@decadent.org.uk
-Signed-off-by: Ingo Molnar <mingo@kernel.org>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- arch/x86/tools/relocs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
-index bbb1d2259ecf..a5efb21d5228 100644
---- a/arch/x86/tools/relocs.c
-+++ b/arch/x86/tools/relocs.c
-@@ -695,7 +695,7 @@ static void walk_relocs(int (*process)(struct section *sec, Elf_Rel *rel,
-  *
-  */
- static int per_cpu_shndx	= -1;
--Elf_Addr per_cpu_load_addr;
-+static Elf_Addr per_cpu_load_addr;
- 
- static void percpu_init(void)
- {
--- 
-2.25.1
-
diff --git a/board/intel/galileo/post-build.sh b/board/intel/galileo/post-build.sh
deleted file mode 100755
index 2b34cb43b8..0000000000
--- a/board/intel/galileo/post-build.sh
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh -e
-cp board/intel/galileo/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
diff --git a/board/intel/galileo/post-image.sh b/board/intel/galileo/post-image.sh
deleted file mode 100755
index f9aef0b1ba..0000000000
--- a/board/intel/galileo/post-image.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh -e
-
-GENIMAGE_CFG="board/intel/galileo/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-    --rootpath "${TARGET_DIR}" \
-    --tmppath "${GENIMAGE_TMP}" \
-    --inputpath "${BINARIES_DIR}" \
-    --outputpath "${BINARIES_DIR}" \
-    --config "${GENIMAGE_CFG}"
diff --git a/board/intel/galileo/readme.txt b/board/intel/galileo/readme.txt
deleted file mode 100644
index 7a3abd4f71..0000000000
--- a/board/intel/galileo/readme.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-
-Intel Galileo Gen 1/2
-
-Intro
-============
-
-These instructions apply to both the Intel Galileo Gen 1/2 development boards
-based on the Intel Quark X1000.
-
-How to build
-============
-
-Apply the defconfig for the Intel Galileo Gen 1/2
-
- $ make galileo_defconfig
-
-Add any additional packages required and build.
-
- $ make
-
-The build process will create a SD card image and place it in output/images.
-
- $ ls -lh output/images/sdcard.img
- -rw-r--r--. 1 foo foo 11M Nov 17 16:19 output/images/sdcard.img
-
-Write the image to an mSD card, insert into the Galileo and power on.
-
- $ dd if=output/images/sdcard.img of=/dev/mmcblk0; sync
-
-Accessing the console
-=====================
-
-During power-on the console will become available on the Galileo's ttyS1. This 
-may be accessed as follows.
-
- * Galileo Gen 1
-
-	http://clayskits.com/products/galileo-gen-1-serial-cable
-
-	A USB to RS-232 to 3.5mm Jack cable is required. Connect to the 3.5mm
-	Jack next to the Ethernet Header.
-
- * Galileo Gen 2
-
-	http://www.ftdichip.com/Products/Cables/USBTTLSerial.htm
-
-	A FTDI TTL-232R-3V3 cable may be used to connect to the FTDI header 
-	next to the Ethernet connector on the Galileo Gen 2. 
-
-The console should now be visible at 115200 baud.
-
- $ picocom -b 115200 /dev/ttyUSB0
diff --git a/board/intel/galileo/rootfs_overlay/etc/init.d/S09modload b/board/intel/galileo/rootfs_overlay/etc/init.d/S09modload
deleted file mode 100755
index 359d607c18..0000000000
--- a/board/intel/galileo/rootfs_overlay/etc/init.d/S09modload
+++ /dev/null
@@ -1,33 +0,0 @@
-#!/bin/sh
-#
-
-load_drivers()
-{
-	while IFS= read -r line; do
-		modprobe $line
-	done < "/etc/modules-load.galileo/$1.conf"
-}
-
-do_board()
-{
-	board=$(cat /sys/devices/virtual/dmi/id/board_name)
-	case "$board" in
-		*"GalileoGen2" )
-			load_drivers "galileo_gen2" ;;
-		*"Galileo" )
-			load_drivers "galileo" ;;
-	esac
-}
-
-case "$1" in
-	start)
-		do_board
-		;;
-	stop)
-		;;
-	restart|reload)
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart}"
-		exit 1
-esac
diff --git a/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo.conf b/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo.conf
deleted file mode 100644
index b658261946..0000000000
--- a/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-intel_qrk_gip
-cy8c9540a
-ad7298
diff --git a/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo_gen2.conf b/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo_gen2.conf
deleted file mode 100644
index 4f80a3301f..0000000000
--- a/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo_gen2.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-intel_qrk_gip
-gpio-pca953x
-pca9685
-adc1x8s102
diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
deleted file mode 100644
index 59dd2dec9a..0000000000
--- a/configs/galileo_defconfig
+++ /dev/null
@@ -1,22 +0,0 @@
-BR2_x86_x1000=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
-BR2_GLOBAL_PATCH_DIR="board/intel/galileo/patches"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_OVERLAY="board/intel/galileo/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/galileo/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/galileo/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,mdr78,Linux-x1000,8b3c9d8ce1656a26b1097d9091d53bfb39fef640)/linux-8b3c9d8ce1656a26b1097d9091d53bfb39fef640.tar.gz"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.14.config"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_GRUB2=y
-BR2_TARGET_GRUB2_I386_EFI=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
