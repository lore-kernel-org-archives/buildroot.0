From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 27 Apr 2011 10:28:31 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: add support for libnl-2.0
Message-ID: <4DB7D3AF.2050000@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/package/wpa_supplicant/wpa_supplicant.mk
===================================================================
--- a/package/wpa_supplicant/wpa_supplicant.mk	2011-04-27 00:51:55.918285531 -0700
+++ b/package/wpa_supplicant/wpa_supplicant.mk	2011-04-27 00:53:16.210285541 -0700
@@ -16,6 +16,7 @@
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
 define WPA_SUPPLICANT_LIBNL_CONFIG
 	$(SED) "s/^#CONFIG_DRIVER_NL80211/CONFIG_DRIVER_NL80211/" $(WPA_SUPPLICANT_CONFIG)
+	echo "CONFIG_LIBNL20=y" >>$(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
