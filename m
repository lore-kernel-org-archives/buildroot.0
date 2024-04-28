Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FA0C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 583C66071A;
	Sun, 28 Apr 2024 18:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCZiwF2-o3DK; Sun, 28 Apr 2024 18:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D726071E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10D726071E;
	Sun, 28 Apr 2024 18:28:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7A01BF5A8
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 021A981FC4
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Nkk-gzfVW_X for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D83AC81FBD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D83AC81FBD
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0C2086187; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 20:14:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c592ecd3e599598856668736468b3ee54d8ceee
X-Git-Newrev: d9e6d2d0813317427e0a83e8635c277aaf1d8cdd
X-Patchwork-Hint: ignore
Message-Id: <20240428182741.D0C2086187@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/visionfive2: update kernel to
 upstream 6.8.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9e6d2d0813317427e0a83e8635c277aaf1d8cdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configuration is based on defconfig from starfive's kernel fork [1].

[1] https://github.com/starfive-tech/linux/blob/076ede06c00a4069cd9f90d609eaf35bf1bdc68a/arch/riscv/configs/starfive_visionfive2_defconfig

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/visionfive2/linux_defconfig                  | 234 +++++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf            |   2 +-
 configs/visionfive2_defconfig                      |  10 +-
 3 files changed, 240 insertions(+), 6 deletions(-)

