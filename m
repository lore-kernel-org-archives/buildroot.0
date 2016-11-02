From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  2 Nov 2016 10:17:43 +0100
Subject: [Buildroot] [PATCH] board/boundarydevices: remove u-boot from
	genimage.cfg
Message-ID: <20161102091743.8494-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding a comment to explain how to update the bootloader since it is
located in NOR flash memory.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi,

Just realized that our genimage.cfg can be confusing since it copies
the u-boot binary although the BootROM will always boot from NOR.

Regards,
Gary
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
-- 
2.9.3
