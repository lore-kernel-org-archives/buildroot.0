From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:53:50 +0200
Subject: [Buildroot] [git commit] board/raspberrypi: use kernel Bluetooth
 mode
Message-ID: <20210720191950.7B33C8857A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=5352a7710250e96ff99c11830af697101de3839e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default setting with miniuart-bt requires hciattach which is a
deprecated utility in BlueZ.  Setting the krnbt parameter switches to
the modern method of using serdev in the kernel removing the need for
any userspace configuration to enable the Bluetooth controller.

This is documented as applying to all Raspberry Pi variants so just
enable it globally.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