diff --git a/board/visionfive2/linux_defconfig b/board/visionfive2/linux_defconfig
new file mode 100644
index 0000000000..d6d1a65247
--- /dev/null
+++ b/board/visionfive2/linux_defconfig
@@ -0,0 +1,234 @@
+CONFIG_SYSVIPC=y
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PSI=y
+# CONFIG_CPU_ISOLATION is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_NAMESPACES=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_EXPERT=y
+# CONFIG_SYSFS_SYSCALL is not set
+CONFIG_PERF_EVENTS=y
+CONFIG_SOC_STARFIVE=y
+CONFIG_ERRATA_SIFIVE=y
+CONFIG_NONPORTABLE=y
+CONFIG_SMP=y
+# CONFIG_RISCV_ISA_SVPBMT is not set
+# CONFIG_COMPAT is not set
+CONFIG_HIBERNATION=y
+CONFIG_CPU_IDLE=y
+CONFIG_RISCV_SBI_CPUIDLE=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
+CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_JUMP_LABEL=y
+# CONFIG_STACKPROTECTOR is not set
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_COMPRESS_ZSTD=y
+# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
+CONFIG_BLK_WBT=y
+# CONFIG_BLK_DEBUG_FS is not set
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+CONFIG_KSM=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_PNP=y
+CONFIG_INET_DIAG=m
+# CONFIG_IPV6_SIT is not set
+CONFIG_IPV6_MULTIPLE_TABLES=y
+# CONFIG_WIRELESS is not set
+# CONFIG_ETHTOOL_NETLINK is not set
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+CONFIG_FW_LOADER=m
+CONFIG_SIFIVE_CCACHE=y
+CONFIG_EFI_DISABLE_RUNTIME=y
+CONFIG_MTD=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_ZRAM=y
+CONFIG_ZRAM_MEMORY_TRACKING=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=1
+CONFIG_BLK_DEV_NVME=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_NETDEVICES=y
+CONFIG_STMMAC_ETH=y
+CONFIG_DWMAC_DWC_QOS_ETH=y
+# CONFIG_DWMAC_GENERIC is not set
+CONFIG_DWMAC_STARFIVE=y
+CONFIG_MICROCHIP_PHY=y
+CONFIG_MOTORCOMM_PHY=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_LDISC_AUTOLOAD is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=6
+CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_JH7110=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=y
+# CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_SPI=y
+CONFIG_SPI_CADENCE_QUADSPI=y
+CONFIG_SPI_PL022=y
+CONFIG_SPI_SPIDEV=y
+# CONFIG_PTP_1588_CLOCK is not set
+CONFIG_GPIOLIB_FASTPATH_LIMIT=128
+CONFIG_GPIO_SYSFS=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+CONFIG_SENSORS_SFCTEMP=y
+CONFIG_THERMAL=y
+CONFIG_CPU_THERMAL=y
+CONFIG_THERMAL_EMULATION=y
+CONFIG_WATCHDOG=y
+CONFIG_MFD_AXP20X_I2C=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_CADENCE_CSI2RX=y
+CONFIG_VIDEO_IMX219=y
+CONFIG_DRM=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y
+CONFIG_SND_DESIGNWARE_I2S=y
+CONFIG_SND_SOC_STARFIVE=y
+CONFIG_SND_SOC_JH7110_PWMDAC=y
+CONFIG_SND_SOC_JH7110_TDM=y
+CONFIG_SND_SOC_WM8960=y
+CONFIG_SND_SIMPLE_CARD=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
+CONFIG_USB_CDNS_SUPPORT=y
+CONFIG_USB_CDNS3=y
+CONFIG_USB_CDNS3_GADGET=y
+CONFIG_USB_CDNS3_HOST=y
+CONFIG_USB_CDNS3_STARFIVE=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_F_FS=y
+CONFIG_MMC=y
+# CONFIG_PWRSEQ_EMMC is not set
+# CONFIG_PWRSEQ_SIMPLE is not set
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_STARFIVE=y
+CONFIG_DMADEVICES=y
+CONFIG_AMBA_PL08X=y
+CONFIG_DW_AXI_DMAC=y
+CONFIG_DMATEST=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_STAGING=y
+CONFIG_STAGING_MEDIA=y
+CONFIG_VIDEO_STARFIVE_CAMSS=y
+CONFIG_CLK_STARFIVE_JH7110_AON=y
+CONFIG_CLK_STARFIVE_JH7110_STG=y
+CONFIG_CLK_STARFIVE_JH7110_ISP=y
+CONFIG_CLK_STARFIVE_JH7110_VOUT=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_PWM=y
+CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=y
+CONFIG_PHY_STARFIVE_JH7110_PCIE=y
+CONFIG_PHY_STARFIVE_JH7110_USB=y
+CONFIG_EXT4_FS=y
+CONFIG_BTRFS_FS=y
+CONFIG_BTRFS_FS_POSIX_ACL=y
+# CONFIG_DNOTIFY is not set
+CONFIG_FANOTIFY=y
+CONFIG_AUTOFS_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_UTF8=y
+CONFIG_EXFAT_FS=y
+CONFIG_NTFS_FS=y
+CONFIG_NTFS_RW=y
+CONFIG_PROC_KCORE=y
+CONFIG_PROC_CHILDREN=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_EFIVAR_FS=y
+CONFIG_JFFS2_FS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_DEFAULT="iso8859-15"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_15=y
+CONFIG_LSM=""
+CONFIG_CRYPTO_ZSTD=y
+# CONFIG_RAID6_PQ_BENCHMARK is not set
+# CONFIG_DEBUG_MISC is not set
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_SECTION_MISMATCH=y
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_SLUB_DEBUG is not set
+CONFIG_DEBUG_RODATA_TEST=y
+CONFIG_DEBUG_WX=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
+CONFIG_WQ_WATCHDOG=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_STACKTRACE=y
+CONFIG_RCU_CPU_STALL_TIMEOUT=60
+# CONFIG_RCU_TRACE is not set
+# CONFIG_FTRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
index 6e2c5660d6..fd772f3675 100644
--- a/board/visionfive2/overlay/boot/extlinux/extlinux.conf
+++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label linux
   kernel /boot/Image
-  devicetree /boot/jh7110-visionfive-v2.dtb
+  devicetree /boot/jh7110-starfive-visionfive-2-v1.3b.dtb
   append console=ttyS0,115200 root=/dev/mmcblk1p3
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index c8576a35a7..247854d4d1 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -1,15 +1,15 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive2/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,05533e9c31d6f0da20efc2d436a3b0f6d516ed4b)/linux-05533e9c31d6f0da20efc2d436a3b0f6d516ed4b.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="starfive_visionfive2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-visionfive-v2"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-starfive-visionfive-2-v1.3b"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
