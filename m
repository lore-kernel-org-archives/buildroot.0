From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2020 22:06:30 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] board/freescale: increase
 the vfat size
Message-ID: <20200601201603.3306786010@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94bb56719db58d0ec64f5f4cdeef6e43372086ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The default iamge size is 32MiB, which is quite low by today's standards.
Besides, the AArch64 kernels are relatively big, which leaves not much
room, if at all, for users to experiment on the default image.

Increase the vfat size to a more reasonable 64MiB.

Note that users who derive an in-tree defconfig for their own case will
allways hit any arbitarary size we put here, so they will anyway have to
also derive this template for their own use-cases.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d804aba66fbed7df6cf0caa845b6c52f7ff1f7e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/common/imx/genimage.cfg.template_imx8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
index bd5f6cdc73..75f182be66 100644
--- a/board/freescale/common/imx/genimage.cfg.template_imx8
+++ b/board/freescale/common/imx/genimage.cfg.template_imx8
@@ -13,7 +13,7 @@ image boot.vfat {
       %FILES%
     }
   }
-  size = 32M
+  size = 64M
 }
 
 image sdcard.img {
