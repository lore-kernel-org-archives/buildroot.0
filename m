Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495CFC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 21:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F5A380B6A;
	Sat, 13 Jul 2024 21:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyYg-jRIWm6G; Sat, 13 Jul 2024 21:18:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D256380B81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D256380B81;
	Sat, 13 Jul 2024 21:18:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A2421BF355
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08166605B7
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wVn7z5Wu1aM for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 21:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A50B605A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A50B605A9
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 21:18:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E884866B8; Sat, 13 Jul 2024 21:18:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 23:16:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4ae4122936306952109865006d055a112a111f1
X-Git-Newrev: 322e8d845196aad484b0ca099968aed800b00c1b
X-Patchwork-Hint: ignore
Message-Id: <20240713211855.3E884866B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx6ulz_bsh_smm_m2_defconfig: new
 defconfig
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6227669790186002290=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6227669790186002290==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=322e8d845196aad484b0ca099968aed800b00c1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BSH SMM M2 (SystemMaster M2) Board is an add-on board which provides
input and output interfaces to a dedicated carrier board. It is designed
mainly to provide graphical/video and connectivity interfaces to the
appliance.

Board support package includes the following components:
- mainline Linux kernel 6.1.68
- mainline U-Boot 2023.10

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Romain:
  - enable BR2_DOWNLOAD_FORCE_CHECK_HASHES and add hashes files
  - enable BR2_KERNEL_HEADERS_AS_KERNEL for linux-headers to avoid specify
    BR2_KERNEL_HEADERS_6_1
  - make sure to use uuu from HOST_DIR in flash.sh
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                         |   2 +
 board/bsh/imx6ulz-bsh-smm-m2/flash.sh              |  25 ++
 board/bsh/imx6ulz-bsh-smm-m2/linux.config          | 303 +++++++++++++++++++++
 board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst         |  40 +++
 .../patches/linux-headers/linux-headers.hash       |   1 +
 .../imx6ulz-bsh-smm-m2/patches/linux/linux.hash    |   2 +
 .../imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash    |   2 +
 board/bsh/imx6ulz-bsh-smm-m2/post-build.sh         |   4 +
 board/bsh/imx6ulz-bsh-smm-m2/readme.txt            |  67 +++++
 configs/imx6ulz_bsh_smm_m2_defconfig               |  42 +++
 10 files changed, 488 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9474d03520..e48ba20aa4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -782,6 +782,7 @@ F:	package/xinetd/
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
 F:	board/stmicroelectronics/stm32f769-disco/
