From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 26 May 2020 18:01:19 -0300
Subject: [Buildroot] [PATCH] board/freescale: increase the vfat size
Message-ID: <20200526210119.6143-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i.MX8 targets typically use the standard ARM64 defconfig, which builds
lots of ARM64 platforms leading to super large kernels that can easily
not fit within the current 32MB size for vfat.

Increase the vfat size to better accomodate such large kernels.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/common/imx/genimage.cfg.template_imx8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
index 84a812f986..5689205083 100644
--- a/board/freescale/common/imx/genimage.cfg.template_imx8
+++ b/board/freescale/common/imx/genimage.cfg.template_imx8
@@ -14,7 +14,7 @@ image boot.vfat {
       %FILES%
     }
   }
-  size = 32M
+  size = 64M
 }
 
 image sdcard.img {
-- 
2.17.1
