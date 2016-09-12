From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 11:35:37 +0200
Subject: [Buildroot] [git commit] wandboard: Make explicit that a ext4
	rootfs is used
Message-ID: <20160912093544.22E2481F02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9af33ec869bafd250e58c86c13c370894508184a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make explicit that a ext4 rootfs is used.

As explained by Thomas Petazzoni:

"the ext4 filesystem is already used.
Indeed, the ext4 image is a symlink to the ext2 image, and the ext2
image is in fact an ext4 image:

-rw-r--r-- 1 thomas thomas 3763200 sept. 11 21:54 rootfs.ext2
lrwxrwxrwx 1 thomas thomas      11 sept. 11 21:54 rootfs.ext4 -> rootfs.ext2"

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/wandboard/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/wandboard/genimage.cfg b/board/wandboard/genimage.cfg
index 32c7c16..b23a91b 100644
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
@@ -25,7 +25,7 @@ image sdcard.img {
 
   partition rootfs {
     partition-type = 0x83
-    image = "rootfs.ext2"
+    image = "rootfs.ext4"
     size = 512M
   }
 }
