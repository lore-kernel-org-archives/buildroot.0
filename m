From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 14:11:22 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] configs/beaglebone_qt5:
 add overlay to defconfig
Message-ID: <20210324133906.B9703873DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecbec131680d685ffaefae8b6c56af0c4a6ede90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

commit 8efc5dce98f9795d97b7a3452f9be4a774032379 added an overlay but
forgot to add it to the related defconfig.

Fixes: missing overlay data in image

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d08bb7491ad8966a743ae965793a6043794c9dbf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
