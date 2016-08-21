From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Sun, 21 Aug 2016 12:13:56 +0200
Subject: [Buildroot] [PATCH 1/1] added comments on how to install the system
Message-ID: <1471774436-18803-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sudo dd part was not that trivial to me, as I was expecting
the usual ramdisk image or a rootfs.tar file. I think
board/readme.txt should mention it.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 board/beaglebone/readme.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/board/beaglebone/readme.txt b/board/beaglebone/readme.txt
index 43ebe53..7d73e93 100644
--- a/board/beaglebone/readme.txt
+++ b/board/beaglebone/readme.txt
@@ -32,3 +32,14 @@ After building, you should get a tree like this:
   ??? u-boot.img
   ??? uEnv.txt
   ??? zImage
+
+Prepare SD card
+===============
+
+The first partition, /dev/sdb1 in this example, should be a bootable FAT16 partition.
+The second partition, /dev/sdb2 in this example, should be an EXT4 partition.
+
+sudo cp output/images/{MLO,u-boot.img,zImage} /dev/sdb1
+sudo cp output/images/am335x-bone.dtb /dev/sdb1 -- for the beaglebone
+sudo cp output/images/am335x-boneblack.dtb /dev/sdb1 -- for the beaglebone black
+sudo dd if=output/images/rootfs.ext4 of=/dev/sdb2
-- 
2.1.4
