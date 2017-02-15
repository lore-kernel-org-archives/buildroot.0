From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 15 Feb 2017 10:27:36 -0200
Subject: [Buildroot] [PATCH] udoo/neo: Pass the rootfs offset
Message-ID: <1487161656-15772-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When manually writing SPL and u-boot.img to the SD card the rootfs
gets corrupted.

Fix this issue by passing a 1MB offset for the rootfs.

Reported-by: Breno Lima <breno.lima@nxp.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/udoo/neo/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/udoo/neo/genimage.cfg b/board/udoo/neo/genimage.cfg
index 1f7edf4..4620912 100644
--- a/board/udoo/neo/genimage.cfg
+++ b/board/udoo/neo/genimage.cfg
@@ -26,6 +26,7 @@ image sdcard.img {
   partition rootfs {
     partition-type = 0x83
     image = "rootfs.ext4"
+    offset = 1M
     size = 512M
   }
 }
-- 
2.7.4
