From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Sep 2014 10:15:25 +0200
Subject: [Buildroot] [git commit] nitrogen6x_defconfig: bump linux kernel
Message-ID: <20140924081603.4971E9C041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b8937f238a3593c9267a68e0fdad83841a56657
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To the latest commit on the 3.10 branch. Also lock the kernel headers to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nitrogen6x_defconfig |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 245d3d8..e56bd60 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -11,6 +11,11 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_2r1=y
 
+# Lock headers to match kernel
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
@@ -21,7 +26,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/efd65e6/linux-imx6-efd65e6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/898627a/linux-imx6-898627a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