+F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
@@ -2306,6 +2307,7 @@ F:	package/sqlitecpp/
 
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	board/bsh/
+F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	package/python-spidev/
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/flash.sh b/board/bsh/imx6ulz-bsh-smm-m2/flash.sh
new file mode 100755
index 0000000000..b2a610644e
--- /dev/null
+++ b/board/bsh/imx6ulz-bsh-smm-m2/flash.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+
+if [ $# -eq 0 ]; then
+    OUTPUT_DIR=output
+else
+    OUTPUT_DIR=$1
+fi
+
+if ! test -d "${OUTPUT_DIR}" ; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    echo ""
+    echo "Arguments:"
+    echo "    OUTPUT_DIR    The Buildroot output directory."
+    exit 1
+fi
+
+IMAGES_DIR="${OUTPUT_DIR}/images"
+
+"${OUTPUT_DIR}"/host/bin/uuu -v -b "${IMAGES_DIR}/nand-full.lst" \
+  "${IMAGES_DIR}/u-boot-with-spl.imx" \
+  "${IMAGES_DIR}/u-boot-with-spl.imx" \
+  "${IMAGES_DIR}/rootfs.ubifs" \
+  "${IMAGES_DIR}/zImage" \
+  "${IMAGES_DIR}/imx6ulz-bsh-smm-m2.dtb"
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/linux.config b/board/bsh/imx6ulz-bsh-smm-m2/linux.config
new file mode 100644
index 0000000000..7da8d4abe9
--- /dev/null
+++ b/board/bsh/imx6ulz-bsh-smm-m2/linux.config
@@ -0,0 +1,303 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=18
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_RELAY=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+CONFIG_ARCH_MULTI_V6=y
+CONFIG_ARCH_MXC=y
+CONFIG_SOC_IMX6Q=y
+CONFIG_SOC_IMX6SL=y
+CONFIG_SOC_IMX6SLL=y
+CONFIG_SOC_IMX6SX=y
+CONFIG_SOC_IMX6UL=y
+CONFIG_SMP=y
+CONFIG_HAVE_ARM_ARCH_TIMER=y
+CONFIG_ARM_PSCI=y
+CONFIG_HIGHMEM=y
+CONFIG_ARCH_FORCE_MAX_ORDER=14
+CONFIG_CMDLINE="noinitrd console=ttymxc0,115200"
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
+CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_ARM_IMX6Q_CPUFREQ=y
+CONFIG_ARM_IMX_CPUFREQ_DT=y
+CONFIG_CPU_IDLE=y
+CONFIG_ARM_CPUIDLE=y
+CONFIG_ARM_PSCI_CPUIDLE=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_PM_DEBUG=y
+CONFIG_PM_TEST_SUSPEND=y
+CONFIG_KPROBES=y
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_MODULE_SRCVERSION_ALL=y
+CONFIG_BINFMT_MISC=m
+# CONFIG_COMPAT_BRK is not set
+CONFIG_CMA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IPV6_SIT=m
+CONFIG_NETFILTER=y
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_VLAN_8021Q=y
+CONFIG_LLC2=y
+CONFIG_DNS_RESOLVER=y
+CONFIG_NET_PKTGEN=m
+CONFIG_BT=y
+CONFIG_BT_RFCOMM=y
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=y
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=y
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIUART_3WIRE=y
+CONFIG_BT_HCIUART_BCM=y
+CONFIG_BT_HCIVHCI=y
+CONFIG_CFG80211=y
+CONFIG_NL80211_TESTMODE=y
+CONFIG_MAC80211=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+CONFIG_FW_LOADER_USER_HELPER=y
+CONFIG_BRCMSTB_GISB_ARB=y
+CONFIG_IMX_WEIM=y
+CONFIG_VEXPRESS_CONFIG=y
+CONFIG_CONNECTOR=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_JEDECPROBE=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_CFI_STAA=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_MTD_DATAFLASH=y
+CONFIG_MTD_SST25L=y
+CONFIG_MTD_RAW_NAND=y
+CONFIG_MTD_NAND_GPMI_NAND=y
+CONFIG_MTD_NAND_MXC=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_FASTMAP=y
+CONFIG_MTD_UBI_BLOCK=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_EEPROM_AT25=y
+CONFIG_NETDEVICES=y
+# CONFIG_ETHERNET is not set
+# CONFIG_USB_NET_DRIVERS is not set
+CONFIG_BRCMFMAC=m
+CONFIG_HOSTAP=y
+CONFIG_INPUT_MISC=y
+CONFIG_SERIO_SERPORT=m
+CONFIG_VT_HW_CONSOLE_BINDING=y
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_IMX=y
+CONFIG_SERIAL_IMX_CONSOLE=y
+CONFIG_SERIAL_FSL_LPUART=y
+CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_SPI=y
+CONFIG_SPI_FSL_QUADSPI=y
+CONFIG_SPI_GPIO=y
+CONFIG_SPI_IMX=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_PTP_1588_CLOCK=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_MXC=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_SENSORS_GPIO_FAN=y
+CONFIG_THERMAL=y
+CONFIG_THERMAL_STATISTICS=y
+CONFIG_THERMAL_WRITABLE_TRIPS=y
+CONFIG_CPU_THERMAL=y
+CONFIG_IMX_THERMAL=y
+CONFIG_IMX8MM_THERMAL=y
+CONFIG_WATCHDOG=y
+CONFIG_IMX2_WDT=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_ANATOP=y
+CONFIG_REGULATOR_GPIO=y
+CONFIG_MEDIA_CEC_SUPPORT=y
+CONFIG_IMX_IPUV3_CORE=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_HCD_TEST_MODE=y
+CONFIG_USB_ACM=m
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_EHSET_TEST_FIXTURE=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_MXS_PHY=y
+CONFIG_USB_ULPI=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_SNP_UDC_PLAT=y
+CONFIG_USB_BDC_UDC=y
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_SERIAL=y
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_OBEX=y
+CONFIG_USB_CONFIGFS_NCM=y
+CONFIG_USB_CONFIGFS_ECM=y
+CONFIG_USB_CONFIGFS_ECM_SUBSET=y
+CONFIG_USB_CONFIGFS_RNDIS=y
+CONFIG_USB_CONFIGFS_EEM=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_USB_CONFIGFS_F_LB_SS=y
+CONFIG_USB_CONFIGFS_F_FS=y
+CONFIG_USB_CONFIGFS_F_HID=y
+CONFIG_USB_CONFIGFS_F_PRINTER=y
+CONFIG_USB_ZERO=m
+CONFIG_USB_ETH=m
+CONFIG_USB_G_NCM=m
+CONFIG_USB_GADGETFS=m
+CONFIG_USB_FUNCTIONFS=m
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+CONFIG_TYPEC=y
+CONFIG_TYPEC_TCPM=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_ESDHC_IMX=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_INTF_DEV_UIE_EMUL=y
+CONFIG_RTC_DRV_MXC=y
+CONFIG_RTC_DRV_MXC_V2=y
+CONFIG_RTC_DRV_SNVS=y
+CONFIG_DMADEVICES=y
+CONFIG_FSL_EDMA=y
+CONFIG_FSL_QDMA=m
+CONFIG_IMX_SDMA=m
+CONFIG_MXS_DMA=y
+CONFIG_DMATEST=y
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_SYSTEM=y
+CONFIG_DMABUF_HEAPS_CMA=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_COMMON_CLK_PWM=y
+CONFIG_CLK_IMX8MN=y
+CONFIG_SOC_BRCMSTB=y
+CONFIG_IMX_GPCV2_PM_DOMAINS=y
+CONFIG_SOC_IMX8M=y
+CONFIG_SOC_TI=y
+CONFIG_MEMORY=y
+CONFIG_PWM=y
+CONFIG_PWM_FSL_FTM=m
+CONFIG_PWM_IMX27=y
+CONFIG_PWM_IMX_TPM=y
+CONFIG_PHY_CADENCE_SALVO=y
+CONFIG_FSL_IMX8_DDR_PMU=y
+CONFIG_NVMEM_IMX_OCOTP=y
+CONFIG_NVMEM_SNVS_LPGPR=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT2_FS_SECURITY=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_EXT3_FS_SECURITY=y
+CONFIG_AUTOFS_FS=y
+CONFIG_ISO9660_FS=m
+CONFIG_JOLIET=y
+CONFIG_ZISOFS=y
+CONFIG_UDF_FS=m
+CONFIG_MSDOS_FS=m
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_XATTR=y
+CONFIG_UBIFS_FS=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_DEFAULT="cp437"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_15=m
+CONFIG_NLS_UTF8=y
+CONFIG_SECURITYFS=y
+CONFIG_CRYPTO_USER=y
+CONFIG_CRYPTO_TEST=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_CAMELLIA=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_DES=m
+CONFIG_CRYPTO_FCRYPT=m
+CONFIG_CRYPTO_KHAZAD=m
+CONFIG_CRYPTO_SEED=m
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TEA=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_CFB=m
+CONFIG_CRYPTO_CTS=m
+CONFIG_CRYPTO_LRW=m
+CONFIG_CRYPTO_OFB=m
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_CHACHA20POLY1305=m
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=y
+CONFIG_CRYPTO_STREEBOG=m
+CONFIG_CRYPTO_VMAC=m
+CONFIG_CRYPTO_WP512=m
+CONFIG_CRYPTO_XCBC=m
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_AEAD=m
+CONFIG_CRYPTO_DEV_FSL_CAAM=y
+CONFIG_CRYPTO_DEV_SAHARA=y
+CONFIG_CRYPTO_DEV_MXS_DCP=y
+CONFIG_CRYPTO_DEV_AMLOGIC_GXL=m
+CONFIG_CRC_T10DIF=y
+CONFIG_CRC7=m
+CONFIG_LIBCRC32C=m
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=64
+CONFIG_IRQ_POLL=y
+CONFIG_PRINTK_TIME=y
+# CONFIG_DEBUG_BUGVERBOSE is not set
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_PROVE_LOCKING=y
+# CONFIG_FTRACE is not set
+CONFIG_CORESIGHT=y
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst b/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
new file mode 100644
index 0000000000..7c5a884d65
--- /dev/null
+++ b/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
@@ -0,0 +1,40 @@
+# @_flash.bin            | bootloader
+# @_image   [_flash.bin] | image burn to nand, default is the same as bootloader
+# @_filesystem           | filesystem to burn
+# @_kernel               | kernel image
+# @_dtb                  | dtb image
+
+# This command will be run when i.MX6/7 i.MX8MM, i.MX8MQ
+SDP: boot -f _flash.bin
+
+# These commands will be run when use SPL and will be skipped if no spl
+# SDPU will be deprecated. please use SDPV instead of SDPU
+# {
+SDPU: delay 1000
+SDPU: write -f _flash.bin -offset 0x57c00
+SDPU: jump
+# }
+
+# These commands will be run when use SPL and will be skipped if no spl
+# if (SPL support SDPV)
+# {
+SDPV: delay 1000
+SDPV: write -f _flash.bin -offset 0x11000
+SDPV: jump
+# }
+
+FB: ucmd setenv fastboot_buffer ${loadaddr}
+FB[-t 60000]: ucmd nand erase.chip
+FB[-t 60000]: ucmd ubi part rootfs
+FB[-t 60000]: ucmd ubi create root -
+FB: download -f _filesystem
+FB[-t 60000]: ucmd ubi write ${loadaddr} root ${filesize}
+
+FB: download -f _kernel
+FB[-t 60000]: ucmd nand write ${loadaddr} kernel ${filesize}
+
+FB: download -f _dtb
+FB[-t 8000]: ucmd nand write ${loadaddr} nanddtb ${filesize}
+FB: ucmd setenv loadaddr 0x82000000
+
+FB: done
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux-headers/linux-headers.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
new file mode 100644
index 0000000000..25e4464adb
--- /dev/null
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  365ff26a30e206de9b18489f45d38582a0a61b7c5919f8ab89295a47316784e1  linux-6.1.68.tar.xz
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..c0b3bcdd04
--- /dev/null
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e00e6c6f014e046101739d08d06f328811cebcf5ae101348f409cbbd55ce6900  u-boot-2023.10.tar.bz2
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh b/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
new file mode 100755
index 0000000000..eac82cc22a
--- /dev/null
+++ b/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+
+cp "${BOARD_DIR}/nand-full.lst" "${BINARIES_DIR}"
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/readme.txt b/board/bsh/imx6ulz-bsh-smm-m2/readme.txt
new file mode 100644
index 0000000000..e6641e6df1
--- /dev/null
+++ b/board/bsh/imx6ulz-bsh-smm-m2/readme.txt
@@ -0,0 +1,67 @@
+i.MX6ULZ BSH SMM M2
+==================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the i.MX6ULZ BSH SMM M2 board.
+
+Building
+--------
+
+Configure buildroot:
+
+  $ make imx6ulz_bsh_smm_m2_defconfig
+
+Change settings to fit your needs (optional):
+
+  $ make menuconfig
+
+Compile everything and build the rootfs image:
+
+  $ make
+
+
+Result of the build
+-------------------
+
+After building, the output/images directory contains:
+
+  output/images/
+    ├── imx6ulz-bsh-smm-m2.dtb
+    ├── zImage
+    ├── nand-full.lst
+    ├── rootfs.ubifs
+    └── u-boot-with-spl.imx
+
+Preparing the board
+-------------------
+
+Plug the USB type A to micro B cable into the USB Debug
+Connector (DBG UART). Use serial port settings 115200 8N1
+to access the debug console.
+
+Plug another USB type A to micro B cable into the USB-OTG
+Connector (USB1). This connection is used to flash the board
+firmware using the Freescale/NXP UUU tool.
+
+Connect the power supply/adaptor to the DC Power Jack (labelled
++5V).
+
+
+Flashing
+--------
+
+Power up the board by switching on the Power ON Switch, which is
+placed right next to the DC Jack.
+
+Enter the following U-Boot commands on the debug serial console:
+
+  $ nand erase.chip
+  $ reset
+
+Flash the built images directly to board’s memory. On your computer,
+run:
+
+  $ board/bsh/imx6ulz-bsh-smm-m2/flash.sh output/
+
+It will flash the bootloader, the Device Tree Blob, the kernel image
+and the UBI root file system.
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
new file mode 100644
index 0000000000..29177c4756
--- /dev/null
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -0,0 +1,42 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/bsh/imx6ulz-bsh-smm-m2/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.68"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ulz-bsh-smm-m2"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_BLUEZ_TOOLS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=y
+BR2_PACKAGE_IW=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-with-spl.imx"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_E2FSPROGS=y
+BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y

--===============6227669790186002290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6227669790186002290==--
