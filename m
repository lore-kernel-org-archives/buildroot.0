From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 31 Dec 2014 23:50:54 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: fix indentation and change file
	permissions
Message-ID: <1420066254-5483-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 10b2c0a..682cb4c 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -82,18 +82,18 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
 	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS=
 define WPA_SUPPLICANT_INSTALL_DBUS_OLD
-	$(INSTALL) -D \
-	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service \
-	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service
+	$(INSTALL) -m 0644 -D \
+		$(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service \
+		$(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW),y)
 	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_NEW
 define WPA_SUPPLICANT_INSTALL_DBUS_NEW
-	$(INSTALL) -D \
-	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service \
-	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service
+	$(INSTALL) -m 0644 -D \
+		$(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service \
+		$(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service
 endef
 endif
 
@@ -115,10 +115,10 @@ endif
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
 	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
-	       $(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
-	       $(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
-	       $(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
-	       $(WPA_SUPPLICANT_CONFIG)
+		$(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
+		$(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
+		$(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
+		$(WPA_SUPPLICANT_CONFIG)
 endef
 
 # LIBS for wpa_supplicant, LIBS_c for wpa_cli, LIBS_p for wpa_passphrase
@@ -146,9 +146,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 define WPA_SUPPLICANT_INSTALL_DBUS
-	$(INSTALL) -D \
-	  $(@D)/wpa_supplicant/dbus/dbus-wpa_supplicant.conf \
-	  $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
+	$(INSTALL) -m 0644 -D \
+		$(@D)/wpa_supplicant/dbus/dbus-wpa_supplicant.conf \
+		$(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
 	$(WPA_SUPPLICANT_INSTALL_DBUS_OLD)
 	$(WPA_SUPPLICANT_INSTALL_DBUS_NEW)
 endef
-- 
1.8.3.2
