From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 26 Sep 2017 23:52:15 +0200
Subject: [Buildroot] [git commit] wandboard: genimage: Pass an offset for
	the rootfs
Message-ID: <20170926215334.5EEA3807DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82c1445fc473cf422a1283283acfa46f0df6cd84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass an offset of 1MB for the start of the rootfs.

Otherwise we get rootfs corruption when the bootloader is manually
written to the SD card.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
