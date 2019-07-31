From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 00:21:34 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/imx-uuc: fix
 static build with musl
Message-ID: <20190731221858.34A318172C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1852fb195e4f8949a5254c7e0f95d42f17bfd25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Use TARGET_CONFIGURE_OPTS to pass -static in LDFLAGS when building
statically

Fixes:
 - http://autobuild.buildroot.org/results/12c08173f83315fb68fe3c3d34a78ed919ba5a79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit df781e31ca9d695fd6cdf95b2078f608e8fd70d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-uuc/imx-uuc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
index 52d2b7c7a3..e94648b832 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.mk
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -14,7 +14,7 @@ IMX_UUC_LICENSE_FILES = COPYING
 IMX_UUC_DEPENDENCIES = host-dosfstools
 
 define IMX_UUC_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC=$(TARGET_CC)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
 
 define IMX_UUC_INSTALL_TARGET_CMDS
