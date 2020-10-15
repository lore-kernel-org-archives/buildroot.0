From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:12:31 +0200
Subject: [Buildroot] [git commit] board/hardkernel/odruidc2: remove rootfs
 size limit
Message-ID: <20201015210139.1370783466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5e29353b5fedc3cbd1070ce50b7ace6f533bda1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As resizing the rootfs partition using a partition manager can result
in a non booting image due to the firmware's location, removal of the
size limit for the rootfs allows better match size-wise.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/hardkernel/odroidc2/genimage.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
index c9306b0639..f49c1deaf3 100644
--- a/board/hardkernel/odroidc2/genimage.cfg
+++ b/board/hardkernel/odroidc2/genimage.cfg
@@ -34,6 +34,5 @@ image sdcard.img {
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-		size = 512M
 	}
 }
