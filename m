From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Sep 2016 16:42:03 -0300
Subject: [Buildroot] [PATCH 1/4] wandboard: Use ext4 rootfs type
Message-ID: <1473622926-5476-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Use ext4 rootfs type instead of ext2, as it is more reliable.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/wandboard/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/wandboard/genimage.cfg b/board/wandboard/genimage.cfg
index f5df1ff..745cec3 100644
--- a/board/wandboard/genimage.cfg
+++ b/board/wandboard/genimage.cfg
@@ -2,7 +2,7 @@
 #
 # The SD card must have at least 1 MB free at the beginning.
 # U-Boot and its environment are dumped as is.
-# A single root filesystem partition is required (Ext2 in this case).
+# A single root filesystem partition is required (Ext4 in this case).
 #
 # For details about the layout, see:
 # http://wiki.wandboard.org/index.php/Boot-process
@@ -32,7 +32,7 @@ image sdcard.img {
 
   partition rootfs {
     partition-type = 0x83
-    image = "rootfs.ext2"
+    image = "rootfs.ext4"
     size = 512M
   }
 }
-- 
2.7.4
