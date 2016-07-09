From: Georges Savoundararadj <savoundg@gmail.com>
Date: Fri,  8 Jul 2016 23:40:02 -0700
Subject: [Buildroot] [PATCH 3/5] imx6sololiteevk: use the common genimage
	template
In-Reply-To: <20160709064004.8844-1-savoundg@gmail.com>
References: <20160709064004.8844-1-savoundg@gmail.com>
Message-ID: <20160709064004.8844-4-savoundg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Generate an sdcard image based on the common Freescale genimage
  template.

Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
---
 configs/freescale_imx6sololiteevk_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 18043e8..3827751 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -20,8 +20,14 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
 
 # filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
-- 
2.9.0
