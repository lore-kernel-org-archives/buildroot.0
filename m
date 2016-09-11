From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Sep 2016 16:42:06 -0300
Subject: [Buildroot] [PATCH 4/4] wandboard: Select required host tools for
	SD card generation
In-Reply-To: <1473622926-5476-1-git-send-email-festevam@gmail.com>
References: <1473622926-5476-1-git-send-email-festevam@gmail.com>
Message-ID: <1473622926-5476-4-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Select the required host tools for proper SD card generation.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/wandboard_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 4795b12..67041a6 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -3,7 +3,6 @@ BR2_cortex_a9=y
 # Linux headers same as kernel, a 4.7 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/wandboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -23,3 +22,8 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.7.4
