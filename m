From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:06:13 +0100
Subject: [Buildroot] [git commit] configs: pandaboard: use mdev for
	automatic module loading
Message-ID: <20160315220711.AB57280429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2624bdaae261b313d720fc7c6dd830678c16b415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The omap2plus kernel defconfig builds most drivers as modules, so we need
(automatic) module loading to be able to use usb/display/..

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/pandaboard_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 3223d2b..3a6e383 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -3,6 +3,7 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pandaboard/post-image.sh"
 BR2_LINUX_KERNEL=y
