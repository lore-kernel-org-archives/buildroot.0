From: Miken Valabdas <mvalabdas@distech-controls.com>
Date: Wed, 16 Sep 2020 09:58:34 -0400
Subject: [Buildroot] [PATCH] package/18xx-ti-utils: update makefile in order
 to compile wlconf
Message-ID: <20200916135834.400-1-mvalabdas@distech-controls.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Miken Valabdas <mvalabdas@distech-controls.com>
---
 package/18xx-ti-utils/18xx-ti-utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index d1f0388c3a..41ce8ab973 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -21,6 +21,11 @@ define 18XX_TI_UTILS_BUILD_CMDS
 		NFSROOT="$(STAGING_DIR)" NLVER=3 $(MAKE) -C $(@D) \
 		CFLAGS="$(TARGET_CFLAGS) $(18XX_TI_UTILS_CFLAGS)" \
 		$(18XX_TI_UTILS_BUILD_TARGET)
+
+	$(TARGET_MAKE_ENV) CROSS_COMPILE=$(TARGET_CROSS) \
+		NFSROOT="$(STAGING_DIR)" NLVER=3 $(MAKE) -C $(@D)/wlconf \
+		CFLAGS="$(TARGET_CFLAGS) $(18XX_TI_UTILS_CFLAGS)" \
+		$(18XX_TI_UTILS_BUILD_TARGET)
 endef
 
 define 18XX_TI_UTILS_INSTALL_TARGET_CMDS
-- 
2.17.1
