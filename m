From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2016 13:59:16 +0200
Subject: [Buildroot] [git commit] package/wpa_supplicant: enable interface
	matching option
Message-ID: <20161012115936.C4FE4819CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cad565d42421b675d1d3a6621aef36c8ef956d79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new wpa_supplicant command line argument -M can be used to describe
matching rules with a wildcard interface name (e.g., "wlan*").

This is very useful for systems without udev.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index e3e6f3a..3c3317b 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -28,7 +28,8 @@ WPA_SUPPLICANT_CONFIG_ENABLE = \
 	CONFIG_IEEE80211N	\
 	CONFIG_IEEE80211R	\
 	CONFIG_INTERNAL_LIBTOMMATH \
-	CONFIG_DEBUG_FILE
+	CONFIG_DEBUG_FILE \
+	CONFIG_MATCH_IFACE
 
 WPA_SUPPLICANT_CONFIG_DISABLE = \
 	CONFIG_SMARTCARD
