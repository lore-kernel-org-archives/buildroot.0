From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  8 Jul 2018 18:16:19 -0300
Subject: [Buildroot] [PATCH v2 2/2] configs/imx7d-sdb: Add new defconfig
In-Reply-To: <1531084579-7949-1-git-send-email-festevam@gmail.com>
References: <1531084579-7949-1-git-send-email-festevam@gmail.com>
Message-ID: <1531084579-7949-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce imx7d-sdb_defconfig that allows booting imx7d-sdb
board using U-Boot and kernel mainline instead of the
vendor provided versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None

 configs/imx7d-sdb_defconfig | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 configs/imx7d-sdb_defconfig

diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
new file mode 100644
index 0000000..b1cc5f8
--- /dev/null
+++ b/configs/imx7d-sdb_defconfig
@@ -0,0 +1,36 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 4.17 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.4"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
+BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
+
+# Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# required tools to create the eMMC image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
