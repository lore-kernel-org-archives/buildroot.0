From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 16:43:04 +0200
Subject: [Buildroot] [git commit master 1/1] libsvgtiny: pass
	TARGET_CONFIGURE_ENV / OPTS to each make invocation
Message-ID: <20100706144330.4DBF08257C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8251a6d2437edd9d4f6ca5d24e5c935fbe0ba06a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As it doesn't use a ./configure, we need to pass it each time.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsvgtiny/libsvgtiny.mk |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index ca0d2c9..7484764 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -21,27 +21,33 @@ $(DL_DIR)/$(LIBSVGTINY_SOURCE):
 LIBSVGTINY_TARGET_SOURCE := $(DL_DIR)/$(LIBSVGTINY_SOURCE)
 
 define LIBSVGTINY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr
+	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		 $(MAKE) -C $(@D) PREFIX=/usr
 endef
 
 define LIBSVGTINY_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) install
+	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBSVGTINY_UNINSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) uninstall
+	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) uninstall
 endef
 
 define LIBSVGTINY_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
+	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
 define LIBSVGTINY_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
+	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
 endef
 
 define BZIP2_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
+	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) clean
 endef
 
 $(eval $(call GENTARGETS,package,libsvgtiny))
-- 
1.7.1
