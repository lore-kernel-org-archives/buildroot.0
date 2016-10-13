From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Oct 2016 07:30:40 -0300
Subject: [Buildroot] [PATCH] wpa_supplicant: AP mode now requires nl80211
Message-ID: <1476354640-18512-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/427/4275ea6e9f5a18d2ed42c93bdafbe6cbd50126a9/
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wpa_supplicant/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 85520b6..454541f 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -31,6 +31,7 @@ comment "nl80211 support needs a toolchain w/ threads"
 
 config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 	bool "Enable AP mode"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT_NL80211
 	help
 	  With this option enabled, wpa_supplicant can act as an
 	  access point much like hostapd does with a limited feature set.
-- 
2.7.3
