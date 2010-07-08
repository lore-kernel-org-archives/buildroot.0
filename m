From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] libsvgtiny: remove
	TARGET_CONFIGURE_ENV
Message-ID: <20100708115827.134638269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b569356d7e14dd78068309f1863272f6db09223
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TARGET_CONFIG_ENV got removed in e721a7c07 (Merge TARGET_CONFIGURE_ENV
into TARGET_CONFIGURE_OPTS), so remove it from the recent libsvgtiny
package as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsvgtiny/libsvgtiny.mk |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index 5e53346..ed73195 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -21,33 +21,31 @@ $(DL_DIR)/$(LIBSVGTINY_SOURCE):
 LIBSVGTINY_TARGET_SOURCE := $(DL_DIR)/$(LIBSVGTINY_SOURCE)
 
 define LIBSVGTINY_BUILD_CMDS
-	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
-		 $(MAKE) -C $(@D) PREFIX=/usr
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr
 endef
 
 define LIBSVGTINY_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBSVGTINY_UNINSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) uninstall
 endef
 
 define LIBSVGTINY_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
 define LIBSVGTINY_UNINSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
 endef
 
 define LIBSVGTINY_CLEAN_CMDS
-	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) clean
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) clean
 endef
 
 $(eval $(call GENTARGETS,package,libsvgtiny))
-- 
1.7.1
