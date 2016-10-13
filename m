From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 21:45:45 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: AP mode now requires
	nl80211
Message-ID: <20161013194736.3594C802F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c4f400007316127c9f5a4a7b843fac65c36a04d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/427/4275ea6e9f5a18d2ed42c93bdafbe6cbd50126a9/
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
