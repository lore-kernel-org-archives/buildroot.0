From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri,  3 Jan 2020 00:37:51 +0000
Subject: [Buildroot] [PATCH 1/2] board/raspberrypi/post-image.sh: support
 older defconfigs
Message-ID: <20200103003752.140-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ada40afb324 fixed pi3-minuart-bt being changed to miniuart-bt.  Older
defconfig files based on raspberrypi*_defconfigs might have to old call,
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
Allow either argument to add the correct miniuart-bt overlay.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 board/raspberrypi/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 9dbd98ef9b..e9246fa113 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -10,7 +10,7 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 for arg in "$@"
 do
 	case "${arg}" in
-		--add-miniuart-bt-overlay)
+		--add-miniuart-bt-overlay|--add-pi3-miniuart-bt-overlay)
 		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
 			echo "Adding 'dtoverlay=miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
 			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
-- 
2.18.1
