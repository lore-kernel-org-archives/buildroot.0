From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Aug 2011 14:12:06 +0200
Subject: [Buildroot] [git commit] ti-utils: bump version and clean up
Message-ID: <20110809121257.C994F8B828@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=efd5ca7b262f67c5343267eb3c13b517568f8126
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fixup whitespace, simplify target install]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ti-utils/ti-utils.mk |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 8f35b59..037e0c9 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -4,26 +4,28 @@
 #
 #############################################################
 
-TI_UTILS_VERSION = fbceab8f228cff80fd29b830bb85a188c69def08
+TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
 TI_UTILS_SITE = git://github.com/gxk/ti-utils.git
 TI_UTILS_DEPENDENCIES = libnl
 
 define TI_UTILS_BUILD_CMDS
-	$(MAKE1) NFSROOT="$(STAGING_DIR)" CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+	$(MAKE1) NFSROOT="$(STAGING_DIR)" \
+		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		-C $(@D) all
 endef
 
 define TI_UTILS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/calibrator \
+	$(INSTALL) -m 0755 -D $(@D)/calibrator \
 		$(TARGET_DIR)/usr/bin/calibrator
-	$(INSTALL) -m 0755 $(@D)/scripts/go.sh \
-		$(TARGET_DIR)/usr/bin/go.sh
+	$(INSTALL) -m 0755 -D $(@D)/scripts/go.sh \
+		$(TARGET_DIR)/usr/share/ti-utils/scripts/go.sh
+
+	cp -r $(@D)/ini_files $(TARGET_DIR)/usr/share/ti-utils
 endef
 
 define TI_UTILS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/calibrator
-	rm -f $(TARGET_DIR)/usr/bin/go.sh
+	rm -fr $(TARGET_DIR)/usr/share/ti-utils
 endef
 
 $(eval $(call GENTARGETS,package,ti-utils))
-
-- 
1.7.3.4
