From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Oct 2019 11:00:58 -0300
Subject: [Buildroot] [PATCH] configs/imx6-sabreauto: Select
 BR2_TARGET_UBOOT_NEEDS_LZOP
Message-ID: <20191014140058.7753-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select BR2_TARGET_UBOOT_NEEDS_LZOP in order to avoid
the following build error on a host machine without lzop
installed:

/bin/sh: 1: lzop: not found

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/318105190

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabreauto_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabreauto_defconfig b/configs/imx6-sabreauto_defconfig
index ae5598fe37..d786431c63 100644
--- a/configs/imx6-sabreauto_defconfig
+++ b/configs/imx6-sabreauto_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
 # Bootloader
+BR2_TARGET_UBOOT_NEEDS_LZOP=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabreauto"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-- 
2.17.1
