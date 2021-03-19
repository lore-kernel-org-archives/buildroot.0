From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 19 Mar 2021 15:59:07 +0100
Subject: [Buildroot] [PATCH] configs/beaglebone_qt5: add overlay to defconfig
Message-ID: <20210319145907.464593-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit 8efc5dce98f9795d97b7a3452f9be4a774032379 added an overlay but
forgot to add it to the related defconfig.

Fixes: missing overlay data in image

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 configs/beaglebone_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 6e0371a7d3..5f084b77df 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -5,6 +5,7 @@ BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_OVERLAY="board/beaglebone/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
-- 
2.25.1
