From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:50 -0000
Subject: [Buildroot] [git commit] configs/raspberrypi3_64_defconfig: use
 pi3-miniuart-bt device tree overlay
Message-ID: <20191202083931.8795A813A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e747d33bd9d319481a67a376c97e5100dd93f62a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the pi3-miniuart-bt device tree overlay (as the 32bit raspberrypi3
defconfig) instead of the enable_uart option.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/post-image.sh   | 9 ---------
 configs/raspberrypi3_64_defconfig | 3 +--
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index bf9af5dc60..bbeb0bc721 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -28,15 +28,6 @@ __EOF__
 
 # enable 64bits support
 arm_64bit=1
-__EOF__
-		fi
-
-		# Enable uart console
-		if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
-
-# enable rpi3 ttyS0 serial console
-enable_uart=1
 __EOF__
 		fi
 		;;
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index f9a6f5fe1f..27141f364e 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -22,7 +22,6 @@ BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
-# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -36,4 +35,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --add-pi3-miniuart-bt-overlay"
