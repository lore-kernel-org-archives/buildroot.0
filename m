From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 17 Apr 2020 15:24:15 -0300
Subject: [Buildroot] [PATCH] board/freescale/mxs: specify the volume-label
 for vfat
Message-ID: <20200417182415.13512-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the volume-label for the vfat partition is a string with
the following pattern: 5934-861D.

Specify the volume-label as "boot" to make it easier to identify it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/common/mxs/genimage.cfg.template | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/freescale/common/mxs/genimage.cfg.template b/board/freescale/common/mxs/genimage.cfg.template
index e094fb7f2c..c9da452821 100644
--- a/board/freescale/common/mxs/genimage.cfg.template
+++ b/board/freescale/common/mxs/genimage.cfg.template
@@ -8,6 +8,7 @@
 
 image boot.vfat {
 	vfat {
+		label = "boot"
 		files = {
 			%FILES%
 		}
-- 
2.17.1
