Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7FDC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3E66FB87;
	Tue, 21 Feb 2023 01:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3E66FB87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qDLrXEeAA8O4; Tue, 21 Feb 2023 01:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7FB46FBE9;
	Tue, 21 Feb 2023 01:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7FB46FBE9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFC6C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCD5C6FBB8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCD5C6FBB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9on2_479FU7i for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D119D6FBD7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D119D6FBD7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC3D581979; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 23:11:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8459abc46acc2dd304b1d30cc27eada296ebcfa1
X-Git-Newrev: 8c65ab5fab325b5abfe34652c1236c3b8b10d752
X-Patchwork-Hint: ignore
Message-Id: <20230220205242.CC3D581979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/imx8mn_bsh_smm_s2_defconfig: new defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5393249253452829869=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5393249253452829869==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8c65ab5fab325b5abfe34652c1236c3b8b10d752
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

BSH SMM S2 (SystemMaster S2) Board is an add-on board which provide
input and output interfaces to a dedicated carrier board. It is designed
mainly to provide graphical/video and connectivity interfaces to the
appliance.

Board support package includes the following components:
- mainline Linux kernel 6.1.6
- mainline U-Boot 2022-07
- default packages from buildroot

https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
The smm s2 board is basically the same as the pro except it boots from
NAND instead of eMMC.

Co-authored-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   4 +
 board/bsh/imx8mn-bsh-smm-s2/flash.sh               |  26 +
 board/bsh/imx8mn-bsh-smm-s2/linux.fragment         | 895 +++++++++++++++++++++
 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst          |  29 +
 ...figs-Remove-rootwait-1-to-all-the-affecte.patch | 160 ++++
 board/bsh/imx8mn-bsh-smm-s2/post-build.sh          |   4 +
 board/bsh/imx8mn-bsh-smm-s2/readme.txt             |  75 ++
 configs/imx8mn_bsh_smm_s2_defconfig                |  41 +
 8 files changed, 1234 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4ead3a71f2..2e187d7b03 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -686,6 +686,8 @@ F:	package/luaexpat/
 F:	package/xinetd/
 
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
+F:	board/bsh/
+F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	package/sscep/
 F:	package/uuu/
 
@@ -2118,6 +2120,8 @@ F:	package/python-crc16/
 F:	package/python-pyzmq/
 
 N:	Michael Trimarchi <michael@amarulasolutions.com>
+F:	board/bsh/
+F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	package/python-spidev/
 
 N:	Michael Vetter <jubalh@iodoru.org>
