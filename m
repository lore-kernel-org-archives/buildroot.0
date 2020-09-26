From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 26 Sep 2020 17:02:52 +0300
Subject: [Buildroot] [PATCH] odruidc2: remove rootfs size limit
Message-ID: <20200926140252.10714-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

as resizing the fs using paritions manager can result with a non booting
image due to the firmware's location, removal of the size limit for the rootfs
allows better match size-wise.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
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
--
2.28.0
