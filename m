From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 22:28:29 +0100
Subject: [Buildroot] [git commit] wpa_supplicant: bump to version 2.0
Message-ID: <20130120212854.4921E9A1B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a77caa0f944b3b23a492f88ab991c203d5d9acb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/wpa_supplicant.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

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
