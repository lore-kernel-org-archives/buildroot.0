From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Jun 2014 10:19:24 +0300
Subject: [Buildroot] [PATCH v2] wpa_supplicant: disable for avr32
Message-ID: <98b8462a6b76b2b2e5ece86affe4f75a607abeff.1402816764.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/209/20908f479b33c1e2952622f5e8ad6b60d58af693/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
   Move 'depend on' above 'help' (Thomas Petazzoni)
---
 package/wpa_supplicant/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 5cb3f1b..81c61ac 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
+	depends on !BR2_avr32 # no epoll_create1
 	help
 	  WPA supplicant for secure wireless networks
 
-- 
2.0.0
