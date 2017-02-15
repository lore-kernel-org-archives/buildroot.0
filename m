From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:28:48 +0100
Subject: [Buildroot] [git commit] board/udoo/neo: specify an offset for the
	rootfs partition
Message-ID: <20170215202915.268058197E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0692d7facb0f28686b5366ac40fce48cee1d91a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When manually writing SPL and u-boot.img to the SD card the rootfs
gets corrupted.

Fix this issue by passing a 1MB offset for the rootfs.

Reported-by: Breno Lima <breno.lima@nxp.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Tested-by: Breno Lima <breno.lima@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
