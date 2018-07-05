From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Thu,  5 Jul 2018 08:57:55 +0200
Subject: [Buildroot] [PATCH 3/3] configs/beaglebone_qt5: bump kernel and
 uboot version
In-Reply-To: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
References: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <1530773875-19452-3-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bring beaglebone_qt5 to the same level as beaglebone.

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 .../{linux-4.1-sgx.fragment => linux-4.9-sgx.fragment}      |  0
 configs/beaglebone_qt5_defconfig                            | 13 +++++--------
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename board/beaglebone/{linux-4.1-sgx.fragment => linux-4.9-sgx.fragment} (100%)

diff --git a/board/beaglebone/linux-4.1-sgx.fragment b/board/beaglebone/linux-4.9-sgx.fragment
similarity index 100%
rename from board/beaglebone/linux-4.1-sgx.fragment
rename to board/beaglebone/linux-4.9-sgx.fragment
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index fb61bf5..d66d112 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -1,9 +1,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_GCC_VERSION_5_X=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
@@ -11,11 +10,11 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a75d8e93056181d512f6c818e8627bd4554aaf92"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-4.1-sgx.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-4.9-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk"
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
 BR2_PACKAGE_QT5BASE_EXAMPLES=y
@@ -30,13 +29,11 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="124M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.7.4
