From: Fabio Estevam <festevam@gmail.com>
Date: Thu,  5 May 2016 20:47:25 -0300
Subject: [Buildroot] [PATCH] configs: freescale_imx6ulevk_defconfig: Add
	alsa-utils
Message-ID: <1462492045-21257-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Add support for alsa-utils.

Also select BR2_TOOLCHAIN_BUILDROOT_WCHAR as this is a requirement
for alsamixer.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/freescale_imx6ulevk_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
index b8a1f86..8f36971 100644
--- a/configs/freescale_imx6ulevk_defconfig
+++ b/configs/freescale_imx6ulevk_defconfig
@@ -6,6 +6,7 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 
 # system
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
 # kernel
@@ -31,5 +32,10 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # filesystem / image
+BR2_PACKAGE_ALSA_UTILS=y
+BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
+BR2_PACKAGE_ALSA_UTILS_APLAY=y
+BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
+BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx6ulevk/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
-- 
1.9.1
