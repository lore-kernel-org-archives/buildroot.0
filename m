Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FDEC25B10
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 09:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4677181255;
	Mon, 29 Apr 2024 09:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x67FwIDEiGpz; Mon, 29 Apr 2024 09:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B4181214
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96B4181214;
	Mon, 29 Apr 2024 09:39:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 812A61BF32A
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 09:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7944081214
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 09:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38CTv8Dk6uVu for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 09:39:14 +0000 (UTC)
X-Greylist: delayed 764 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 29 Apr 2024 09:39:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D954811FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D954811FC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=p-bhagat@ti.com; receiver=<UNKNOWN> 
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D954811FC
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 09:39:13 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43T9QRNp122381;
 Mon, 29 Apr 2024 04:26:27 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43T9QR4n110336
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 29 Apr 2024 04:26:27 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Apr 2024 04:26:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 29 Apr 2024 04:26:27 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43T9QQxv128393;
 Mon, 29 Apr 2024 04:26:27 -0500
To: <buildroot@buildroot.org>
Date: Mon, 29 Apr 2024 14:53:26 +0530
Message-ID: <20240429092326.3247116-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714382787;
 bh=80WBb4CP5Jfdy2M2J6utZ2gJ9gCJ/NBeDuI7mzovAB4=;
 h=From:To:CC:Subject:Date;
 b=MVONry4MzRma1YKX9TItCUqeD2R25lReLF/+yJZYhkSAtC40og+vvd0SrgwcABtQL
 p+cBaWP1YqDSq8She2WXn4WsYGCdq5X+g+vJF7JSCU3w1UNEHCaTZ5i3YnTL16QbiG
 39Jzl1jqH9AkXzMTSLGb2dy5RWq8camrduoZVQzE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=MVONry4M
Subject: [Buildroot] [RFC,
 1/1] configs/am62x-sk: Add fragment for TI tree integration
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
From: Paresh Bhagat via buildroot <buildroot@buildroot.org>
Reply-To: Paresh Bhagat <p-bhagat@ti.com>
Cc: Chirag Shilwant <c-shilwant@ti.com>, Gyan Gupta <g-gupta@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, Paresh Bhagat <p-bhagat@ti.com>,
 Syed Mohammed Khasim <khasim@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit introduces a new fragment config aimed at integration of TI trees
into the existing configuration for am62x-sk. The fragment config is designed 
to be merged with the current ti_am62x_sk_defconfig, enabling transition from 
mainline to TI versions for U-boot and kernel.

The fragment config will be merged with existing ti_my_am62x_sk_defconfig
using merge-config.sh script present in support/kconfig using following
command.

./support/kconfig/merge-config.sh configs/ti_am62x_sk_defconfig configs/ti_am62x_sk.config

It effectively changes uboot and kernel source from mainline version to TI 
version hosted here

https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=ti-linux-6.1.y
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/?h=ti-u-boot-2023.04

Furthermore, as ti-uboot 2023.04 is used, kernel Image and dtb is expected 
in rootfs/boot/ and rootfs/boot/dtb/ti respectively. So add a new post-build
script to copy these files to desired location. 

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 board/ti/common/am6xx/genimage_ti.cfg       |  28 ++
 board/ti/common/am6xx/post-build-ti.sh      |  33 ++
 board/ti/common/am6xx/ti_arm64_prune.config | 485 ++++++++++++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash   |   1 +
 boot/uboot/uboot.hash                       |   1 +
 configs/ti_am62x_sk.config                  |  24 +
 linux/linux.hash                            |   1 +
 7 files changed, 573 insertions(+)
 create mode 100644 board/ti/common/am6xx/genimage_ti.cfg
 create mode 100755 board/ti/common/am6xx/post-build-ti.sh
 create mode 100644 board/ti/common/am6xx/ti_arm64_prune.config
 create mode 100644 configs/ti_am62x_sk.config

