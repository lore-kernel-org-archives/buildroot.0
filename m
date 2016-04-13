From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:40 -0300
Subject: [Buildroot] [PATCH 15/15] board/via_imx6_vab820: Leverage the new
	genimage infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-16-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let's rework the board and config files to use the
recently added genimage infra, which generates the
SD card image directly.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 configs/via_imx6_vab820_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
index a86c5139db04..d66ef6e8600f 100644
--- a/configs/via_imx6_vab820_defconfig
+++ b/configs/via_imx6_vab820_defconfig
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/via/imx6_vab820/genimage.cfg"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/via/imx6_vab820/post-image.sh"
-- 
2.7.0
