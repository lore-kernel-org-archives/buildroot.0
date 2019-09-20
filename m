From: Thuan Ho <sandwichdoge@gmail.com>
Date: Fri, 20 Sep 2019 22:05:08 +0700
Subject: [Buildroot] [PATCH 1/1] package/connman: fix legacy wpa_supplicant
 dbus select
Message-ID: <20190920150508.9731-1-sandwichdoge@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: sandwichdoge <sandwichdoge@gmail.com>

Remove '_NEW' from 'select BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW' in Config.in.

Wpa_supplicant dbus support option has been renamed from 'BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW' to
'BR2_PACKAGE_WPA_SUPPLICANT_DBUS' in v2.9 bump (f2ffdbee2aca0ca2bde469475c180d60cb934beb).
While Connman package, which depends on wpa_supplicant, has not been updated.

This patch will fix legacy build error.

Signed-off-by: sandwichdoge <sandwichdoge@gmail.com>
Signed-off-by: Thuan Ho <sandwichdoge@gmail.com>
---
 package/connman/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 5177c939a4..30eae23c96 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -25,7 +25,7 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
 config BR2_PACKAGE_CONNMAN_WIFI
 	bool "enable WiFi support"
 	select BR2_PACKAGE_WPA_SUPPLICANT # runtime
-	select BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW # runtime
+	select BR2_PACKAGE_WPA_SUPPLICANT_DBUS # runtime
 	help
 	  Enable WiFi support (scan and static/dhcp interface
 	  setup). ConnMan detects the start of wpa_supplicant
-- 
2.11.0
