From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:25:15 +0100
Subject: [Buildroot] [git commit] board/boundarydevices: remove u-boot from
	genimage.cfg
Message-ID: <20161102162525.1559B7FC0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dac9e45b5fa1faa1bbdab9a89c48c9f24d45aa45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding a comment to explain how to update the bootloader since it is
located in NOR flash memory.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/boundarydevices/common/genimage.cfg | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/board/boundarydevices/common/genimage.cfg b/board/boundarydevices/common/genimage.cfg
index 7a5e71e..a383fb7 100644
--- a/board/boundarydevices/common/genimage.cfg
+++ b/board/boundarydevices/common/genimage.cfg
@@ -1,13 +1,15 @@
+# Minimal SD card image for Boundary Devices platforms
+#
+# It does not need a boot section for a bootloader since it is booted
+# from its NOR flash memory.
+#
+# To update the bootloader, execute the following from U-Boot prompt:
+# => run upgradeu
+
 image sdcard.img {
 	hdimage {
 	}
 
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.imx"
-		offset = 1024
-	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
