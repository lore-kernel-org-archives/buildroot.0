From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Fri, 22 Jan 2016 12:53:40 -0300
Subject: [Buildroot] [PATCH 3/3] configs/firefly_rk3288: new board
In-Reply-To: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
References: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <1453478020-311-4-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
---
 configs/firefly_rk3288_defconfig | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 configs/firefly_rk3288_defconfig

diff --git a/configs/firefly_rk3288_defconfig b/configs/firefly_rk3288_defconfig
new file mode 100644
index 0000000..28becfd
--- /dev/null
+++ b/configs/firefly_rk3288_defconfig
@@ -0,0 +1,40 @@
+BR2_arm=y
+BR2_cortex_a15=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_HOSTNAME="firefly-rk3288"
+BR2_TARGET_GENERIC_ISSUE="Welcome to FIREFLY RK3288!"
+BR2_TARGET_GENERIC_GETTY_PORT="/dev/console"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/pre-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at github.com:mmind/linux-rockchip.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
+BR2_LINUX_KERNEL_DEFCONFIG="rk3288_veyron"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-firefly"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_MALI_T76X=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2016.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="firefly-rk3288"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.7.0
