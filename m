From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 15 Oct 2019 23:31:00 +0200
Subject: [Buildroot] [RFC PATCH 3/4] configs/beaglebone_qt5: bump kernel and
 uboot version, add weston
In-Reply-To: <20191015213101.27460-1-lothar.felten@gmail.com>
References: <20191015213101.27460-1-lothar.felten@gmail.com>
Message-ID: <20191015213101.27460-3-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update to TI SDK 06.00.00.07 Linux kernel version 4.19
update u-boot to 2019.07

packages: select weston and qt5wayland
rename kernel fragment file

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 ...nux-4.1-sgx.fragment => linux-sgx.fragment} |  1 +
 configs/beaglebone_qt5_defconfig               | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename board/beaglebone/{linux-4.1-sgx.fragment => linux-sgx.fragment} (92%)

diff --git a/board/beaglebone/linux-4.1-sgx.fragment b/board/beaglebone/linux-sgx.fragment
similarity index 92%
rename from board/beaglebone/linux-4.1-sgx.fragment
rename to board/beaglebone/linux-sgx.fragment
index c0d2e7b28..58d46f588 100644
--- a/board/beaglebone/linux-4.1-sgx.fragment
+++ b/board/beaglebone/linux-sgx.fragment
@@ -10,3 +10,4 @@ CONFIG_DRM_OMAP_WB_M2M=y
 CONFIG_DRM_TILCDC=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM=y
+CONFIG_DRM_LEGACY=y
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index fb61bf54d..7029e66a8 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -1,36 +1,38 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_GCC_VERSION_5_X=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4dae378bbe721277b08699d1d88ffae12acc9b09"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-4.1-sgx.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
 BR2_PACKAGE_QT5BASE_EXAMPLES=y
 BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_QT5BASE_DEFAULT_QPA="wayland"
 BR2_PACKAGE_QT5QUICKCONTROLS=y
+BR2_PACKAGE_QT5WAYLAND=y
+BR2_PACKAGE_QT5WAYLAND_COMPOSITOR=y
+BR2_PACKAGE_WESTON=y
 BR2_PACKAGE_TI_SGX_DEMOS=y
 BR2_PACKAGE_TI_SGX_KM=y
 BR2_PACKAGE_TI_SGX_UM=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="124M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.17.1
