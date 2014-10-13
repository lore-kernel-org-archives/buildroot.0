From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 13 Oct 2014 09:47:34 +0200
Subject: [Buildroot] [PATCH] connman: select dbus support in wpa_supplicant
Message-ID: <1413186454-1171-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... else connman cannot communicate with wpa_supplicant

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/connman/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index a42de17..8803aeb 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
 config BR2_PACKAGE_CONNMAN_WIFI
 	bool "enable WiFi support"
 	select BR2_PACKAGE_WPA_SUPPLICANT # runtime
+	select BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW # runtime
 	help
 	  Enable WiFi support (scan and static/dhcp interface
 	  setup). ConnMan detects the start of wpa_supplicant
-- 
1.9.1
