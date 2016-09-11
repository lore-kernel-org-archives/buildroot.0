From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Sep 2016 16:42:04 -0300
Subject: [Buildroot] [PATCH 2/4] wandboard: Use kernel version 4.7.3
In-Reply-To: <1473622926-5476-1-git-send-email-festevam@gmail.com>
References: <1473622926-5476-1-git-send-email-festevam@gmail.com>
Message-ID: <1473622926-5476-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Wandboard is well supported in the mainline kernel, so let's switch
from the 3.14 vendor kernel to 4.7.3 mainline kernel version.

As mainline use more dts files to support both B1 and C1 versions of the
board, adjust the dts entries accordingly.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/wandboard_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index cd06f40..33b7f0d 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
-# Linux headers same as kernel, a 3.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
@@ -21,9 +21,9 @@ BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/wandboard/uboot-env.txt"
 BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/wandboard-org/linux"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="e2213f9a98dd7413ee5a9ca40cf60e8cb8292f4a"
-BR2_LINUX_KERNEL_DEFCONFIG="wandboard"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.3"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.7.4
