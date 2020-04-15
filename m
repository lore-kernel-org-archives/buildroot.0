From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 15 Apr 2020 09:36:55 -0300
Subject: [Buildroot] [PATCH 1/2] imx/genimage: Specify the volume-label for
 vfat
Message-ID: <20200415123656.13298-1-festevam@gmail.com>
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
-- 
2.17.1
