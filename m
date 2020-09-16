From: Miken Valabdas <mvalabdas@distech-controls.com>
Date: Wed, 16 Sep 2020 16:35:25 -0400
Subject: [Buildroot] [PATCH] package/18xx-ti-utils: update makefile in order
 to compile wlconf
Message-ID: <20200916203525.5913-1-mvalabdas@distech-controls.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Miken Valabdas <mvalabdas@distech-controls.com>
---
Changes v1 -> v2:
  - adjust compilation parameters
---
 package/18xx-ti-utils/18xx-ti-utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index d1f0388c3a..afe07ba227 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -21,10 +21,15 @@ define 18XX_TI_UTILS_BUILD_CMDS
 		NFSROOT="$(STAGING_DIR)" NLVER=3 $(MAKE) -C $(@D) \
 		CFLAGS="$(TARGET_CFLAGS) $(18XX_TI_UTILS_CFLAGS)" \
 		$(18XX_TI_UTILS_BUILD_TARGET)
+
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/wlconf \
+		CC="$(HOSTCC)" \
+		CFLAGS="$(HOST_CFLAGS)" \
 endef
 
 define 18XX_TI_UTILS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/calibrator $(TARGET_DIR)/usr/bin/calibrator
+	$(INSTALL) -m 0755 $(@D)/wlconf/wlconf $(HOST_DIR)/bin/wlconf
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
