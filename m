From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jul 2018 23:30:50 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] imx-gpu-viv: add a
 missing backslash
Message-ID: <20180720213251.76FDD8A295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58df053dda650f0a4b58ea8fac1b5e5a81eeeedf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

[Peter: add semicolon and || exit 1 to catch failures]
Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 06a5d193edb859929ac37154ef1320b7907b31b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index a9f8b9d9bd..9104750c3c 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -65,7 +65,7 @@ endif
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	for lib in egl gbm glesv1_cm glesv2 vg; do \
-		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc
+		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc || exit 1; \
 	done
 endef
 endif
