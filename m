From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Dec 2016 15:56:58 +0100
Subject: [Buildroot] [git commit] configs/mx6sx_udoo_neo: Remove
	BR2_TARGET_GENERIC_GETTY_PORT
Message-ID: <20161214150003.596D5802B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95b8bbcae6e90a48c263e68d0c3384d8f091952b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As console=ttymxc0 is passed in U-Boot we can use /dev/console to
access the serial console and then BR2_TARGET_GENERIC_GETTY_PORT
can be removed.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
