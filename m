From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 22:36:52 +0200
Subject: [Buildroot] [git commit] configs/kontron_smarc_sal28: remove kernel
 config fragment
Message-ID: <20201012202547.4391B7FACB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2f8ec5e840848e0fefb4d5d721b4f75298b9a43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with linux kernel v5.9 all required configuration options are
available in the default config.

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/kontron/smarc-sal28/linux.fragment | 18 ------------------
 configs/kontron_smarc_sal28_defconfig    |  1 -
 2 files changed, 19 deletions(-)

diff --git a/board/kontron/smarc-sal28/linux.fragment b/board/kontron/smarc-sal28/linux.fragment
deleted file mode 100644
index 00bbcc0923..0000000000
--- a/board/kontron/smarc-sal28/linux.fragment
+++ /dev/null
@@ -1,18 +0,0 @@
-CONFIG_NET_DSA=m
-CONFIG_NET_DSA_TAG_OCELOT=m
-CONFIG_NET_DSA_MSCC_FELIX=m
-CONFIG_NET_SCHED=y
-CONFIG_NET_SCH_CBS=m
-CONFIG_NET_SCH_ETF=m
-CONFIG_NET_SCH_TAPRIO=m
-CONFIG_CAN_FLEXCAN=m
-CONFIG_FSL_ENETC=y
-CONFIG_FSL_ENETC_VF=m
-CONFIG_FSL_ENETC_QOS=y
-CONFIG_MSCC_OCELOT_SWITCH=m
-CONFIG_PCIE_DW_PLAT_HOST=y
-CONFIG_GPIO_MPC8XXX=y
-CONFIG_SND_SOC_FSL_SAI=m
-CONFIG_SND_SOC_WM8904=m
-CONFIG_RTC_DRV_RV8803=y
-CONFIG_COMMON_CLK_FSL_SAI=y
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 9eaea2a636..53cb776a58 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -8,7 +8,6 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/kontron/smarc-sal28/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var2 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
 BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
