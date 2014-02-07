From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri,  7 Feb 2014 11:48:32 -0600
Subject: [Buildroot] [PATCH 1/1] defconfigs: zedboard add info about uboot
	installation
Message-ID: <1391795312-19282-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add info about how to install a custom uboot on the zedboard.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 board/avnet/zedboard/readme.txt |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
index b869066..6b6df36 100644
--- a/board/avnet/zedboard/readme.txt
+++ b/board/avnet/zedboard/readme.txt
@@ -11,3 +11,18 @@ to the sdcard:
 	rootfs.cpio.gz.uboot -> uramdisk.image.gz
 	uImage -> uImage
 
+Uboot Support
+-------------
+
+Uboot is installed in a wrapper file called BOOT.BIN located on the root of
+the SD card.  To create the BOOT.BIN file do the following.
+
+source <path/to/xilinx/settings.sh>
+cat <<EOF > boot.bif
+{
+   [bootloader]<path/to/fsbl.elf>
+   <path/to/system.bit>
+   <path/to/uboot.elf>
+}
+EOF
+bootgen -image boot.bif -o i BOOT.BIN
-- 
1.7.1
