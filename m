From: Alexandre Gambier <agambier.dev@gmail.com>
Date: Wed, 11 Oct 2017 14:19:30 +0200
Subject: [Buildroot] [PATCH 1/9] iMX6S-PICO: add default config file
	(imx6spico_defconfig)
Message-ID: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Gambier <agambier.dev@gmail.com>
---
 configs/imx6spico_defconfig | 58 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 configs/imx6spico_defconfig

diff --git a/configs/imx6spico_defconfig b/configs/imx6spico_defconfig
new file mode 100644
index 0000000..16ebf5b
--- /dev/null
+++ b/configs/imx6spico_defconfig
@@ -0,0 +1,58 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_KERNEL_HEADERS_4_1=y
+BR2_GCC_VERSION_5_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_GCC_ENABLE_LTO=y
+BR2_PACKAGE_HOST_GDB=y
+BR2_PACKAGE_HOST_GDB_PYTHON=y
+BR2_ROOTFS_MERGED_USR=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/technexion/imx6spico/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technexion/imx6spico/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/TechNexion/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ecb66a3d34667fb4402457bbd6a4864e73b0fe87"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/technexion/imx6spico/linux/linux-tn-imx-4.1.15/defconfig"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-pico_dwarf"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_EXPAT=y
+BR2_PACKAGE_LIBCAP=y
+BR2_PACKAGE_READLINE=y
+BR2_PACKAGE_DHCP=y
+BR2_PACKAGE_DHCP_CLIENT=y
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_NETCAT=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_HTOP=y
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_PACKAGE_UTIL_LINUX=y
+BR2_PACKAGE_UTIL_LINUX_BINARIES=y
+BR2_PACKAGE_UTIL_LINUX_FSCK=y
+BR2_PACKAGE_UTIL_LINUX_MOUNT=y
+BR2_PACKAGE_UTIL_LINUX_NOLOGIN=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="40M"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="pico-imx6"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/TechNexion/u-boot-edm.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="6b12193853eceda0da3da7eeb73c41ed6059acb4"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.7.4