diff --git a/board/ti/common/am6xx/genimage_ti.cfg b/board/ti/common/am6xx/genimage_ti.cfg
new file mode 100644
index 0000000000..a1c7edb614
--- /dev/null
+++ b/board/ti/common/am6xx/genimage_ti.cfg
@@ -0,0 +1,28 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"tiboot3.bin",
+			"tispl.bin",
+			"u-boot.img"
+		}
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+
+}
diff --git a/board/ti/common/am6xx/post-build-ti.sh b/board/ti/common/am6xx/post-build-ti.sh
new file mode 100755
index 0000000000..3f699c27b9
--- /dev/null
+++ b/board/ti/common/am6xx/post-build-ti.sh
@@ -0,0 +1,33 @@
+#!/bin/sh -x
+
+dtb_file=""
+
+while [ $# -gt 0 ]; do
+    case "$1" in
+        -d)
+            # Check if the next argument exists and is not another flag
+            if [ -n "$2" ] && [ "${2#-}" = "$2" ]; then
+                dtb_file="$2"
+                shift
+            else
+                echo "Error: Missing or invalid filename after -d flag"
+                exit 1
+            fi
+            ;;
+        *)
+            ;;
+    esac
+    shift
+done
+
+if [ -n "$dtb_file" ]; then
+    echo "dtb file provided : $dtb_file"
+else
+    echo "No dtb file provided with -d flag"
+	exit 1
+fi
+
+mkdir -p $TARGET_DIR/boot/dtb/ti
+
+cp $BINARIES_DIR/Image $TARGET_DIR/boot
+cp $BINARIES_DIR/$dtb_file $TARGET_DIR/boot/dtb/ti
diff --git a/board/ti/common/am6xx/ti_arm64_prune.config b/board/ti/common/am6xx/ti_arm64_prune.config
new file mode 100644
index 0000000000..ad41cda81c
--- /dev/null
+++ b/board/ti/common/am6xx/ti_arm64_prune.config
@@ -0,0 +1,485 @@
+# Add config flags here that appear in the multi_v7_defconfig but are not
+# used by a kernel targetting only the currently supported TI EVMs
+
+# Non-TI Architectures
+CONFIG_ARCH_ACTIONS=n
+CONFIG_ARCH_SUNXI=n
+CONFIG_ARCH_AGILEX=n
+CONFIG_ARCH_ALPINE=n
+CONFIG_ARCH_APPLE=n
+CONFIG_ARCH_BCM=n
+CONFIG_ARCH_BCM2835=n
+CONFIG_ARCH_BCM_IPROC=n
+CONFIG_ARCH_BCMBCA=n
+CONFIG_ARCH_BERLIN=n
+CONFIG_ARCH_BRCMSTB=n
+CONFIG_ARCH_EXYNOS=n
+CONFIG_ARCH_LAYERSCAPE=n
+CONFIG_ARCH_LG1K=n
+CONFIG_ARCH_HISI=n
+CONFIG_ARCH_KEEMBAY=n
+CONFIG_ARCH_MEDIATEK=n
+CONFIG_ARCH_MESON=n
+CONFIG_ARCH_MVEBU=n
+CONFIG_ARCH_NXP=n
+CONFIG_ARCH_MXC=n
+CONFIG_ARCH_NPCM=n
+CONFIG_ARCH_QCOM=n
+CONFIG_ARCH_ROCKCHIP=n
+CONFIG_ARCH_SEATTLE=n
+CONFIG_ARCH_RENESAS=n
+CONFIG_ARCH_R8A7795=n
+CONFIG_ARCH_R8A7796=n
+CONFIG_ARCH_S32=n
+CONFIG_ARCH_STRATIX10=n
+CONFIG_ARCH_INTEL_SOCFPGA=n
+CONFIG_ARCH_SYNQUACER=n
+CONFIG_ARCH_TEGRA=n
+CONFIG_ARCH_SPRD=n
+CONFIG_ARCH_THUNDER=n
+CONFIG_ARCH_THUNDER2=n
+CONFIG_ARCH_UNIPHIER=n
+CONFIG_ARCH_VEXPRESS=n
+CONFIG_ARCH_VISCONTI=n
+CONFIG_ARCH_XGENE=n
+CONFIG_ARCH_ZX=n
+CONFIG_ARCH_ZYNQMP=n
+CONFIG_ARCH_TEGRA_132_SOC=n
+CONFIG_ARCH_TEGRA_210_SOC=n
+CONFIG_ARCH_TEGRA_186_SOC=n
+
+CONFIG_QCOM_FALKOR_ERRATUM_1003=n
+CONFIG_QCOM_FALKOR_ERRATUM_1009=n
+CONFIG_QCOM_QDF2400_ERRATUM_0065=n
+CONFIG_QCOM_FALKOR_ERRATUM_E1041=n
+
+CONFIG_CAVIUM_ERRATUM_22375=n
+CONFIG_CAVIUM_ERRATUM_23144=n
+CONFIG_CAVIUM_ERRATUM_23154=n
+CONFIG_CAVIUM_ERRATUM_27456=n
+CONFIG_CAVIUM_ERRATUM_30115=n
+
+CONFIG_HISILICON_ERRATUM_161600802=n
+
+# Disable Errata fixes not relevant for Cortex A53 and Cortext A72 cores.
+# The Socionext Synquacer GICv3 pre-ITS workaround is used on K3 devices
+# as well, thats why its left enabled.
+CONFIG_AMPERE_ERRATUM_AC03_CPU_38=n
+CONFIG_ARM64_ERRATUM_832075=n
+CONFIG_ARM64_ERRATUM_1024718=n
+CONFIG_ARM64_ERRATUM_1418040=n
+CONFIG_ARM64_ERRATUM_1165522=n
+CONFIG_ARM64_ERRATUM_1530923=n
+CONFIG_ARM64_ERRATUM_2441007=n
+CONFIG_ARM64_ERRATUM_1286807=n
+CONFIG_ARM64_ERRATUM_1463225=n
+CONFIG_ARM64_ERRATUM_1542419=n
+CONFIG_ARM64_ERRATUM_1508412=n
+CONFIG_ARM64_ERRATUM_2051678=n
+CONFIG_ARM64_ERRATUM_2077057=n
+CONFIG_ARM64_ERRATUM_2658417=n
+CONFIG_ARM64_ERRATUM_2054223=n
+CONFIG_ARM64_ERRATUM_2067961=n
+CONFIG_ARM64_ERRATUM_2441009=n
+CONFIG_CAVIUM_TX2_ERRATUM_219=n
+CONFIG_FUJITSU_ERRATUM_010001=n
+CONFIG_NVIDIA_CARMEL_CNP_ERRATUM=n
+
+# Serial
+CONFIG_SERIAL_8250_FSL=n
+CONFIG_SERIAL_8250_DW=n
+CONFIG_SERIAL_AMBA_PL011=n
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=n
+CONFIG_SERIAL_XILINX_PS_UART=n
+CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=n
+
+CONFIG_ARM_SCPI_PROTOCOL=n
+CONFIG_ARM_SCPI_POWER_DOMAIN=n
+CONFIG_ARM_SCPI_CPUFREQ=n
+CONFIG_SENSORS_ARM_SCPI=n
+CONFIG_COMMON_CLK_SCPI=n
+
+CONFIG_ARM_MHU=n
+CONFIG_PLATFORM_MHU=n
+
+CONFIG_ACPI=n
+
+CONFIG_NUMA=n
+
+CONFIG_XEN=n
+CONFIG_KVM=n
+
+CONFIG_ARM_BIG_LITTLE_CPUFREQ=n
+
+CONFIG_PCI_XGENE=n
+CONFIG_PCI_HISI=n
+CONFIG_PCIE_KIRIN=n
+
+# DRM
+CONFIG_DRM_NOUVEAU=n
+CONFIG_DRM_I2C_ADV7511=n
+CONFIG_DRM_ETNAVIV=n
+CONFIG_DRM_HISI_HIBMC=n
+CONFIG_DRM_HISI_KIRIN=n
+CONFIG_DRM_MXSFB=n
+CONFIG_DRM_PL111=n
+CONFIG_DRM_LIMA=n
+CONFIG_DRM_PANFROST=n
+
+# Video
+CONFIG_VGA_ARB=n
+CONFIG_FB_EFI=n
+
+# V4L2
+CONFIG_RC_CORE=n
+
+# Sound
+CONFIG_SND_SPI=n
+CONFIG_SND_SOC_FSL_SAI=n
+CONFIG_SND_SOC_AK4613=n
+CONFIG_SND_SOC_ES7134=n
+CONFIG_SND_SOC_ES7241=n
+CONFIG_SND_SOC_TAS571X=n
+
+# USB
+CONFIG_USB_MUSB_HDRC=n
+CONFIG_USB_DWC2=n
+CONFIG_USB_CHIPIDEA=n
+CONFIG_USB_ISP1760=n
+CONFIG_USB_HSIC_USB3503=n
+
+# Generic kernel
+
+# We recommend to turn off Real-Time group scheduling in the
+# kernel when using systemd. RT group scheduling effectively
+# makes RT scheduling unavailable for most userspace, since it
+# requires explicit assignment of RT budgets to each unit whose
+# processes making use of RT. As there's no sensible way to
+# assign these budgets automatically this cannot really be
+# fixed, and it's best to disable group scheduling hence.
+CONFIG_RT_GROUP_SCHED=n
+
+# Remove debug features.
+CONFIG_SLUB_DEBUG=n
+
+# We are not a crash kernel
+CONFIG_CRASH_DUMP=n
+
+# ARM Scalable Vector Extension (SVE) is available only with ARMv8.2-A
+# and above. Since current TI SoCs are based on ARMv8.0, disable SVE
+CONFIG_ARM64_SVE=n
+
+# Plan 9 is a distributed resource sharing protocol thats not
+# typically used on TI processors
+CONFIG_NET_9P=n
+
+# Non-TI hardware vendor specific drivers
+CONFIG_KEYBOARD_CROS_EC=n
+CONFIG_I2C_CROS_EC_TUNNEL=n
+CONFIG_QRTR=n
+CONFIG_SPI_NXP_FLEXSPI=n
+CONFIG_GPIO_ALTERA=n
+CONFIG_GPIO_DWAPB=n
+CONFIG_GPIO_MB86S7X=n
+CONFIG_GPIO_PL061=n
+CONFIG_GPIO_XGENE=n
+CONFIG_POWER_RESET_XGENE=n
+CONFIG_ARM_SP805_WATCHDOG=n
+CONFIG_ARM_SBSA_WATCHDOG=n
+CONFIG_DW_WATCHDOG=n
+CONFIG_MFD_SEC_CORE=n
+CONFIG_REGULATOR_QCOM_SPMI=n
+CONFIG_DRM_MALI_DISPLAY=n
+CONFIG_DRM_RCAR_DW_HDMI=n
+CONFIG_DRM_DW_HDMI_AHB_AUDIO=n
+CONFIG_DRM_DW_HDMI_CEC=n
+CONFIG_FB_SSD1307=n
+CONFIG_MMC_ARMMMCI=n
+CONFIG_MMC_SDHCI_XENON=n
+CONFIG_RTC_DRV_S5M=n
+CONFIG_RTC_DRV_CROS_EC=n
+CONFIG_RTC_DRV_PL031=n
+CONFIG_FSL_EDMA=n
+CONFIG_MV_XOR_V2=n
+CONFIG_PL330_DMA=n
+CONFIG_QCOM_HIDMA_MGMT=n
+CONFIG_QCOM_HIDMA=n
+CONFIG_CHROME_PLATFORMS=n
+CONFIG_CROS_EC=n
+CONFIG_CROS_EC_I2C=n
+CONFIG_CROS_EC_SPI=n
+CONFIG_CROS_EC_CHARDEV=n
+CONFIG_SURFACE_PLATFORMS=n
+CONFIG_COMMON_CLK_S2MPS11=n
+CONFIG_COMMON_CLK_VC5=n
+CONFIG_COMMON_CLK_BD718XX=n
+CONFIG_FSL_ERRATUM_A008585=n
+CONFIG_HISILICON_ERRATUM_161010101=n
+CONFIG_RPMSG_QCOM_GLINK_RPM=n
+CONFIG_SOUNDWIRE_QCOM=n
+CONFIG_EXTCON_USBC_CROS_EC=n
+CONFIG_QCOM_SPMI_ADC5=n
+CONFIG_IIO_CROS_EC_SENSORS_CORE=n
+CONFIG_IIO_CROS_EC_SENSORS=n
+CONFIG_IIO_CROS_EC_LIGHT_PROX=n
+CONFIG_IIO_CROS_EC_BARO=n
+CONFIG_PWM_CROS_EC=n
+CONFIG_SLIM_QCOM_CTRL=n
+CONFIG_SPI_PL022=n
+CONFIG_SLIMBUS=n
+CONFIG_REGMAP_SLIMBUS=n
+CONFIG_SCSI_HISI_SAS=n
+CONFIG_AHCI_CEVA=n
+CONFIG_AHCI_XGENE=n
+CONFIG_AHCI_QORIQ=n
+CONFIG_SATA_SIL24=n
+CONFIG_BCMGENET=n
+CONFIG_SYSTEMPORT=n
+CONFIG_HNS_DSAF=n
+CONFIG_HNS_ENET=n
+CONFIG_HNS3=n
+CONFIG_NET_VENDOR_NVIDIA=n
+CONFIG_NET_VENDOR_RENESAS=n
+CONFIG_NET_VENDOR_SAMSUNG=n
+CONFIG_NET_VENDOR_STMICRO=n
+CONFIG_NET_VENDOR_XILINX=n
+CONFIG_BROADCOM_PHY=n
+CONFIG_BCM54140_PHY=n
+CONFIG_ROCKCHIP_PHY=n
+CONFIG_PCS_XPCS=n
+CONFIG_HW_RANDOM_ARM_SMCCC_TRNG=n
+CONFIG_HW_RANDOM_CN10K=n
+CONFIG_I2C_CADENCE=n
+CONFIG_I2C_DESIGNWARE_SLAVE=n
+CONFIG_I2C_DESIGNWARE_PLATFORM=n
+CONFIG_I2C_RK3X=n
+CONFIG_PINCTRL_MAX77620=n
+CONFIG_DRM_RCAR_USE_LVDS=n
+CONFIG_DRM_RCAR_USE_MIPI_DSI=n
+CONFIG_SND_SOC_FSL_ASRC=n
+CONFIG_SND_SOC_FSL_AUDMIX=n
+CONFIG_SND_SOC_FSL_SSI=n
+CONFIG_SND_SOC_FSL_SPDIF=n
+CONFIG_SND_SOC_FSL_ESAI=n
+CONFIG_SND_SOC_FSL_MICFIL=n
+CONFIG_SND_SOC_IMX_AUDMUX=n
+CONFIG_MMC_SDHCI_OF_DWCMSHC=n
+CONFIG_MMC_SDHCI_CADENCE=n
+CONFIG_MMC_SDHCI_F_SDH30=n
+CONFIG_MMC_DW=n
+CONFIG_MMC_MTK=n
+CONFIG_PCIE_ALTERA=n
+CONFIG_PCI_HOST_THUNDER_PEM=n
+CONFIG_PCI_HOST_THUNDER_ECAM=n
+CONFIG_PCI_MESON=n
+CONFIG_BRCMSTB_GISB_ARB=n
+CONFIG_VEXPRESS_CONFIG=n
+CONFIG_MTD_NAND_DENALI_DT=n
+CONFIG_MTD_NAND_BRCMNAND=n
+CONFIG_B53=n
+CONFIG_NET_DSA_BCM_SF2=n
+CONFIG_CAN_FLEXCAN=n
+CONFIG_SPI_DESIGNWARE=n
+CONFIG_SPI_ROCKCHIP=n
+CONFIG_DRM_HDLCD=n
+CONFIG_DRM_KOMEDA=n
+CONFIG_COMMON_CLK_RK808=n
+CONFIG_COMMON_CLK_XGENE=n
+CONFIG_SOC_BRCMSTB=n
+CONFIG_NET_VENDOR_ALACRITECH=n
+CONFIG_NET_VENDOR_AMAZON=n
+CONFIG_NET_VENDOR_AMD=n
+CONFIG_NET_VENDOR_AQUANTIA=n
+CONFIG_NET_VENDOR_ARC=n
+CONFIG_NET_VENDOR_ASIX=n
+CONFIG_NET_VENDOR_CORTINA=n
+CONFIG_NET_VENDOR_DAVICOM=n
+CONFIG_NET_VENDOR_ENGLEDER=n
+CONFIG_NET_VENDOR_EZCHIP=n
+CONFIG_NET_VENDOR_GOOGLE=n
+CONFIG_NET_VENDOR_HISILICON=n
+CONFIG_NET_VENDOR_LITEX=n
+CONFIG_NET_VENDOR_MICREL=n
+CONFIG_NET_VENDOR_MICROCHIP=n
+CONFIG_NET_VENDOR_MICROSEMI=n
+CONFIG_NET_VENDOR_NATSEMI=n
+CONFIG_NET_VENDOR_NI=n
+CONFIG_NET_VENDOR_QUALCOMM=n
+CONFIG_NET_VENDOR_ROCKER=n
+CONFIG_NET_VENDOR_SEEQ=n
+CONFIG_NET_VENDOR_SMSC=n
+CONFIG_NET_VENDOR_SOCIONEXT=n
+CONFIG_NET_VENDOR_SOLARFLARE=n
+CONFIG_NET_VENDOR_SYNOPSYS=n
+CONFIG_NET_VENDOR_VERTEXCOM=n
+CONFIG_NET_VENDOR_VIA=n
+CONFIG_NET_VENDOR_WANGXUN=n
+CONFIG_NET_VENDOR_WIZNET=n
+CONFIG_NET_VENDOR_BROADCOM=n
+CONFIG_NET_VENDOR_MICROSOFT=n
+CONFIG_NET_VENDOR_FUNGIBLE=n
+CONFIG_NET_VENDOR_CAVIUM=n
+CONFIG_NET_VENDOR_PENSANDO=n
+CONFIG_NET_VENDOR_CADENCE=n
+CONFIG_NET_VENDOR_MELLANOX=n
+CONFIG_NET_VENDOR_NETRONOME=n
+CONFIG_NET_VENDOR_MARVELL=n
+CONFIG_NET_VENDOR_INTEL=n
+CONFIG_NET_VENDOR_HUAWEI=n
+
+# Serial Power Management Interface (SPMI) has not been used on TI
+# platforms (yet)
+CONFIG_SPMI=n
+
+# DVB and TV tuner cards are rarely used on TI platforms, if at all
+CONFIG_CXD2880_SPI_DRV=n
+CONFIG_MEDIA_TUNER_E4000=n
+CONFIG_MEDIA_TUNER_FC0011=n
+CONFIG_MEDIA_TUNER_FC0012=n
+CONFIG_MEDIA_TUNER_FC0013=n
+CONFIG_MEDIA_TUNER_FC2580=n
+CONFIG_MEDIA_TUNER_IT913X=n
+CONFIG_MEDIA_TUNER_M88RS6000T=n
+CONFIG_MEDIA_TUNER_MAX2165=n
+CONFIG_MEDIA_TUNER_MC44S803=n
+CONFIG_MEDIA_TUNER_MSI001=n
+CONFIG_MEDIA_TUNER_MT2060=n
+CONFIG_MEDIA_TUNER_MT2063=n
+CONFIG_MEDIA_TUNER_MT20XX=n
+CONFIG_MEDIA_TUNER_MT2131=n
+CONFIG_MEDIA_TUNER_MT2266=n
+CONFIG_MEDIA_TUNER_MXL301RF=n
+CONFIG_MEDIA_TUNER_MXL5005S=n
+CONFIG_MEDIA_TUNER_MXL5007T=n
+CONFIG_MEDIA_TUNER_QM1D1B0004=n
+CONFIG_MEDIA_TUNER_QM1D1C0042=n
+CONFIG_MEDIA_TUNER_QT1010=n
+CONFIG_MEDIA_TUNER_R820T=n
+CONFIG_MEDIA_TUNER_SI2157=n
+CONFIG_MEDIA_TUNER_SIMPLE=n
+CONFIG_MEDIA_TUNER_TDA18212=n
+CONFIG_MEDIA_TUNER_TDA18218=n
+CONFIG_MEDIA_TUNER_TDA18250=n
+CONFIG_MEDIA_TUNER_TDA18271=n
+CONFIG_MEDIA_TUNER_TDA827X=n
+CONFIG_MEDIA_TUNER_TDA8290=n
+CONFIG_MEDIA_TUNER_TDA9887=n
+CONFIG_MEDIA_TUNER_TEA5761=n
+CONFIG_MEDIA_TUNER_TEA5767=n
+CONFIG_MEDIA_TUNER_TUA9001=n
+CONFIG_MEDIA_TUNER_XC2028=n
+CONFIG_MEDIA_TUNER_XC4000=n
+CONFIG_MEDIA_TUNER_XC5000=n
+CONFIG_DVB_M88DS3103=n
+CONFIG_DVB_MXL5XX=n
+CONFIG_DVB_STB0899=n
+CONFIG_DVB_STB6100=n
+CONFIG_DVB_STV090x=n
+CONFIG_DVB_STV0910=n
+CONFIG_DVB_STV6110x=n
+CONFIG_DVB_STV6111=n
+CONFIG_DVB_DRXK=n
+CONFIG_DVB_MN88472=n
+CONFIG_DVB_MN88473=n
+CONFIG_DVB_SI2165=n
+CONFIG_DVB_TDA18271C2DD=n
+CONFIG_DVB_CX24110=n
+CONFIG_DVB_CX24116=n
+CONFIG_DVB_CX24117=n
+CONFIG_DVB_CX24120=n
+CONFIG_DVB_CX24123=n
+CONFIG_DVB_DS3000=n
+CONFIG_DVB_MB86A16=n
+CONFIG_DVB_MT312=n
+CONFIG_DVB_S5H1420=n
+CONFIG_DVB_SI21XX=n
+CONFIG_DVB_STB6000=n
+CONFIG_DVB_STV0288=n
+CONFIG_DVB_STV0299=n
+CONFIG_DVB_STV0900=n
+CONFIG_DVB_STV6110=n
+CONFIG_DVB_TDA10071=n
+CONFIG_DVB_TDA10086=n
+CONFIG_DVB_TDA8083=n
+CONFIG_DVB_TDA8261=n
+CONFIG_DVB_TDA826X=n
+CONFIG_DVB_TS2020=n
+CONFIG_DVB_TUA6100=n
+CONFIG_DVB_TUNER_CX24113=n
+CONFIG_DVB_TUNER_ITD1000=n
+CONFIG_DVB_VES1X93=n
+CONFIG_DVB_ZL10036=n
+CONFIG_DVB_ZL10039=n
+CONFIG_DVB_AF9013=n
+CONFIG_DVB_CX22700=n
+CONFIG_DVB_CX22702=n
+CONFIG_DVB_CXD2820R=n
+CONFIG_DVB_CXD2841ER=n
+CONFIG_DVB_DIB3000MB=n
+CONFIG_DVB_DIB3000MC=n
+CONFIG_DVB_DIB7000M=n
+CONFIG_DVB_DIB7000P=n
+CONFIG_DVB_DIB9000=n
+CONFIG_DVB_DRXD=n
+CONFIG_DVB_EC100=n
+CONFIG_DVB_L64781=n
+CONFIG_DVB_MT352=n
+CONFIG_DVB_NXT6000=n
+CONFIG_DVB_RTL2830=n
+CONFIG_DVB_RTL2832=n
+CONFIG_DVB_RTL2832_SDR=n
+CONFIG_DVB_S5H1432=n
+CONFIG_DVB_SI2168=n
+CONFIG_DVB_SP887X=n
+CONFIG_DVB_STV0367=n
+CONFIG_DVB_TDA10048=n
+CONFIG_DVB_TDA1004X=n
+CONFIG_DVB_ZD1301_DEMOD=n
+CONFIG_DVB_ZL10353=n
+CONFIG_DVB_CXD2880=n
+CONFIG_DVB_STV0297=n
+CONFIG_DVB_TDA10021=n
+CONFIG_DVB_TDA10023=n
+CONFIG_DVB_VES1820=n
+CONFIG_DVB_AU8522_DTV=n
+CONFIG_DVB_AU8522_V4L=n
+CONFIG_DVB_BCM3510=n
+CONFIG_DVB_LG2160=n
+CONFIG_DVB_LGDT3305=n
+CONFIG_DVB_LGDT3306A=n
+CONFIG_DVB_LGDT330X=n
+CONFIG_DVB_MXL692=n
+CONFIG_DVB_NXT200X=n
+CONFIG_DVB_OR51132=n
+CONFIG_DVB_OR51211=n
+CONFIG_DVB_S5H1409=n
+CONFIG_DVB_S5H1411=n
+CONFIG_DVB_DIB8000=n
+CONFIG_DVB_MB86A20S=n
+CONFIG_DVB_S921=n
+CONFIG_DVB_MN88443X=n
+CONFIG_DVB_TC90522=n
+CONFIG_DVB_PLL=n
+CONFIG_DVB_TUNER_DIB0070=n
+CONFIG_DVB_TUNER_DIB0090=n
+CONFIG_DVB_A8293=n
+CONFIG_DVB_AF9033=n
+CONFIG_DVB_ASCOT2E=n
+CONFIG_DVB_ATBM8830=n
+CONFIG_DVB_HELENE=n
+CONFIG_DVB_HORUS3A=n
+CONFIG_DVB_ISL6405=n
+CONFIG_DVB_ISL6421=n
+CONFIG_DVB_ISL6423=n
+CONFIG_DVB_IX2505V=n
+CONFIG_DVB_LGS8GL5=n
+CONFIG_DVB_LGS8GXX=n
+CONFIG_DVB_LNBH25=n
+CONFIG_DVB_LNBH29=n
+CONFIG_DVB_LNBP21=n
+CONFIG_DVB_LNBP22=n
+CONFIG_DVB_M88RS2000=n
+CONFIG_DVB_TDA665x=n
+CONFIG_DVB_DRX39XYJ=n
+CONFIG_DVB_CXD2099=n
+CONFIG_DVB_SP2=n
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
index fbe5d21540..fb2fbeb545 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
+sha256  62c2e7ab8420260554a448a660cfde7305487701e405d01e1a875910c5a5c82c  ti-k3-r5-loader-ti-u-boot-2023.04-br1.tar.gz
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index fbe5d21540..3baa2f5e2e 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
+sha256  5c3ce409901b8b16204b02d538833dcb6c66729c0316b53848d0f15642a49266  uboot-ti-u-boot-2023.04-br1.tar.gz
diff --git a/configs/ti_am62x_sk.config b/configs/ti_am62x_sk.config
new file mode 100644
index 0000000000..fdb48d3758
--- /dev/null
+++ b/configs/ti_am62x_sk.config
@@ -0,0 +1,24 @@
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+#kernel
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ti-linux-6.1.y"
+
+#fragment defconfig
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/ti/common/am6xx/ti_arm64_prune.config"
+
+#uboot
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL="https://git.ti.com/git/ti-u-boot/ti-u-boot.git"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_VERSION="ti-u-boot-2023.04"
+
+#ubootr5
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://git.ti.com/git/ti-u-boot/ti-u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ti-u-boot-2023.04"
+
+#post-build
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build-ti.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-d k3-am625-sk.dtb"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/common/am6xx/genimage_ti.cfg"
diff --git a/linux/linux.hash b/linux/linux.hash
index 4fa9f701cd..9c0d26aa71 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -17,3 +17,4 @@ sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
 sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
+sha256  3256bbd9eb9b3ffec10e8e013ed433e79adf83cf731677be7fcdd53e25d1db98  linux-ti-linux-6.1.y-br1.tar.gz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
