From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 16:03:41 +0200
Subject: [Buildroot] [git commit] package/connman: fix legacy wpa_supplicant
 dbus select
Message-ID: <20190921140156.945B08EE41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8ffb58c6f31da06c072fee9db42439a2feaaa6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove '_NEW' from 'select BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW' in
Config.in.

Wpa_supplicant dbus support option has been renamed from
BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW to BR2_PACKAGE_WPA_SUPPLICANT_DBUS
in the bump to v2.9 (f2ffdbee2aca0ca2bde469475c180d60cb934beb).
While connman package, which depends on wpa_supplicant, has not been
updated.

This patch will fix legacy build error.

Signed-off-by: Thuan Ho <sandwichdoge@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
