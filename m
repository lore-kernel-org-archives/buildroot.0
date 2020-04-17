From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 23:15:21 +0200
Subject: [Buildroot] [git commit] board/freescale/mxs: specify the
 volume-label for vfat
Message-ID: <20200417210109.93AA48F05D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d91492b3716573a85a6cb8b84656f82754ce5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the volume-label for the vfat partition is a string with
the following pattern: 5934-861D.

Specify the volume-label as "boot" to make it easier to identify it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
