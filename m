From: Vincent Stehle <vincent.stehle@laposte.net>
Date: Wed, 18 Apr 2018 22:36:34 +0200
Subject: [Buildroot] [PATCH] configs: add openssl for kernel where necessary
Message-ID: <20180418203634.30100-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Stehl? <vincent.stehle@laposte.net>

Add host-openssl to those configs, which need it for the Linux kernel build.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/freescale_t1040d4rdb_defconfig | 1 +
 configs/grinn_chiliboard_defconfig     | 1 +
 configs/mx25pdk_defconfig              | 1 +
 configs/wandboard_defconfig            | 1 +
 configs/warp7_defconfig                | 1 +
 5 files changed, 5 insertions(+)

diff --git a/configs/freescale_t1040d4rdb_defconfig b/configs/freescale_t1040d4rdb_defconfig
index b8d162736c..df44046ef5 100644
--- a/configs/freescale_t1040d4rdb_defconfig
+++ b/configs/freescale_t1040d4rdb_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/t1040d4rdb"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_CPIO=y
diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
index 07fa0b3797..81d7bae911 100644
--- a/configs/grinn_chiliboard_defconfig
+++ b/configs/grinn_chiliboard_defconfig
@@ -10,6 +10,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.1"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-chiliboard"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/mx25pdk_defconfig b/configs/mx25pdk_defconfig
index f86ce7af02..ec4f8b8289 100644
--- a/configs/mx25pdk_defconfig
+++ b/configs/mx25pdk_defconfig
@@ -32,3 +32,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v4_v5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx25-pdk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 406bd113ff..4265fdcfb0 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -24,6 +24,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1 imx6q-wandboard-revd1 imx6dl-wandboard-revd1 imx6qp-wandboard-revd1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 344c4430b0..e1744d8275 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.15"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # U-Boot
 BR2_TARGET_UBOOT=y
-- 
2.17.0
