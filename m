From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:49:00 +0200
Subject: [Buildroot] [git commit] board/freescale: specify the volume-label
 for FAT partition
Message-ID: <20200415203641.56F318ED8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a52ab35dcea3672a8c24d19b3908c0f3709813ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the volume-label for the vfat partition is a string with
the following pattern: 5934-861D.

Specify the volume-label as "boot" to make it easier to identify it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Tested-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/genimage.cfg.template      | 1 +
 board/freescale/common/imx/genimage.cfg.template_imx8 | 1 +
 board/freescale/common/imx/genimage.cfg.template_spl  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/board/freescale/common/imx/genimage.cfg.template b/board/freescale/common/imx/genimage.cfg.template
index 2a7036a7df..61b09bde9f 100644
--- a/board/freescale/common/imx/genimage.cfg.template
+++ b/board/freescale/common/imx/genimage.cfg.template
@@ -9,6 +9,7 @@
 
 image boot.vfat {
   vfat {
+    label = "boot"
     files = {
       %FILES%
     }
diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
index bd5f6cdc73..84a812f986 100644
--- a/board/freescale/common/imx/genimage.cfg.template_imx8
+++ b/board/freescale/common/imx/genimage.cfg.template_imx8
@@ -9,6 +9,7 @@
 
 image boot.vfat {
   vfat {
+    label = "boot"
     files = {
       %FILES%
     }
diff --git a/board/freescale/common/imx/genimage.cfg.template_spl b/board/freescale/common/imx/genimage.cfg.template_spl
index d2d810777b..3b0667c383 100644
--- a/board/freescale/common/imx/genimage.cfg.template_spl
+++ b/board/freescale/common/imx/genimage.cfg.template_spl
@@ -9,6 +9,7 @@
 
 image boot.vfat {
   vfat {
+    label = "boot"
     files = {
       %FILES%
     }
