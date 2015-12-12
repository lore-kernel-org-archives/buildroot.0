From: Sanchayan Maity <maitysanchayan@gmail.com>
Date: Sat, 12 Dec 2015 12:36:57 +0530
Subject: [Buildroot] [PATCH v2 1/2] configs: Add support for Toradex Colibri
	Vybrid Modules
In-Reply-To: <cover.1449902276.git.maitysanchayan@gmail.com>
References: <cover.1449902276.git.maitysanchayan@gmail.com>
Message-ID: <57ea79a5678e14be13215ddc1be041c962b3be10.1449902276.git.maitysanchayan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a minimal default configuration for Colibri Vybrid modules.

Tested on Colibri VF50 and VF61 modules.
---
 configs/colibri_vf_defconfig | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 configs/colibri_vf_defconfig

diff --git a/configs/colibri_vf_defconfig b/configs/colibri_vf_defconfig
new file mode 100644
index 0000000..19a3394
--- /dev/null
+++ b/configs/colibri_vf_defconfig
@@ -0,0 +1,38 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_EABIHF=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_TARGET_GENERIC_HOSTNAME="colibri-vf"
+BR2_TARGET_GENERIC_ISSUE="Colibri VF 20151211"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a276a526ac8e0d255f4165221c5bece5940dbc95"
+BR2_LINUX_KERNEL_DEFCONFIG="colibri_vf"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="vf610-colibri-eval-v3 vf500-colibri-eval-v3"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
+BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
+BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=8112
+BR2_TARGET_ROOTFS_UBIFS_RT_LZO=y
+BR2_TARGET_ROOTFS_UBIFS_NONE=y
+BR2_TARGET_ROOTFS_UBIFS_OPTS="--space-fixup -o ubifs.img"
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x20000
+BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
+BR2_TARGET_ROOTFS_UBI_OPTS=""
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.toradex.com/u-boot-toradex.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1bb2de8875a385dd390678e8d46d3aab5a70445d"
+BR2_TARGET_UBOOT_USE_DEFCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="colibri_vf"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nand.imx"
-- 
2.6.4
