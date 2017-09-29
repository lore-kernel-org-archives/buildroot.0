From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Sep 2017 09:44:41 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] wandboard: genimage: Pass
	an offset for the rootfs
Message-ID: <20170929075623.80A1281153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=183c367ddcca626dbbae5a5f6cd0e856d47184ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Pass an offset of 1MB for the start of the rootfs.

Otherwise we get rootfs corruption when the bootloader is manually
written to the SD card.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 82c1445fc473cf422a1283283acfa46f0df6cd84)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/wandboard/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/wandboard/genimage.cfg b/board/wandboard/genimage.cfg
index b23a91b..ad4a6a5 100644
--- a/board/wandboard/genimage.cfg
+++ b/board/wandboard/genimage.cfg
@@ -26,6 +26,7 @@ image sdcard.img {
   partition rootfs {
     partition-type = 0x83
     image = "rootfs.ext4"
+    offset = 1M
     size = 512M
   }
 }
