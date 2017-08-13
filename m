From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 13 Aug 2017 13:01:09 -0300
Subject: [Buildroot] [PATCH] configs/toradex_apalis_imx6: bump to U-Boot
	2016.11 and kernel 4.1.41.
Message-ID: <1502640069-20437-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also fix U-Boot build error with GCC6.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 configs/toradex_apalis_imx6_defconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/toradex_apalis_imx6_defconfig b/configs/toradex_apalis_imx6_defconfig
index 74d1fb3b9c46..607faaeb8ff6 100644
--- a/configs/toradex_apalis_imx6_defconfig
+++ b/configs/toradex_apalis_imx6_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/toradex/apalis-imx6/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8f237ebe42f2cb911245369276a6b3043c2815f2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3f68dc7c600c0354f5df7f06b931661319addafb"
 BR2_LINUX_KERNEL_DEFCONFIG="apalis_imx6"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-apalis-eval imx6q-apalis-ixora imx6q-apalis_v1_0-eval imx6q-apalis_v1_0-ixora"
@@ -17,8 +17,9 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.toradex.com/u-boot-toradex.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1ef4a29e8cea0239411dde64f9617ad76248fd02"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="f0e414972b5b225e33ebe75574562266116746f9"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="apalis_imx6"
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.imx"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
1.9.1
