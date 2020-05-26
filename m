From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 23:15:17 +0200
Subject: [Buildroot] [git commit] board/freescale: increase the vfat size
Message-ID: <20200526210102.2232C91D16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d804aba66fbed7df6cf0caa845b6c52f7ff1f7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default iamge size is 32MiB, which is quite low by today's standards.
Besides, the AArch64 kernels are relatively big, which leaves not much
room, if at all, for users to experiment on the default image.

Increase the vfat size to a more reasonable 64MiB.

Note that users who derive an in-tree defconfig for their own case will
allways hit any arbitarary size we put here, so they will anyway have to
also derive this template for their own use-cases.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
