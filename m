From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 23:04:09 +0100
Subject: [Buildroot] [git commit] configs: via_imx6_vab820: correct genimage
	dependencies
Message-ID: <20160313220628.A8B187F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ead386e8d39fa1ca1f00f5aa7959a7eedde00c87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The genimage configuration creates a vfat filesystem, so ensure we have
dosfstools / mtools built for the host.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/via_imx6_vab820_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
index d2f62c5..b813dec 100644
--- a/configs/via_imx6_vab820_defconfig
+++ b/configs/via_imx6_vab820_defconfig
@@ -27,5 +27,7 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/via/imx6_vab820/post-image.sh"
