From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 21:58:30 +0200
Subject: [Buildroot] [git commit] wandboard: Select required host tools for
	SD card generation
Message-ID: <20160911195841.A1FB9802AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc431d2ed9167cbbb704cdaaaa766aa7fba26bb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select the required host tools for proper SD card generation.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
