From: Florian La Roche <florian.laroche@googlemail.com>
Date: Thu, 22 Oct 2020 12:15:12 +0200
Subject: [Buildroot] [PATCH 1/1] grub-efi: align the rootfs to start at 16MB
 offset from start of the image
Message-ID: <20201022101512.56470-1-Florian.LaRoche@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For grub-efi we can align the rootfs to start at exactly 16MB from the
beginning of the disk. This can be done by reducing the vfat partition
to be 32 KB smaller than its 16MB size, just like the offset of the vfat
partition.

Signed-off-by: Florian La Roche <Florian.LaRoche@gmail.com>
---
 board/pc/genimage-efi.cfg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
index ea15ae5cfb..304e964f14 100644
--- a/board/pc/genimage-efi.cfg
+++ b/board/pc/genimage-efi.cfg
@@ -10,7 +10,7 @@ image efi-part.vfat {
       image = "bzImage"
     }
   }
-  size = 16777216
+  size = 16744448
 }
 
 image disk.img {
@@ -22,7 +22,7 @@ image disk.img {
     image = "efi-part.vfat"
     partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
     offset = 32768
-    size = 16777216
+    size = 16744448
     bootable = true
   }
 
@@ -30,6 +30,6 @@ image disk.img {
     partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
     partition-uuid = UUID_TMP
     image = "rootfs.ext2"
-    offset = 16809984
+    offset = 16777216
   }
 }
-- 
2.28.0
