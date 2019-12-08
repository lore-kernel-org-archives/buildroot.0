From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 21:13:51 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi: change deprecated
 pi3-miniuart-bt option to miniuart-bt
Message-ID: <20191208204240.73B3988DC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ada40afb3244a81fe221d82c849cf0eb32af9d08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pi3-minuart-bt Device Tree overlay has been renamed to
miniuart-bt, as it is useful/usable for other platforms than the
RPi3. So we use this DT overlay and rename the
--add-pi3-miniuart-bt-overlay option to --add-miniuart-bt-overlay
accordingly.

Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/post-image.sh      | 8 ++++----
 board/raspberrypi/readme.txt         | 2 +-
 configs/raspberrypi3_64_defconfig    | 2 +-
 configs/raspberrypi3_defconfig       | 2 +-
 configs/raspberrypi3_qt5we_defconfig | 2 +-
 configs/raspberrypi4_defconfig       | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index bbeb0bc721..9dbd98ef9b 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -10,13 +10,13 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 for arg in "$@"
 do
 	case "${arg}" in
-		--add-pi3-miniuart-bt-overlay)
+		--add-miniuart-bt-overlay)
 		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-			echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
+			echo "Adding 'dtoverlay=miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
 			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
 
-# fixes rpi3 ttyAMA0 serial console
-dtoverlay=pi3-miniuart-bt
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
 __EOF__
 		fi
 		;;
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 69c9f9b20a..8b3de6d251 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -78,7 +78,7 @@ After building, you should obtain this tree:
 [1] Not all of them will be present, depending on the RaspberryPi
     model you are using.
 
-[2] Only for the Raspberry Pi 3/4 Models (overlay pi3-miniuart-bt is needed
+[2] Only for the Raspberry Pi 3/4 Models (overlay miniuart-bt is needed
     to enable the RPi3 serial console otherwise occupied by the bluetooth
     chip). Alternative would be to disable the serial console in cmdline.txt
     and /etc/inittab.
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 27141f364e..b9a070fb82 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -35,4 +35,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --add-pi3-miniuart-bt-overlay"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 01aa239805..530eb0ab3f 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -34,4 +34,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 775eb9114e..21c5d1dc4c 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -48,4 +48,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="360M"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay --gpu_mem_1024=200"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --gpu_mem_1024=200"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 6eea0ca816..a216463e28 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -35,4 +35,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
