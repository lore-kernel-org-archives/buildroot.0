From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:49 +0200
Subject: [Buildroot] [PATCH 5/5] add defconfig for am335x-evm target
In-Reply-To: <1468312009-22124-1-git-send-email-lothar.felten@gmail.com>
References: <1468312009-22124-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468312009-22124-6-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the defconfig for the am335x-evm target.
It will also build device tree blobs for the ti am335x-evmsk, beaglebone and
beagleboneblack.
It includes SGX binary demos and Qt5 including examples on CPUs that have an
SGX graphics accelerator (AM3354 /8 /9)
SGX acceleration works on the am335x-evm (800x480 LCD) and the beagleboneblack
(HDMI, 1080x1920). SGX was not tested on the beaglebone (by default no LCD).
The am335x-evmsk is untested.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 configs/am335x-evm_defconfig | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 configs/am335x-evm_defconfig

diff --git a/configs/am335x-evm_defconfig b/configs/am335x-evm_defconfig
new file mode 100644
index 0000000..c47263e
--- /dev/null
+++ b/configs/am335x-evm_defconfig
@@ -0,0 +1,40 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_KERNEL_HEADERS_4_1=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_ENABLE_LOCALE_WHITELIST="C en_US"
+BR2_TARGET_GENERIC_HOSTNAME="TI am335x-evm"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am335x-evm/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
+BR2_LINUX_KERNEL_PATCH="board/ti/am335x-evm/patches/linux/"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ti/am335x-evm/kernel.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
+BR2_PACKAGE_FBV=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_QT5BASE_TSLIB=y
+BR2_PACKAGE_QT5QUICKCONTROLS=y
+BR2_PACKAGE_TI_SGX=y
+BR2_PACKAGE_TI_SGX_UM=y
+BR2_PACKAGE_TI_SGX_KM=y
+BR2_PACKAGE_TI_SGX_DEMOS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_PATCH="board/ti/am335x-evm/patches/uboot"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
1.9.1
