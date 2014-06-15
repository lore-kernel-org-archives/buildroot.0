From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Jun 2014 09:48:32 +0300
Subject: [Buildroot] [PATCH 1/2] wpa_supplicant: disable for avr32
Message-ID: <8a8b1c998ef9cf581c4e0b442da6f3e18e3c57bb.1402814913.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/209/20908f479b33c1e2952622f5e8ad6b60d58af693/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wpa_supplicant/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 5cb3f1b..1fb7008 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
 	help
+	depends on !BR2_avr32 # no epoll_create1
 	  WPA supplicant for secure wireless networks
 
 	  http://hostap.epitest.fi/wpa_supplicant/
-- 
2.0.0
