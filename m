From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Jan 2013 12:54:06 -0300
Subject: [Buildroot] [PATCH 2/2] wpa_supplicant: bump to version 2.0
In-Reply-To: <1358524446-9033-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358524446-9033-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358524446-9033-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wpa_supplicant/wpa_supplicant.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 02ca125..762ceaf 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-WPA_SUPPLICANT_VERSION = 1.1
+WPA_SUPPLICANT_VERSION = 2.0
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
 WPA_SUPPLICANT_LICENSE = GPLv2/BSD-3c
 WPA_SUPPLICANT_LICENSE_FILES = README
@@ -37,6 +37,7 @@ define WPA_SUPPLICANT_EAP_CONFIG
 	$(SED) 's/\(#\)\(CONFIG_EAP_SAKE.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_EAP_SIM.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_EAP_TNC.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_TLSV1.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 endef
 else
 define WPA_SUPPLICANT_EAP_CONFIG
@@ -117,8 +118,10 @@ endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_HS20.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_IEEE80211N.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_IEEE80211R.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_IEEE80211W.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_INTERWORKING.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_DELAYED_MIC.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 	$(SED) 's/\(CONFIG_DRIVER_ATMEL\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
-- 
1.7.12.4
