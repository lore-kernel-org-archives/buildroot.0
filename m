From: John Keeping <john@metanate.com>
Date: Wed, 14 Jul 2021 15:51:32 +0100
Subject: [Buildroot] [PATCH] board/raspberrypi: use kernel Bluetooth mode
Message-ID: <20210714145132.533559-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default setting with miniuart-bt requires hciattach which is a
deprecated utility in BlueZ.  Setting the krnbt parameter switches to
the modern method of using serdev in the kernel removing the need for
any userspace configuration to enable the Bluetooth controller.

This is documented as applying to all Raspberry Pi variants so just
enable it globally.

Signed-off-by: John Keeping <john@metanate.com>
---
 board/raspberrypi/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 9dbd98ef9b..a6728c686e 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -16,7 +16,7 @@ do
 			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
 
 # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
-dtoverlay=miniuart-bt
+dtoverlay=miniuart-bt,krnbt=on
 __EOF__
 		fi
 		;;
-- 
2.32.0
