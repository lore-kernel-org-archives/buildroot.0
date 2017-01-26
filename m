From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jan 2017 07:36:06 +0200
Subject: [Buildroot] [PATCH 2/4] board: raspberrypi: don't generate a marked
	kernel
In-Reply-To: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
References: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
Message-ID: <5d2c97394f64bc671c4183567db7169e3ff50804.1485408968.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer use the marked kernel.

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 board/raspberrypi/post-image.sh | 5 -----
 board/raspberrypi/readme.txt    | 7 ++-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index c00975288c6f..b2bb07067835 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -18,11 +18,6 @@ __EOF__
 	;;
 esac
 
-# Mark the kernel as DT-enabled
-mkdir -p "${BINARIES_DIR}/kernel-marked"
-${HOST_DIR}/usr/bin/mkknlimg "${BINARIES_DIR}/zImage" \
-	"${BINARIES_DIR}/kernel-marked/zImage"
-
 rm -rf "${GENIMAGE_TMP}"
 
 genimage                           \
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 03178ff95fa4..b6adca5151f6 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -53,7 +53,6 @@ After building, you should obtain this tree:
     +-- bcm2709-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-3-b.dtb         [1]
     +-- boot.vfat
-    +-- kernel-marked/zImage        [2]
     +-- rootfs.ext4
     +-- rpi-firmware/
     |   +-- bootcode.bin
@@ -61,16 +60,14 @@ After building, you should obtain this tree:
     |   +-- config.txt
     |   +-- fixup.dat
     |   +-- start.elf
-    |   `-- overlays/               [3]
+    |   `-- overlays/               [2]
     +-- sdcard.img
     `-- zImage
 
 [1] Not all of them will be present, depending on the RaspberryPi
     model you are using.
 
-[2] This is the mkknlimg DT-marked kernel.
-
-[3] Only for the Raspberry Pi 3 Model (overlay pi3-miniuart-bt is needed
+[2] Only for the Raspberry Pi 3 Model (overlay pi3-miniuart-bt is needed
     to enable the RPi3 serial console otherwise occupied by the bluetooth
     chip). Alternative would be to disable the serial console in cmdline.txt
     and /etc/inittab.
-- 
2.11.0
