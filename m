From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 08 Aug 2011 09:10:29 +0200
Subject: [Buildroot] [PATCH] ti-utils: bump version and clean up
Message-ID: <4E3F8BE5.1030607@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ti-utils/ti-utils.mk |   54 +++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 14 deletions(-)

Index: b/package/ti-utils/ti-utils.mk
===================================================================
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -4,26 +4,52 @@
 #
 #############################################################
 
-TI_UTILS_VERSION = fbceab8f228cff80fd29b830bb85a188c69def08
+TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
 TI_UTILS_SITE = git://github.com/gxk/ti-utils.git
 TI_UTILS_DEPENDENCIES = libnl
-
+
 define TI_UTILS_BUILD_CMDS
-	$(MAKE1) NFSROOT="$(STAGING_DIR)" CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-		-C $(@D) all
+ 	$(MAKE1) NFSROOT="$(STAGING_DIR)"	\
+ 	CC="$(TARGET_CC) $(TARGET_CFLAGS)	\
+ 	$(TARGET_LDFLAGS)" -C $(@D) all
 endef
-
+
 define TI_UTILS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/calibrator \
-		$(TARGET_DIR)/usr/bin/calibrator
-	$(INSTALL) -m 0755 $(@D)/scripts/go.sh \
-		$(TARGET_DIR)/usr/bin/go.sh
+ 	mkdir -p $(TARGET_DIR)/usr/share/ti-utils/
+ 	mkdir -p $(TARGET_DIR)/usr/share/ti-utils/scripts
+ 	mkdir -p $(TARGET_DIR)/usr/share/ti-utils/ini_files
+ 	mkdir -p $(TARGET_DIR)/usr/share/ti-utils/ini_files/127x
+ 	mkdir -p $(TARGET_DIR)/usr/share/ti-utils/ini_files/128x
+
+ 	$(INSTALL) -m 0755 $(@D)/calibrator					\
+ 		$(TARGET_DIR)/usr/bin/calibrator
+ 	$(INSTALL) -m 0755 $(@D)/scripts/go.sh					\
+		$(TARGET_DIR)/usr/share/ti-utils/scripts/go.sh
+
+ 	$(INSTALL) -m 0644 $(@D)/ini_files/127x/RFMD_S_3.5.ini			\
+ 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/127x/RFMD_S_3.5.ini
+ 	$(INSTALL) -m 0644 $(@D)/ini_files/127x/TQS_D_1.0.ini			\
+ 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/127x/TQS_D_1.0.ini
+ 	$(INSTALL) -m 0644 $(@D)/ini_files/127x/TQS_D_1.7.ini			\
+ 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/127x/TQS_D_1.7.ini
+ 	$(INSTALL) -m 0644 $(@D)/ini_files/127x/TQS_S_2.5.ini			\
+ 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/127x/TQS_S_2.5.ini
+ 	$(INSTALL) -m 0644 $(@D)/ini_files/127x/TQS_S_2.6.ini			\
+ 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/127x/TQS_S_2.6.ini
+
+ 	$(INSTALL) -m 0644 $(@D)/ini_files/128x/RFMD_S_3.5.ini			\
+ 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/128x/RFMD_S_3.5.ini
+ 	$(INSTALL) -m 0644 $(@D)/ini_files/128x/TQS_D_1.0.ini			\
+ 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/128x/TQS_D_1.0.ini
+ 	$(INSTALL) -m 0644 $(@D)/ini_files/128x/TQS_D_1.7.ini			\
+ 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/128x/TQS_D_1.7.ini
+ 	$(INSTALL) -m 0644 $(@D)/ini_files/128x/TQS_S_2.6.ini			\
+ 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/128x/TQS_S_2.6.ini
 endef
-
+
 define TI_UTILS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/calibrator
-	rm -f $(TARGET_DIR)/usr/bin/go.sh
+ 	rm -f $(TARGET_DIR)/usr/bin/calibrator
+ 	rm -fr $(TARGET_DIR)/usr/share/ti-utils
 endef
-
+
 $(eval $(call GENTARGETS,package,ti-utils))
-
