From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Jul 2019 15:55:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/imx-uuc: fix static build with musl
Message-ID: <20190707135533.15376-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use TARGET_CONFIGURE_OPTS to pass -static in LDFLAGS when building
statically

Fixes:
 - http://autobuild.buildroot.org/results/12c08173f83315fb68fe3c3d34a78ed919ba5a79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
