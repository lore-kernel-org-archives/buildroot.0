From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jul 2018 11:43:13 +0200
Subject: [Buildroot] [git commit] imx-gpu-viv: add a missing backslash
Message-ID: <20180720093831.587A38918A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06a5d193edb859929ac37154ef1320b7907b31b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add semicolon and || exit 1 to catch failures]
Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 511e3b3b6c..d2a9fad459 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -79,7 +79,7 @@ endif
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	for lib in egl gbm glesv1_cm glesv2 vg; do \
-		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc
+		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc || exit 1; \
 	done
 endef
 endif
