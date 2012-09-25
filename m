From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 25 Sep 2012 14:55:23 +0200
Subject: [Buildroot] [PATCH 2/4] wpa_supplicant: remove redundant escaping
	from sed commands
In-Reply-To: <1348577725-12647-1-git-send-email-s.neumann@raumfeld.com>
References: <1348577725-12647-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1348577725-12647-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/wpa_supplicant.mk |   44 +++++++++++++++---------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 207eec1..e8d55d3 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -28,15 +28,15 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
 define WPA_SUPPLICANT_EAP_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_EAP_AKA.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_FAST.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_GPSK.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_IKEV2.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_PAX.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_PSK.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_SAKE.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_SIM.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_TNC.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_EAP_AKA.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_EAP_FAST.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_EAP_GPSK.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_EAP_IKEV2.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_EAP_PAX.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_EAP_PSK.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_EAP_SAKE.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_EAP_SIM.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_EAP_TNC.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
 endef
 else
 define WPA_SUPPLICANT_EAP_CONFIG
@@ -52,30 +52,30 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
 define WPA_SUPPLICANT_WPS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_WPS.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_WPS.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
 define WPA_SUPPLICANT_LIBTOMMATH_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_INTERNAL_LIBTOMMATH.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_INTERNAL_LIBTOMMATH.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
 endef
 
 # Try to use openssl or gnutls if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
 define WPA_SUPPLICANT_TLS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_TLS=openssl\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_PWD.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_TLS=openssl\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_EAP_PWD.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
 endef
 else
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 	WPA_SUPPLICANT_DEPENDENCIES += gnutls
 define WPA_SUPPLICANT_TLS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2gnutls/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_TLS=\).*/\1gnutls/' $(WPA_SUPPLICANT_CONFIG)
 endef
 else
 define WPA_SUPPLICANT_TLS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2internal/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_TLS=\).*/\1internal/' $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 endif
@@ -88,7 +88,7 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
 define WPA_SUPPLICANT_DBUS_OLD_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_CTRL_IFACE_DBUS=\)/\1/' $(WPA_SUPPLICANT_CONFIG)
 endef
 define WPA_SUPPLICANT_INSTALL_DBUS_OLD
 	$(INSTALL) -D \
@@ -99,7 +99,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW),y)
 define WPA_SUPPLICANT_DBUS_NEW_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS_NEW=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_CTRL_IFACE_DBUS_NEW=\)/\1/' $(WPA_SUPPLICANT_CONFIG)
 endef
 define WPA_SUPPLICANT_INSTALL_DBUS_NEW
 	$(INSTALL) -D \
@@ -110,7 +110,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION),y)
 define WPA_SUPPLICANT_DBUS_INTROSPECTION_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS_INTRO=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_CTRL_IFACE_DBUS_INTRO=\)/\1/' $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
@@ -124,10 +124,10 @@ endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_IEEE80211N.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_IEEE80211R.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_INTERWORKING.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_DELAYED_MIC.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_IEEE80211N.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_IEEE80211R.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_INTERWORKING.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/#\(CONFIG_DELAYED_MIC.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
 	$(SED) 's/\(CONFIG_DRIVER_ATMEL\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
 	$(SED) 's/\(CONFIG_SMARTCARD\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
 	$(WPA_SUPPLICANT_LIBTOMMATH_CONFIG)
-- 
1.7.9.5