diff --git a/board/bsh/imx8mn-bsh-smm-s2/flash.sh b/board/bsh/imx8mn-bsh-smm-s2/flash.sh
new file mode 100755
index 0000000000..1f343d516d
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2/flash.sh
@@ -0,0 +1,26 @@
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
+IMAGES_DIR=${OUTPUT_DIR}/images
+
+${OUTPUT_DIR}/host/bin/uuu -v -b ${IMAGES_DIR}/nand-full.lst \
+  ${IMAGES_DIR}/flash.bin \
+  ${IMAGES_DIR}/flash.bin \
+  ${IMAGES_DIR}/rootfs.ubifs \
+  ${IMAGES_DIR}/Image \
+  ${IMAGES_DIR}/freescale/imx8mn-bsh-smm-s2.dtb
+
diff --git a/board/bsh/imx8mn-bsh-smm-s2/linux.fragment b/board/bsh/imx8mn-bsh-smm-s2/linux.fragment
new file mode 100644
index 0000000000..80803ab088
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2/linux.fragment
@@ -0,0 +1,895 @@
+# CONFIG_BPF_SYSCALL is not set
+CONFIG_TASK_DELAY_ACCT=y
+CONFIG_CGROUP_FREEZER=y
+# CONFIG_CGROUP_BPF is not set
+CONFIG_RELAY=y
+# CONFIG_ARCH_ACTIONS is not set
+# CONFIG_ARCH_SUNXI is not set
+# CONFIG_ARCH_ALPINE is not set
+# CONFIG_ARCH_APPLE is not set
+# CONFIG_ARCH_BCM2835 is not set
+# CONFIG_ARCH_BCM4908 is not set
+# CONFIG_ARCH_BCM_IPROC is not set
+# CONFIG_ARCH_BERLIN is not set
+# CONFIG_ARCH_BRCMSTB is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_K3 is not set
+# CONFIG_ARCH_LAYERSCAPE is not set
+# CONFIG_ARCH_LG1K is not set
+# CONFIG_ARCH_HISI is not set
+# CONFIG_ARCH_KEEMBAY is not set
+# CONFIG_ARCH_MEDIATEK is not set
+# CONFIG_ARCH_MESON is not set
+# CONFIG_ARCH_MVEBU is not set
+# CONFIG_ARCH_QCOM is not set
+# CONFIG_ARCH_RENESAS is not set
+# CONFIG_ARCH_ROCKCHIP is not set
+# CONFIG_ARCH_S32 is not set
+# CONFIG_ARCH_SEATTLE is not set
+# CONFIG_ARCH_INTEL_SOCFPGA is not set
+# CONFIG_ARCH_SYNQUACER is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_TESLA_FSD is not set
+# CONFIG_ARCH_SPRD is not set
+# CONFIG_ARCH_THUNDER is not set
+# CONFIG_ARCH_THUNDER2 is not set
+# CONFIG_ARCH_UNIPHIER is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_VISCONTI is not set
+# CONFIG_ARCH_XGENE is not set
+# CONFIG_ARCH_ZYNQMP is not set
+# CONFIG_KEXEC is not set
+# CONFIG_KEXEC_FILE is not set
+# CONFIG_XEN is not set
+# CONFIG_ARM64_PTR_AUTH is not set
+# CONFIG_ARM64_TLB_RANGE is not set
+# CONFIG_ARM64_MTE is not set
+CONFIG_PM_DEBUG=y
+CONFIG_PM_TEST_SUSPEND=y
+# CONFIG_HIBERNATION is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
+CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
+# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
+# CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM is not set
+# CONFIG_ARM_ARMADA_37XX_CPUFREQ is not set
+CONFIG_ARM_IMX_CPUFREQ_DT=y
+# CONFIG_ARM_QCOM_CPUFREQ_NVMEM is not set
+# CONFIG_ARM_QCOM_CPUFREQ_HW is not set
+# CONFIG_ARM_RASPBERRYPI_CPUFREQ is not set
+# CONFIG_ARM_SCMI_CPUFREQ is not set
+# CONFIG_ARM_TEGRA186_CPUFREQ is not set
+# CONFIG_ARM_MEDIATEK_CPUFREQ is not set
+# CONFIG_QORIQ_CPUFREQ is not set
+# CONFIG_ACPI_APEI_PCIEAER is not set
+# CONFIG_VIRTUALIZATION is not set
+# CONFIG_KVM is not set
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_IPV6=y
+CONFIG_MODVERSIONS=y
+CONFIG_IPV6_SIT=m
+CONFIG_NET_DSA_TAG_OCELOT=m
+CONFIG_VLAN_8021Q=y
+CONFIG_LLC2=y
+CONFIG_NET_SCH_MULTIQ=m
+CONFIG_NET_CLS_TCINDEX=m
+CONFIG_NET_PKTGEN=m
+CONFIG_BT=y
+CONFIG_BT_RFCOMM=y
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=y
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=y
+# CONFIG_CAN_RCAR is not set
+# CONFIG_CAN_RCAR_CANFD is not set
+# CONFIG_CAN_MCP251XFD is not set
+CONFIG_BT_HCIUART=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_3WIRE=y
+CONFIG_BT_HCIVHCI=y
+CONFIG_CFG80211=y
+CONFIG_NL80211_TESTMODE=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=y
+# CONFIG_BT_HCIUART_MRVL is not set
+# CONFIG_BT_MRVL is not set
+# CONFIG_BT_MRVL_SDIO is not set
+# CONFIG_BT_QCOMSMD is not set
+# CONFIG_RFKILL is not set
+# CONFIG_PCI is not set
+# CONFIG_PCIEPORTBUS is not set
+# CONFIG_PCIEAER is not set
+# CONFIG_PCI_IOV is not set
+# CONFIG_PCI_PASID is not set
+# CONFIG_HOTPLUG_PCI is not set
+# CONFIG_HOTPLUG_PCI_ACPI is not set
+# CONFIG_PCI_AARDVARK is not set
+# CONFIG_PCI_TEGRA is not set
+# CONFIG_PCIE_RCAR_HOST is not set
+# CONFIG_PCIE_RCAR_EP is not set
+# CONFIG_PCI_HOST_GENERIC is not set
+# CONFIG_PCI_XGENE is not set
+# CONFIG_PCIE_ALTERA is not set
+# CONFIG_PCIE_ALTERA_MSI is not set
+# CONFIG_PCI_HOST_THUNDER_PEM is not set
+# CONFIG_PCI_HOST_THUNDER_ECAM is not set
+# CONFIG_PCIE_ROCKCHIP_HOST is not set
+# CONFIG_PCIE_BRCMSTB is not set
+# CONFIG_PCI_IMX6 is not set
+# CONFIG_PCI_LAYERSCAPE is not set
+# CONFIG_PCI_HISI is not set
+# CONFIG_PCIE_QCOM is not set
+# CONFIG_PCIE_ARMADA_8K is not set
+# CONFIG_PCIE_KIRIN is not set
+# CONFIG_PCIE_HISI_STB is not set
+# CONFIG_PCIE_TEGRA194_HOST is not set
+# CONFIG_PCIE_VISCONTI_HOST is not set
+# CONFIG_PCIE_LAYERSCAPE_GEN4 is not set
+# CONFIG_PCI_ENDPOINT is not set
+# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
+# CONFIG_PCI_EPF_TEST is not set
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
+CONFIG_BRCMSTB_GISB_ARB=y
+CONFIG_VEXPRESS_CONFIG=y
+# CONFIG_HISILICON_LPC is not set
+# CONFIG_TEGRA_ACONNECT is not set
+# CONFIG_RASPBERRYPI_FIRMWARE is not set
+# CONFIG_INTEL_STRATIX10_SERVICE is not set
+# CONFIG_INTEL_STRATIX10_RSU is not set
+CONFIG_IMX_DSP=y
+# CONFIG_GNSS is not set
+# CONFIG_GNSS_MTK_SERIAL is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+# CONFIG_MTD_NAND_BRCMNAND is not set
+CONFIG_MTD_NAND_GPMI_NAND=y
+# CONFIG_MTD_NAND_MARVELL is not set
+# CONFIG_MTD_NAND_FSL_IFC is not set
+# CONFIG_MTD_NAND_QCOM is not set
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_UBI=y
+# CONFIG_BLK_DEV_NVME is not set
+# CONFIG_PCI_ENDPOINT_TEST is not set
+CONFIG_RAID_ATTRS=m
+# CONFIG_SCSI_HISI_SAS_PCI is not set
+# CONFIG_MEGARAID_SAS is not set
+# CONFIG_SCSI_MPT3SAS is not set
+# CONFIG_SCSI_UFS_QCOM is not set
+# CONFIG_SCSI_UFS_HISI is not set
+# CONFIG_SCSI_UFS_EXYNOS is not set
+# CONFIG_SATA_AHCI is not set
+CONFIG_AHCI_IMX=y
+# CONFIG_AHCI_BRCM is not set
+# CONFIG_AHCI_MVEBU is not set
+# CONFIG_SATA_SIL24 is not set
+# CONFIG_SATA_RCAR is not set
+CONFIG_DM_CRYPT=m
+# CONFIG_NET_DSA_BCM_SF2 is not set
+# CONFIG_NET_DSA_MSCC_FELIX is not set
+# CONFIG_NET_XGENE is not set
+# CONFIG_ATL1C is not set
+# CONFIG_SYSTEMPORT is not set
+# CONFIG_BNX2X is not set
+# CONFIG_THUNDER_NIC_PF is not set
+CONFIG_FSL_XGMAC_MDIO=y
+CONFIG_FSL_ENETC_IERB=y
+# CONFIG_FSL_FMAN is not set
+# CONFIG_FSL_DPAA_ETH is not set
+# CONFIG_FSL_DPAA2_ETH is not set
+# CONFIG_FSL_ENETC is not set
+# CONFIG_FSL_ENETC_VF is not set
+# CONFIG_FSL_ENETC_QOS is not set
+CONFIG_MVMDIO=y
+CONFIG_MSCC_OCELOT_SWITCH=m
+# CONFIG_HNS3 is not set
+# CONFIG_HNS3_HCLGE is not set
+# CONFIG_HNS3_ENET is not set
+# CONFIG_E1000 is not set
+# CONFIG_E1000E is not set
+# CONFIG_IGB is not set
+# CONFIG_IGBVF is not set
+# CONFIG_MVNETA is not set
+# CONFIG_MVPP2 is not set
+# CONFIG_SKY2 is not set
+# CONFIG_MLX4_EN is not set
+# CONFIG_MLX5_CORE is not set
+# CONFIG_MLX5_CORE_EN is not set
+# CONFIG_R8169 is not set
+# CONFIG_SH_ETH is not set
+# CONFIG_RAVB is not set
+CONFIG_STMMAC_ETH=y
+CONFIG_DWMAC_GENERIC=m
+CONFIG_MICROCHIP_PHY=y
+CONFIG_NXP_TJA11XX_PHY=y
+CONFIG_MDIO_BITBANG=y
+# CONFIG_SNI_AVE is not set
+# CONFIG_SNI_NETSEC is not set
+# CONFIG_TI_K3_AM65_CPSW_NUSS is not set
+# CONFIG_QCOM_IPA is not set
+# CONFIG_MESON_GXL_PHY is not set
+# CONFIG_AQUANTIA_PHY is not set
+# CONFIG_BCM54140_PHY is not set
+# CONFIG_MARVELL_PHY is not set
+# CONFIG_MARVELL_10G_PHY is not set
+# CONFIG_MICREL_PHY is not set
+# CONFIG_MICROSEMI_PHY is not set
+# CONFIG_AT803X_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_ROCKCHIP_PHY is not set
+# CONFIG_DP83867_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+# CONFIG_USB_BRCMSTB is not set
+CONFIG_USB_RTL8152=y
+CONFIG_USB_USBNET=y
+CONFIG_BRCMFMAC=y
+CONFIG_HOSTAP=y
+# CONFIG_ATH10K is not set
+# CONFIG_ATH10K_PCI is not set
+# CONFIG_ATH10K_SNOC is not set
+# CONFIG_WCN36XX is not set
+# CONFIG_MWIFIEX is not set
+# CONFIG_MWIFIEX_SDIO is not set
+# CONFIG_MWIFIEX_PCIE is not set
+CONFIG_KEYBOARD_SNVS_PWRKEY=y
+# CONFIG_KEYBOARD_IMX_SC_KEY is not set
+# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
+# CONFIG_INPUT_PM8941_PWRKEY is not set
+# CONFIG_INPUT_PM8XXX_VIBRATOR is not set
+# CONFIG_INPUT_PWM_BEEPER is not set
+# CONFIG_INPUT_PWM_VIBRA is not set
+# CONFIG_INPUT_HISI_POWERKEY is not set
+# CONFIG_SERIAL_8250_BCM2835AUX is not set
+# CONFIG_SERIAL_8250_OMAP is not set
+# CONFIG_SERIAL_8250_MT6577 is not set
+# CONFIG_SERIAL_8250_UNIPHIER is not set
+# CONFIG_SERIAL_MESON is not set
+# CONFIG_SERIAL_MESON_CONSOLE is not set
+# CONFIG_SERIAL_SAMSUNG is not set
+# CONFIG_SERIAL_SAMSUNG_CONSOLE is not set
+# CONFIG_SERIAL_TEGRA is not set
+# CONFIG_SERIAL_TEGRA_TCU is not set
+# CONFIG_SERIAL_SH_SCI is not set
+# CONFIG_SERIAL_MSM is not set
+# CONFIG_SERIAL_MSM_CONSOLE is not set
+# CONFIG_SERIAL_QCOM_GENI is not set
+# CONFIG_SERIAL_QCOM_GENI_CONSOLE is not set
+# CONFIG_SERIAL_MVEBU_UART is not set
+# CONFIG_SERIAL_OWL is not set
+# CONFIG_I2C_MUX is not set
+# CONFIG_I2C_BCM2835 is not set
+# CONFIG_I2C_MESON is not set
+# CONFIG_I2C_MT65XX is not set
+# CONFIG_I2C_MV64XXX is not set
+# CONFIG_I2C_OMAP is not set
+# CONFIG_I2C_OWL is not set
+# CONFIG_I2C_PXA is not set
+# CONFIG_I2C_QCOM_CCI is not set
+# CONFIG_I2C_QCOM_GENI is not set
+# CONFIG_I2C_QUP is not set
+# CONFIG_I2C_RIIC is not set
+# CONFIG_I2C_S3C2410 is not set
+# CONFIG_I2C_SH_MOBILE is not set
+# CONFIG_I2C_TEGRA is not set
+# CONFIG_I2C_UNIPHIER_F is not set
+# CONFIG_I2C_RCAR is not set
+# CONFIG_SPI_ARMADA_3700 is not set
+# CONFIG_SPI_BCM2835 is not set
+# CONFIG_SPI_BCM2835AUX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+# CONFIG_SPI_DW_DMA is not set
+# CONFIG_SPI_DW_MMIO is not set
+CONFIG_SPI_IMX=y
+# CONFIG_SPI_FSL_DSPI is not set
+# CONFIG_SPI_MESON_SPICC is not set
+# CONFIG_SPI_MESON_SPIFC is not set
+# CONFIG_SPI_ORION is not set
+CONFIG_SPI_SPIDEV=y
+CONFIG_SPI_SLAVE=y
+CONFIG_SPI_SLAVE_TIME=y
+CONFIG_SPI_SLAVE_SYSTEM_CONTROL=y
+CONFIG_PINCTRL=y
+# CONFIG_SPI_RPCIF is not set
+# CONFIG_SPI_RSPI is not set
+# CONFIG_SPI_QCOM_QSPI is not set
+# CONFIG_SPI_QUP is not set
+# CONFIG_SPI_QCOM_GENI is not set
+# CONFIG_SPI_S3C64XX is not set
+# CONFIG_SPI_SH_MSIOF is not set
+# CONFIG_SPI_SUN6I is not set
+# CONFIG_SPMI is not set
+# CONFIG_PINCTRL_OWL is not set
+# CONFIG_PINCTRL_S700 is not set
+# CONFIG_PINCTRL_S900 is not set
+CONFIG_GPIOLIB=y
+# CONFIG_PINCTRL_MSM is not set
+# CONFIG_PINCTRL_IPQ8074 is not set
+# CONFIG_PINCTRL_IPQ6018 is not set
+# CONFIG_PINCTRL_MSM8916 is not set
+# CONFIG_PINCTRL_MSM8994 is not set
+# CONFIG_PINCTRL_MSM8996 is not set
+# CONFIG_PINCTRL_MSM8998 is not set
+# CONFIG_PINCTRL_QCS404 is not set
+# CONFIG_PINCTRL_QDF2XXX is not set
+# CONFIG_PINCTRL_QCOM_SPMI_PMIC is not set
+# CONFIG_PINCTRL_SC7180 is not set
+# CONFIG_PINCTRL_SC7280 is not set
+# CONFIG_PINCTRL_SDM845 is not set
+# CONFIG_PINCTRL_SM8150 is not set
+# CONFIG_PINCTRL_SM8250 is not set
+# CONFIG_PINCTRL_SM8350 is not set
+# CONFIG_PINCTRL_SM8450 is not set
+# CONFIG_PINCTRL_LPASS_LPI is not set
+# CONFIG_GPIO_DAVINCI is not set
+# CONFIG_GPIO_MPC8XXX is not set
+# CONFIG_GPIO_RCAR is not set
+# CONFIG_GPIO_UNIPHIER is not set
+# CONFIG_GPIO_VISCONTI is not set
+# CONFIG_GPIO_XGENE_SB is not set
+CONFIG_POWER_RESET_BRCMSTB=y
+# CONFIG_GPIO_MAX77620 is not set
+# CONFIG_GPIO_SL28CPLD is not set
+# CONFIG_POWER_RESET_MSM is not set
+# CONFIG_POWER_RESET_QCOM_PON is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_BQ25890 is not set
+# CONFIG_CHARGER_BQ25980 is not set
+# CONFIG_SENSORS_JC42 is not set
+# CONFIG_SENSORS_LM75 is not set
+# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
+# CONFIG_SENSORS_SL28CPLD is not set
+CONFIG_THERMAL_WRITABLE_TRIPS=y
+CONFIG_IMX_SC_THERMAL=y
+CONFIG_IMX8MM_THERMAL=y
+CONFIG_QORIQ_THERMAL=y
+# CONFIG_SUN8I_THERMAL is not set
+# CONFIG_ROCKCHIP_THERMAL is not set
+# CONFIG_RCAR_THERMAL is not set
+# CONFIG_RCAR_GEN3_THERMAL is not set
+# CONFIG_RZG2L_THERMAL is not set
+# CONFIG_ARMADA_THERMAL is not set
+# CONFIG_BCM2711_THERMAL is not set
+# CONFIG_BCM2835_THERMAL is not set
+# CONFIG_BRCMSTB_THERMAL is not set
+# CONFIG_EXYNOS_THERMAL is not set
+# CONFIG_TEGRA_SOCTHERM is not set
+# CONFIG_TEGRA_BPMP_THERMAL is not set
+# CONFIG_QCOM_TSENS is not set
+# CONFIG_QCOM_SPMI_TEMP_ALARM is not set
+# CONFIG_QCOM_LMH is not set
+# CONFIG_UNIPHIER_THERMAL is not set
+# CONFIG_SL28CPLD_WATCHDOG is not set
+# CONFIG_S3C2410_WATCHDOG is not set
+# CONFIG_BCM7038_WDT is not set
+# CONFIG_SUNXI_WATCHDOG is not set
+CONFIG_IMX_SC_WDT=y
+CONFIG_IMX7ULP_WDT=y
+# CONFIG_QCOM_WDT is not set
+# CONFIG_MESON_GXBB_WATCHDOG is not set
+# CONFIG_MESON_WATCHDOG is not set
+# CONFIG_RENESAS_WDT is not set
+# CONFIG_RENESAS_RZG2LWDT is not set
+# CONFIG_UNIPHIER_WATCHDOG is not set
+# CONFIG_BCM2835_WDT is not set
+# CONFIG_MFD_ALTERA_SYSMGR is not set
+# CONFIG_MFD_AXP20X_RSB is not set
+# CONFIG_MFD_EXYNOS_LPASS is not set
+# CONFIG_MFD_HI655X_PMIC is not set
+# CONFIG_MFD_MT6397 is not set
+# CONFIG_MFD_SPMI_PMIC is not set
+# CONFIG_MFD_SL28CPLD is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_HI655X is not set
+# CONFIG_REGULATOR_MP8859 is not set
+# CONFIG_REGULATOR_MT6358 is not set
+# CONFIG_REGULATOR_MT6397 is not set
+# CONFIG_REGULATOR_PF8X00 is not set
+# CONFIG_REGULATOR_QCOM_RPMH is not set
+# CONFIG_REGULATOR_QCOM_SMD_RPM is not set
+# CONFIG_REGULATOR_QCOM_SPMI is not set
+# CONFIG_REGULATOR_TPS65132 is not set
+CONFIG_MEDIA_SUPPORT=y
+# CONFIG_RC_CORE is not set
+# CONFIG_RC_DECODERS is not set
+# CONFIG_RC_DEVICES is not set
+# CONFIG_IR_MESON is not set
+# CONFIG_IR_SUNXI is not set
+CONFIG_SDR_PLATFORM_DRIVERS=y
+# CONFIG_VIDEO_QCOM_CAMSS is not set
+# CONFIG_VIDEO_RCAR_CSI2 is not set
+# CONFIG_VIDEO_RCAR_VIN is not set
+# CONFIG_VIDEO_SUN6I_CSI is not set
+# CONFIG_VIDEO_RCAR_ISP is not set
+# CONFIG_VIDEO_SAMSUNG_S5P_JPEG is not set
+# CONFIG_VIDEO_SAMSUNG_S5P_MFC is not set
+# CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC is not set
+# CONFIG_VIDEO_RENESAS_FDP1 is not set
+# CONFIG_VIDEO_RENESAS_FCP is not set
+# CONFIG_VIDEO_RENESAS_VSP1 is not set
+# CONFIG_VIDEO_QCOM_VENUS is not set
+# CONFIG_VIDEO_RCAR_DRIF is not set
+CONFIG_VIDEO_OV5640=y
+CONFIG_DRM=y
+CONFIG_DRM_I2C_CH7006=m
+CONFIG_DRM_I2C_SIL164=m
+# CONFIG_DRM_NOUVEAU is not set
+# CONFIG_DRM_EXYNOS is not set
+# CONFIG_DRM_EXYNOS5433_DECON is not set
+# CONFIG_DRM_EXYNOS7_DECON is not set
+# CONFIG_DRM_EXYNOS_DSI is not set
+# CONFIG_DRM_EXYNOS_DP is not set
+# CONFIG_DRM_EXYNOS_HDMI is not set
+# CONFIG_DRM_EXYNOS_MIC is not set
+# CONFIG_DRM_ROCKCHIP is not set
+# CONFIG_ROCKCHIP_ANALOGIX_DP is not set
+# CONFIG_ROCKCHIP_CDN_DP is not set
+# CONFIG_ROCKCHIP_DW_HDMI is not set
+# CONFIG_ROCKCHIP_DW_MIPI_DSI is not set
+# CONFIG_ROCKCHIP_INNO_HDMI is not set
+# CONFIG_ROCKCHIP_LVDS is not set
+# CONFIG_DRM_RCAR_DU is not set
+# CONFIG_DRM_RCAR_MIPI_DSI is not set
+# CONFIG_DRM_SUN4I is not set
+# CONFIG_DRM_SUN6I_DSI is not set
+# CONFIG_DRM_SUN8I_DW_HDMI is not set
+# CONFIG_DRM_SUN8I_MIXER is not set
+# CONFIG_DRM_MSM is not set
+# CONFIG_DRM_TEGRA is not set
+# CONFIG_DRM_PANEL_BOE_TV101WUM_NL6 is not set
+# CONFIG_DRM_PANEL_LVDS is not set
+# CONFIG_DRM_PANEL_SIMPLE is not set
+# CONFIG_DRM_PANEL_EDP is not set
+# CONFIG_DRM_PANEL_MANTIX_MLAF057WE51 is not set
+# CONFIG_DRM_PANEL_RAYDIUM_RM67191 is not set
+# CONFIG_DRM_PANEL_SITRONIX_ST7703 is not set
+CONFIG_DRM_DISPLAY_CONNECTOR=m
+# CONFIG_DRM_LONTIUM_LT8912B is not set
+CONFIG_DRM_NWL_MIPI_DSI=y
+# CONFIG_DRM_LONTIUM_LT9611UXC is not set
+# CONFIG_DRM_PARADE_PS8640 is not set
+CONFIG_DRM_I2C_ADV7511=y
+CONFIG_DRM_DW_HDMI_I2S_AUDIO=m
+CONFIG_DRM_IMX_DCSS=y
+# CONFIG_DRM_VC4 is not set
+# CONFIG_DRM_HISI_HIBMC is not set
+CONFIG_DRM_MXSFB=y
+# CONFIG_DRM_MEDIATEK is not set
+# CONFIG_DRM_MEDIATEK_HDMI is not set
+# CONFIG_DRM_MESON is not set
+CONFIG_DRM_LEGACY=y
+# CONFIG_FB is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_EFI is not set
+# CONFIG_BACKLIGHT_PWM is not set
+# CONFIG_BACKLIGHT_LP855X is not set
+# CONFIG_LOGO is not set
+CONFIG_SND_DYNAMIC_MINORS=y
+CONFIG_SND_ALOOP=m
+# CONFIG_SND_SPI is not set
+# CONFIG_SND_USB is not set
+# CONFIG_SND_HDA_TEGRA is not set
+# CONFIG_SND_HDA_CODEC_HDMI is not set
+CONFIG_SND_SOC_FSL_ASRC=y
+CONFIG_SND_SOC_FSL_EASRC=y
+CONFIG_SND_IMX_SOC=y
+CONFIG_SND_SOC_FSL_ASOC_CARD=y
+CONFIG_SND_SOC_SOF_TOPLEVEL=y
+CONFIG_SND_SOC_SOF_OF=m
+CONFIG_SND_SOC_SOF_IMX_TOPLEVEL=y
+CONFIG_SND_SOC_AK4458=y
+CONFIG_SND_SOC_AK5558=y
+CONFIG_SND_SOC_PCM512x_I2C=y
+CONFIG_SND_SIMPLE_CARD=y
+CONFIG_SND_AUDIO_GRAPH_CARD=y
+CONFIG_USB_CONN_GPIO=y
+# CONFIG_SND_BCM2835_SOC_I2S is not set
+# CONFIG_SND_SOC_FSL_MICFIL is not set
+# CONFIG_SND_SOC_IMX_SGTL5000 is not set
+# CONFIG_SND_SOC_IMX_SPDIF is not set
+# CONFIG_SND_SOC_IMX_AUDMIX is not set
+# CONFIG_SND_MESON_AXG_SOUND_CARD is not set
+# CONFIG_SND_MESON_GX_SOUND_CARD is not set
+# CONFIG_SND_SOC_QCOM is not set
+# CONFIG_SND_SOC_APQ8016_SBC is not set
+# CONFIG_SND_SOC_MSM8996 is not set
+# CONFIG_SND_SOC_SDM845 is not set
+# CONFIG_SND_SOC_SM8250 is not set
+# CONFIG_SND_SOC_ROCKCHIP is not set
+# CONFIG_SND_SOC_ROCKCHIP_SPDIF is not set
+# CONFIG_SND_SOC_ROCKCHIP_RT5645 is not set
+# CONFIG_SND_SOC_RK3399_GRU_SOUND is not set
+# CONFIG_SND_SOC_SAMSUNG is not set
+# CONFIG_SND_SOC_RCAR is not set
+# CONFIG_SND_SOC_RZ is not set
+# CONFIG_SND_SUN4I_I2S is not set
+# CONFIG_SND_SUN4I_SPDIF is not set
+# CONFIG_SND_SOC_TEGRA is not set
+# CONFIG_SND_SOC_TEGRA210_AHUB is not set
+# CONFIG_SND_SOC_TEGRA210_DMIC is not set
+# CONFIG_SND_SOC_TEGRA210_I2S is not set
+# CONFIG_SND_SOC_TEGRA186_DSPK is not set
+# CONFIG_SND_SOC_TEGRA210_ADMAIF is not set
+# CONFIG_SND_SOC_TEGRA210_MVC is not set
+# CONFIG_SND_SOC_TEGRA210_SFC is not set
+# CONFIG_SND_SOC_TEGRA210_AMX is not set
+# CONFIG_SND_SOC_TEGRA210_ADX is not set
+# CONFIG_SND_SOC_TEGRA210_MIXER is not set
+# CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD is not set
+# CONFIG_SND_SOC_AK4613 is not set
+# CONFIG_SND_SOC_ES7134 is not set
+# CONFIG_SND_SOC_ES7241 is not set
+# CONFIG_SND_SOC_GTM601 is not set
+# CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
+# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
+# CONFIG_SND_SOC_PCM3168A_I2C is not set
+# CONFIG_SND_SOC_RT5659 is not set
+# CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set
+# CONFIG_SND_SOC_SIMPLE_MUX is not set
+# CONFIG_SND_SOC_TAS571X is not set
+# CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
+# CONFIG_SND_SOC_WCD934X is not set
+# CONFIG_SND_SOC_WM8904 is not set
+# CONFIG_SND_SOC_WM8960 is not set
+# CONFIG_SND_SOC_WM8962 is not set
+# CONFIG_SND_SOC_WM8978 is not set
+# CONFIG_SND_SOC_WSA881X is not set
+# CONFIG_SND_SOC_NAU8822 is not set
+# CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
+# CONFIG_SND_SOC_LPASS_VA_MACRO is not set
+# CONFIG_SND_AUDIO_GRAPH_CARD2 is not set
+# CONFIG_HID_MULTITOUCH is not set
+# CONFIG_I2C_HID_ACPI is not set
+# CONFIG_I2C_HID_OF is not set
+# CONFIG_USB_XHCI_PCI_RENESAS is not set
+# CONFIG_USB_XHCI_TEGRA is not set
+# CONFIG_USB_EHCI_EXYNOS is not set
+# CONFIG_USB_OHCI_EXYNOS is not set
+CONFIG_USB_HCD_TEST_MODE=y
+# CONFIG_USB_RENESAS_USBHS_HCD is not set
+# CONFIG_USB_RENESAS_USBHS is not set
+CONFIG_USB_UAS=y
+# CONFIG_USB_CDNS_SUPPORT is not set
+# CONFIG_USB_CDNS3 is not set
+# CONFIG_USB_CDNS3_GADGET is not set
+# CONFIG_USB_CDNS3_HOST is not set
+# CONFIG_USB_MTU3 is not set
+# CONFIG_USB_MUSB_SUNXI is not set
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_CONSOLE=y
+CONFIG_USB_SERIAL_GENERIC=y
+CONFIG_USB_SERIAL_SIMPLE=y
+CONFIG_USB_SERIAL_FTDI_SIO=y
+CONFIG_USB_TEST=m
+CONFIG_USB_EHSET_TEST_FIXTURE=y
+# CONFIG_USB_SERIAL_CP210X is not set
+# CONFIG_USB_SERIAL_OPTION is not set
+CONFIG_USB_MXS_PHY=y
+CONFIG_USB_ULPI=y
+CONFIG_USB_SNP_UDC_PLAT=y
+CONFIG_USB_BDC_UDC=y
+CONFIG_USB_CONFIGFS=y
+# CONFIG_USB_RENESAS_USBHS_UDC is not set
+# CONFIG_USB_RENESAS_USB3 is not set
+# CONFIG_USB_TEGRA_XUDC is not set
+CONFIG_USB_CONFIGFS_F_LB_SS=y
+CONFIG_USB_CONFIGFS_F_UAC1=y
+CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
+CONFIG_USB_CONFIGFS_F_UAC2=y
+CONFIG_USB_CONFIGFS_F_MIDI=y
+CONFIG_USB_CONFIGFS_F_HID=y
+CONFIG_USB_CONFIGFS_F_UVC=y
+CONFIG_USB_ZERO=m
+CONFIG_USB_AUDIO=m
+CONFIG_USB_ETH=m
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+CONFIG_TYPEC=y
+CONFIG_TYPEC_TCPM=y
+CONFIG_TYPEC_TCPCI=y
+# CONFIG_TYPEC_TPS6598X is not set
+# CONFIG_MMC_SDHCI_ACPI is not set
+# CONFIG_MMC_SDHCI_TEGRA is not set
+# CONFIG_MMC_MESON_GX is not set
+# CONFIG_MMC_SDHCI_MSM is not set
+# CONFIG_MMC_SDHI is not set
+# CONFIG_MMC_UNIPHIER is not set
+# CONFIG_MMC_DW_ROCKCHIP is not set
+# CONFIG_MMC_SUNXI is not set
+# CONFIG_MMC_BCM2835 is not set
+# CONFIG_MMC_MTK is not set
+# CONFIG_MMC_OWL is not set
+# CONFIG_LEDS_LM3692X is not set
+# CONFIG_LEDS_PCA9532 is not set
+# CONFIG_EDAC_LAYERSCAPE is not set
+# CONFIG_RTC_DRV_HYM8563 is not set
+# CONFIG_RTC_DRV_PCF85063 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_RV3028 is not set
+# CONFIG_RTC_DRV_FSL_FTM_ALARM is not set
+# CONFIG_RTC_DRV_S3C is not set
+CONFIG_RTC_DRV_SNVS=y
+CONFIG_RTC_DRV_IMX_SC=y
+# CONFIG_RTC_DRV_SUN6I is not set
+# CONFIG_RTC_DRV_ARMADA38X is not set
+# CONFIG_RTC_DRV_PM8XXX is not set
+# CONFIG_RTC_DRV_TEGRA is not set
+# CONFIG_RTC_DRV_XGENE is not set
+# CONFIG_RTC_DRV_MT6397 is not set
+CONFIG_BCM_SBA_RAID=m
+# CONFIG_DMA_BCM2835 is not set
+# CONFIG_DMA_SUN6I is not set
+CONFIG_FSL_QDMA=m
+CONFIG_IMX_SDMA=y
+# CONFIG_K3_DMA is not set
+# CONFIG_MV_XOR is not set
+CONFIG_MXS_DMA=y
+# CONFIG_OWL_DMA is not set
+# CONFIG_TEGRA186_GPC_DMA is not set
+# CONFIG_TEGRA20_APB_DMA is not set
+# CONFIG_TEGRA210_ADMA is not set
+# CONFIG_QCOM_BAM_DMA is not set
+CONFIG_DMATEST=y
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_SYSTEM=y
+CONFIG_DMABUF_HEAPS_CMA=y
+# CONFIG_RCAR_DMAC is not set
+# CONFIG_RENESAS_USB_DMAC is not set
+# CONFIG_RZ_DMAC is not set
+# CONFIG_TI_K3_UDMA is not set
+# CONFIG_TI_K3_UDMA_GLUE_LAYER is not set
+# CONFIG_VFIO_PCI is not set
+# CONFIG_VIRTIO_PCI is not set
+# CONFIG_XEN_GNTDEV is not set
+# CONFIG_XEN_GRANT_DEV_ALLOC is not set
+# CONFIG_VIDEO_HANTRO is not set
+# CONFIG_VIDEO_IMX_MEDIA is not set
+# CONFIG_COMMON_CLK_SCMI is not set
+# CONFIG_COMMON_CLK_FSL_SAI is not set
+CONFIG_COMMON_CLK_XGENE=y
+# CONFIG_COMMON_CLK_BD718XX is not set
+# CONFIG_CLK_RASPBERRYPI is not set
+# CONFIG_CLK_IMX8MM is not set
+# CONFIG_CLK_IMX8MP is not set
+# CONFIG_CLK_IMX8MQ is not set
+# CONFIG_CLK_IMX8QXP is not set
+# CONFIG_CLK_IMX8ULP is not set
+# CONFIG_TI_SCI_CLK is not set
+# CONFIG_COMMON_CLK_QCOM is not set
+# CONFIG_QCOM_A53PLL is not set
+# CONFIG_QCOM_CLK_APCS_MSM8916 is not set
+# CONFIG_QCOM_CLK_APCC_MSM8996 is not set
+# CONFIG_QCOM_CLK_SMD_RPM is not set
+# CONFIG_QCOM_CLK_RPMH is not set
+# CONFIG_IPQ_GCC_6018 is not set
+# CONFIG_IPQ_GCC_8074 is not set
+# CONFIG_MSM_GCC_8916 is not set
+# CONFIG_MSM_GCC_8994 is not set
+# CONFIG_MSM_MMCC_8996 is not set
+# CONFIG_MSM_GCC_8998 is not set
+# CONFIG_QCS_GCC_404 is not set
+# CONFIG_SC_GCC_7180 is not set
+# CONFIG_SC_GCC_7280 is not set
+# CONFIG_SDM_CAMCC_845 is not set
+# CONFIG_SDM_GPUCC_845 is not set
+# CONFIG_SDM_VIDEOCC_845 is not set
+# CONFIG_SDM_DISPCC_845 is not set
+# CONFIG_SM_GCC_8350 is not set
+# CONFIG_SM_GCC_8450 is not set
+# CONFIG_SM_GPUCC_8150 is not set
+# CONFIG_SM_GPUCC_8250 is not set
+# CONFIG_QCOM_HFPLL is not set
+# CONFIG_CLK_GFM_LPASS_SM8250 is not set
+# CONFIG_CLK_RCAR_USB2_CLOCK_SEL is not set
+# CONFIG_HWSPINLOCK_QCOM is not set
+# CONFIG_RENESAS_OSTM is not set
+# CONFIG_BCM2835_MBOX is not set
+# CONFIG_QCOM_APCS_IPC is not set
+# CONFIG_QCOM_IPCC is not set
+# CONFIG_ROCKCHIP_IOMMU is not set
+# CONFIG_TEGRA_IOMMU_SMMU is not set
+# CONFIG_MTK_IOMMU is not set
+# CONFIG_QCOM_IOMMU is not set
+CONFIG_IMX_REMOTEPROC=y
+CONFIG_IMX_DSP_REMOTEPROC=y
+CONFIG_RPMSG_CHAR=y
+# CONFIG_QCOM_Q6V5_MSS is not set
+# CONFIG_QCOM_Q6V5_PAS is not set
+# CONFIG_QCOM_SYSMON is not set
+# CONFIG_QCOM_WCNSS_PIL is not set
+# CONFIG_RPMSG_QCOM_GLINK_SMEM is not set
+# CONFIG_RPMSG_QCOM_SMD is not set
+CONFIG_SOC_BRCMSTB=y
+# CONFIG_OWL_PM_DOMAINS is not set
+# CONFIG_RASPBERRYPI_POWER is not set
+# CONFIG_FSL_DPAA is not set
+# CONFIG_FSL_MC_DPIO is not set
+CONFIG_SOC_TI=y
+# CONFIG_MTK_DEVAPC is not set
+# CONFIG_MTK_PMIC_WRAP is not set
+# CONFIG_QCOM_AOSS_QMP is not set
+# CONFIG_QCOM_COMMAND_DB is not set
+# CONFIG_QCOM_CPR is not set
+# CONFIG_QCOM_GENI_SE is not set
+# CONFIG_QCOM_RMTFS_MEM is not set
+# CONFIG_QCOM_RPMH is not set
+# CONFIG_QCOM_RPMHPD is not set
+# CONFIG_QCOM_RPMPD is not set
+# CONFIG_QCOM_SMEM is not set
+# CONFIG_QCOM_SMD_RPM is not set
+# CONFIG_QCOM_SMP2P is not set
+# CONFIG_QCOM_SMSM is not set
+# CONFIG_QCOM_SOCINFO is not set
+# CONFIG_QCOM_STATS is not set
+# CONFIG_QCOM_WCNSS_CTRL is not set
+# CONFIG_QCOM_APR is not set
+# CONFIG_ARCH_R8A77995 is not set
+# CONFIG_ARCH_R8A77990 is not set
+# CONFIG_ARCH_R8A77950 is not set
+# CONFIG_ARCH_R8A77951 is not set
+# CONFIG_ARCH_R8A77965 is not set
+# CONFIG_ARCH_R8A77960 is not set
+# CONFIG_ARCH_R8A77961 is not set
+# CONFIG_ARCH_R8A779F0 is not set
+# CONFIG_ARCH_R8A77980 is not set
+# CONFIG_ARCH_R8A77970 is not set
+# CONFIG_ARCH_R8A779A0 is not set
+# CONFIG_ARCH_R8A774C0 is not set
+# CONFIG_ARCH_R8A774E1 is not set
+# CONFIG_ARCH_R8A774A1 is not set
+# CONFIG_ARCH_R8A774B1 is not set
+# CONFIG_ARCH_R9A07G044 is not set
+# CONFIG_ROCKCHIP_IODOMAIN is not set
+# CONFIG_ROCKCHIP_PM_DOMAINS is not set
+# CONFIG_ARCH_TEGRA_132_SOC is not set
+# CONFIG_ARCH_TEGRA_210_SOC is not set
+# CONFIG_ARCH_TEGRA_186_SOC is not set
+# CONFIG_ARCH_TEGRA_194_SOC is not set
+# CONFIG_ARCH_TEGRA_234_SOC is not set
+# CONFIG_TI_SCI_PM_DOMAINS is not set
+# CONFIG_ARM_IMX_BUS_DEVFREQ is not set
+# CONFIG_ARM_IMX8M_DDRC_DEVFREQ is not set
+CONFIG_MEMORY=y
+# CONFIG_RENESAS_RPCIF is not set
+CONFIG_IMX8QXP_ADC=y
+# CONFIG_EXYNOS_ADC is not set
+# CONFIG_QCOM_SPMI_VADC is not set
+# CONFIG_QCOM_SPMI_ADC5 is not set
+# CONFIG_ROCKCHIP_SARADC is not set
+# CONFIG_RZG2L_ADC is not set
+# CONFIG_TI_ADS1015 is not set
+CONFIG_IIO_ST_LSM6DSX=y
+# CONFIG_SENSORS_ISL29018 is not set
+# CONFIG_VCNL4000 is not set
+# CONFIG_IIO_ST_MAGN_3AXIS is not set
+# CONFIG_MPL3115 is not set
+# CONFIG_PWM_BCM2835 is not set
+# CONFIG_PWM_BRCMSTB is not set
+CONFIG_PWM_FSL_FTM=m
+CONFIG_PWM_IMX27=y
+# CONFIG_PWM_MESON is not set
+# CONFIG_PWM_MTK_DISP is not set
+# CONFIG_PWM_MEDIATEK is not set
+# CONFIG_PWM_RCAR is not set
+# CONFIG_PWM_RENESAS_TPU is not set
+# CONFIG_PWM_ROCKCHIP is not set
+# CONFIG_PWM_SAMSUNG is not set
+# CONFIG_PWM_SL28CPLD is not set
+# CONFIG_PWM_SUN4I is not set
+# CONFIG_PWM_TEGRA is not set
+# CONFIG_PWM_VISCONTI is not set
+# CONFIG_SL28CPLD_INTC is not set
+# CONFIG_QCOM_PDC is not set
+# CONFIG_RESET_QCOM_AOSS is not set
+# CONFIG_RESET_QCOM_PDC is not set
+# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
+# CONFIG_RESET_TI_SCI is not set
+CONFIG_PHY_CADENCE_SALVO=y
+CONFIG_PHY_MIXEL_MIPI_DPHY=y
+# CONFIG_PHY_SUN4I_USB is not set
+# CONFIG_PHY_CADENCE_SIERRA is not set
+# CONFIG_PHY_FSL_IMX8M_PCIE is not set
+# CONFIG_PHY_HI6220_USB is not set
+# CONFIG_PHY_HISTB_COMBPHY is not set
+# CONFIG_PHY_HISI_INNO_USB2 is not set
+# CONFIG_PHY_MVEBU_CP110_COMPHY is not set
+# CONFIG_PHY_MTK_TPHY is not set
+# CONFIG_PHY_QCOM_QMP is not set
+# CONFIG_PHY_QCOM_QUSB2 is not set
+CONFIG_PHY_SAMSUNG_USB2=y
+# CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
+# CONFIG_PHY_RCAR_GEN3_PCIE is not set
+# CONFIG_PHY_RCAR_GEN3_USB2 is not set
+# CONFIG_PHY_RCAR_GEN3_USB3 is not set
+# CONFIG_PHY_ROCKCHIP_EMMC is not set
+# CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
+# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
+# CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY is not set
+# CONFIG_PHY_ROCKCHIP_PCIE is not set
+# CONFIG_PHY_ROCKCHIP_TYPEC is not set
+# CONFIG_PHY_SAMSUNG_UFS is not set
+# CONFIG_PHY_UNIPHIER_USB2 is not set
+# CONFIG_PHY_UNIPHIER_USB3 is not set
+# CONFIG_PHY_TEGRA_XUSB is not set
+# CONFIG_PHY_AM654_SERDES is not set
+# CONFIG_PHY_J721E_WIZ is not set
+CONFIG_FSL_IMX8_DDR_PMU=y
+# CONFIG_QCOM_L2_PMU is not set
+# CONFIG_QCOM_L3_PMU is not set
+# CONFIG_MTK_EFUSE is not set
+# CONFIG_QCOM_QFPROM is not set
+# CONFIG_ROCKCHIP_EFUSE is not set
+# CONFIG_NVMEM_SUNXI_SID is not set
+# CONFIG_UNIPHIER_EFUSE is not set
+# CONFIG_MESON_EFUSE is not set
+# CONFIG_NVMEM_RMEM is not set
+# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
+# CONFIG_FPGA_MGR_ALTERA_CVP is not set
+# CONFIG_FPGA_MGR_STRATIX10_SOC is not set
+# CONFIG_SLIMBUS is not set
+# CONFIG_SLIM_QCOM_NGD_CTRL is not set
+# CONFIG_INTERCONNECT_IMX is not set
+# CONFIG_INTERCONNECT_IMX8MM is not set
+# CONFIG_INTERCONNECT_IMX8MN is not set
+# CONFIG_INTERCONNECT_IMX8MQ is not set
+# CONFIG_INTERCONNECT_QCOM is not set
+# CONFIG_INTERCONNECT_QCOM_MSM8916 is not set
+# CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
+# CONFIG_INTERCONNECT_QCOM_SC7280 is not set
+# CONFIG_INTERCONNECT_QCOM_SDM845 is not set
+# CONFIG_INTERCONNECT_QCOM_SM8150 is not set
+# CONFIG_INTERCONNECT_QCOM_SM8250 is not set
+# CONFIG_INTERCONNECT_QCOM_SM8350 is not set
+# CONFIG_INTERCONNECT_QCOM_SM8450 is not set
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_UBIFS_FS=y
+CONFIG_SQUASHFS_XZ=y
+CONFIG_CRYPTO_USER=y
+CONFIG_CRYPTO_TEST=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_CHACHA20POLY1305=m
+CONFIG_CRYPTO_CFB=m
+CONFIG_CRYPTO_CTS=m
+CONFIG_CRYPTO_LRW=m
+CONFIG_CRYPTO_OFB=m
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_XCBC=m
+CONFIG_CRYPTO_VMAC=m
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_STREEBOG=m
+CONFIG_CRYPTO_WP512=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_ARC4=m
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
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_AEAD=m
+# CONFIG_CRYPTO_DEV_SUN8I_CE is not set
+# CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM is not set
+# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
+CONFIG_CRYPTO_DEV_AMLOGIC_GXL=m
+CONFIG_INDIRECT_PIO=y
+CONFIG_CRC_CCITT=m
+# CONFIG_CRYPTO_DEV_HISI_SEC2 is not set
+# CONFIG_CRYPTO_DEV_HISI_ZIP is not set
+# CONFIG_CRYPTO_DEV_HISI_HPRE is not set
+# CONFIG_CRYPTO_DEV_HISI_TRNG is not set
+CONFIG_IRQ_POLL=y
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_INFO_REDUCED is not set
+CONFIG_CORESIGHT=y
+CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y
+CONFIG_CORESIGHT_SOURCE_ETM4X=y
diff --git a/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst b/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
new file mode 100644
index 0000000000..c01d2d6c1d
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
@@ -0,0 +1,29 @@
+# @_flash.bin            | bootloader
+# @_image   [_flash.bin] | image burn to nand, default is the same as bootloader
+# @_filesystem           | filesystem to burn
+# @_kernel               | kernel image
+# @_dtb                  | dtb image
+
+# This command will be run when ROM support stream mode
+# i.MX8QXP, i.MX8QM
+SDPS: boot -f _flash.bin
+
+FB: ucmd setenv fastboot_buffer ${loadaddr}
+FB: download -f _image
+# Burn image to nandfit partition if needed
+FB: ucmd if env exists nandfit_part; then nand erase.part nandfit; nand write ${fastboot_buffer} nandfit ${filesize}; else true; fi;
+FB: ucmd nandbcb init ${fastboot_buffer} nandboot ${filesize}
+
+FB[-t 10000]: ucmd ubi part nandrootfs
+FB[-t 10000]: ucmd ubi create root -
+FB: download -f _filesystem
+FB[-t 60000]: ucmd ubi write ${loadaddr} root ${filesize}
+
+FB: download -f _kernel
+FB[-t 10000]: ucmd nand write ${loadaddr} nandkernel ${filesize}
+
+FB: download -f _dtb
+FB[-t 8000]: ucmd nand write ${loadaddr} nanddtb ${filesize}
+
+FB: reboot
+FB: done
diff --git a/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch b/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
new file mode 100644
index 0000000000..59db559b93
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
@@ -0,0 +1,160 @@
+From 3878b941c6bde84e29b2725e4261d85bea828752 Mon Sep 17 00:00:00 2001
+From: Michael Trimarchi <michael@amarulasolutions.com>
+Date: Sun, 22 May 2022 15:22:08 +0200
+Subject: [PATCH] include/configs: Remove rootwait=1 to all the affected boards
+
+rootwait=1 is not a valid kernel boot parameters. According
+to the documenation is only rootwait
+
+rootwait	[KNL]	Wait (indefinitely) for root device to show up.
+			Useful for devices that are detected asynchronously
+			(e.g. USB and MMC devices).
+
+Fix:
+Unknown kernel command line parameters "rootwait=1", will be passed to user space.
+
+Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
+Reviewed-by: Heiko Schocher <hs@denx.de>
+Link: https://patchwork.ozlabs.org/project/uboot/patch/20220520110013.32811-1-michael@amarulasolutions.com/
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ include/configs/am335x_evm.h           | 2 +-
+ include/configs/am43xx_evm.h           | 2 +-
+ include/configs/baltos.h               | 2 +-
+ include/configs/chiliboard.h           | 2 +-
+ include/configs/etamin.h               | 2 +-
+ include/configs/imx8mn_bsh_smm_s2.h    | 2 +-
+ include/configs/siemens-am33x-common.h | 4 ++--
+ include/configs/ti_armv7_keystone2.h   | 2 +-
+ include/environment/ti/nand.h          | 2 +-
+ 9 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index fd5b209a52db..f301a6dc835b 100644
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -34,7 +34,7 @@
+ 		"root=${nandroot} " \
+ 		"rootfstype=${nandrootfstype}\0" \
+ 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system,2048\0" \
+-	"nandrootfstype=ubifs rootwait=1\0" \
++	"nandrootfstype=ubifs rootwait\0" \
+ 	"nandboot=echo Booting from nand ...; " \
+ 		"run nandargs; " \
+ 		"nand read ${fdtaddr} NAND.u-boot-spl-os; " \
+diff --git a/include/configs/am43xx_evm.h b/include/configs/am43xx_evm.h
+index 5057441f7506..1f5c3cd04e88 100644
+--- a/include/configs/am43xx_evm.h
++++ b/include/configs/am43xx_evm.h
+@@ -166,7 +166,7 @@
+ 		"root=${nandroot} " \
+ 		"rootfstype=${nandrootfstype}\0" \
+ 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system,4096\0" \
+-	"nandrootfstype=ubifs rootwait=1\0" \
++	"nandrootfstype=ubifs rootwait\0" \
+ 	"nandboot=echo Booting from nand ...; " \
+ 		"run nandargs; " \
+ 		"nand read ${fdtaddr} NAND.u-boot-spl-os; " \
+diff --git a/include/configs/baltos.h b/include/configs/baltos.h
+index b881d8c03fd7..7b43741fde7c 100644
+--- a/include/configs/baltos.h
++++ b/include/configs/baltos.h
+@@ -37,7 +37,7 @@
+ 		"root=${nandroot} " \
+ 		"rootfstype=${nandrootfstype}\0" \
+ 	"nandroot=ubi0:rootfs rw ubi.mtd=5\0" \
+-	"nandrootfstype=ubifs rootwait=1\0" \
++	"nandrootfstype=ubifs rootwait\0" \
+ 	"nandboot=echo Booting from nand ...; " \
+ 		"run nandargs; " \
+ 		"setenv loadaddr 0x84000000; " \
+diff --git a/include/configs/chiliboard.h b/include/configs/chiliboard.h
+index 82acda595f09..8bad0f9ac4b6 100644
+--- a/include/configs/chiliboard.h
++++ b/include/configs/chiliboard.h
+@@ -20,7 +20,7 @@
+ 		"root=${nandroot} " \
+ 		"rootfstype=${nandrootfstype}\0" \
+ 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system\0" \
+-	"nandrootfstype=ubifs rootwait=1\0" \
++	"nandrootfstype=ubifs rootwait\0" \
+ 	"nandboot=echo Booting from nand ...; " \
+ 		"run nandargs; " \
+ 		"nand read ${fdt_addr} NAND.u-boot-spl-os; " \
+diff --git a/include/configs/etamin.h b/include/configs/etamin.h
+index 9cf93924df93..1c0a86d1ed10 100644
+--- a/include/configs/etamin.h
++++ b/include/configs/etamin.h
+@@ -113,7 +113,7 @@
+ 	"nand_active_ubi_vol=rootfs_a\0" \
+ 	"rootfs_name=rootfs\0" \
+ 	"kernel_name=uImage\0"\
+-	"nand_root_fs_type=ubifs rootwait=1\0" \
++	"nand_root_fs_type=ubifs rootwait\0" \
+ 	"nand_args=run bootargs_defaults;" \
+ 		"mtdparts default;" \
+ 		"setenv ${partitionset_active} true;" \
+diff --git a/include/configs/imx8mn_bsh_smm_s2.h b/include/configs/imx8mn_bsh_smm_s2.h
+index d09c2ab01610..0dc514f00684 100644
+--- a/include/configs/imx8mn_bsh_smm_s2.h
++++ b/include/configs/imx8mn_bsh_smm_s2.h
+@@ -22,7 +22,7 @@
+ 		"root=${nandroot} " \
+ 		"rootfstype=${nandrootfstype}\0" \
+ 	"nandroot=ubi0:root rw ubi.mtd=nandrootfs\0" \
+-	"nandrootfstype=ubifs rootwait=1\0" \
++	"nandrootfstype=ubifs rootwait\0" \
+ 	"nandboot=echo Booting from nand ...; " \
+ 		"run nandargs; " \
+ 		"nand read ${fdt_addr_r} nanddtb; " \
+diff --git a/include/configs/siemens-am33x-common.h b/include/configs/siemens-am33x-common.h
+index 08c4d52d658f..9f1a6cd51b40 100644
+--- a/include/configs/siemens-am33x-common.h
++++ b/include/configs/siemens-am33x-common.h
+@@ -237,7 +237,7 @@
+ 	"nand_active_ubi_vol=rootfs_a\0" \
+ 	"nand_active_ubi_vol_A=rootfs_a\0" \
+ 	"nand_active_ubi_vol_B=rootfs_b\0" \
+-	"nand_root_fs_type=ubifs rootwait=1\0" \
++	"nand_root_fs_type=ubifs rootwait\0" \
+ 	"nand_src_addr=0x280000\0" \
+ 	"nand_src_addr_A=0x280000\0" \
+ 	"nand_src_addr_B=0x780000\0" \
+@@ -314,7 +314,7 @@
+ 	"nand_active_ubi_vol=rootfs_a\0" \
+ 	"rootfs_name=rootfs\0" \
+ 	"kernel_name=uImage\0"\
+-	"nand_root_fs_type=ubifs rootwait=1\0" \
++	"nand_root_fs_type=ubifs rootwait\0" \
+ 	"nand_args=run bootargs_defaults;" \
+ 		"mtdparts default;" \
+ 		"setenv ${partitionset_active} true;" \
+diff --git a/include/configs/ti_armv7_keystone2.h b/include/configs/ti_armv7_keystone2.h
+index 57f013cbf846..133daecf7164 100644
+--- a/include/configs/ti_armv7_keystone2.h
++++ b/include/configs/ti_armv7_keystone2.h
+@@ -180,7 +180,7 @@
+ 		"sf write ${loadaddr} 0 ${filesize}\0"		\
+ 	"burn_uboot_nand=nand erase 0 0x100000; "			\
+ 		"nand write ${loadaddr} 0 ${filesize}\0"		\
+-	"args_all=setenv bootargs console=ttyS0,115200n8 rootwait=1 "	\
++	"args_all=setenv bootargs console=ttyS0,115200n8 rootwait "	\
+ 		KERNEL_MTD_PARTS					\
+ 	"args_net=setenv bootargs ${bootargs} rootfstype=nfs "		\
+ 		"root=/dev/nfs rw nfsroot=${serverip}:${nfs_root},"	\
+diff --git a/include/environment/ti/nand.h b/include/environment/ti/nand.h
+index 11dcefcc41ca..7d00afa2b10f 100644
+--- a/include/environment/ti/nand.h
++++ b/include/environment/ti/nand.h
+@@ -14,7 +14,7 @@
+ 		"root=${nandroot} " \
+ 		"rootfstype=${nandrootfstype}\0" \
+ 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system,2048\0" \
+-	"nandrootfstype=ubifs rootwait=1\0" \
++	"nandrootfstype=ubifs rootwait\0" \
+ 	"nandboot=echo Booting from nand ...; " \
+ 		"run nandargs; " \
+ 		"nand read ${fdtaddr} NAND.u-boot-spl-os; " \
+-- 
+2.32.0
+
diff --git a/board/bsh/imx8mn-bsh-smm-s2/post-build.sh b/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
new file mode 100755
index 0000000000..49df4cd6fb
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+cp ${BOARD_DIR}/nand-full.lst ${BINARIES_DIR}
diff --git a/board/bsh/imx8mn-bsh-smm-s2/readme.txt b/board/bsh/imx8mn-bsh-smm-s2/readme.txt
new file mode 100644
index 0000000000..37081091e8
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2/readme.txt
@@ -0,0 +1,75 @@
+i.MX8MN BSH SMM S2
+==================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the i.MX8MN BSH SMM S2 PRO board.
+
+Building
+--------
+
+Configure buildroot:
+
+  $ make imx8mn_bsh_smm_s2_defconfig
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
+    ├── bl31.bin
+    ├── ddr3*
+    ├── flash.bin
+    ├── freescale/imx8mn-bsh-smm-s2.dtb
+    ├── Image
+    ├── nand-full.lst
+    ├── rootfs.ext2
+    ├── rootfs.ext4 -> rootfs.ext2
+    ├── rootfs.tar
+    ├── rootfs.ubifs
+    ├── u-boot.bin
+    └── u-boot-spl.bin
+
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
+  $ board/bsh/imx8mn-bsh-smm-s2/flash.sh output/
+
+It will flash the bootloader, the Device Tree Blob, the kernel image
+and the UBI root file system.
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
new file mode 100644
index 0000000000..4b03d2e89e
--- /dev/null
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -0,0 +1,41 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/bsh/imx8mn-bsh-smm-s2/patches"
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.6"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/imx8mn-bsh-smm-s2/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-bsh-smm-s2"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX_DDR3=y
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
+BR2_TARGET_ROOTFS_UBIFS_RT_NONE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_UUU=y


--===============5393249253452829869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5393249253452829869==--

