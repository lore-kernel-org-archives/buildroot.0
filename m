From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 11 Oct 2016 20:54:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/wpa_supplicant: enable interface
	matching option
In-Reply-To: <20161011185451.1644-1-joerg.krause@embedded.rocks>
References: <20161011185451.1644-1-joerg.krause@embedded.rocks>
Message-ID: <20161011185451.1644-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new wpa_supplicant command line argument -M can be used to describe
matching rules with a wildcard interface name (e.g., "wlan*").

This is very useful for systems without udev.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
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
-- 
2.10.0
