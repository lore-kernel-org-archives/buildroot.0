From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 14 Dec 2016 12:22:52 -0200
Subject: [Buildroot] [PATCH] configs/mx6sx_udoo_neo: Remove
	BR2_TARGET_GENERIC_GETTY_PORT
Message-ID: <1481725372-22010-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As console=ttymxc0 is passed in U-Boot we can use /dev/console to
access the serial console and then BR2_TARGET_GENERIC_GETTY_PORT
can be removed.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/mx6sx_udoo_neo_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index cbea577..aecb520 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -2,7 +2,6 @@ BR2_arm=y
 BR2_cortex_a9=y
 # Linux headers same as kernel, a 4.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/neo/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/neo/post-image.sh"
 BR2_GLOBAL_PATCH_DIR="board/udoo/neo/patches"
-- 
2.7.4
