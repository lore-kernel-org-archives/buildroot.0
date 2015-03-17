From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 17 Mar 2015 22:41:09 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/wpa_supplicant: Enable support
	for log to debug file
Message-ID: <1426628469-3535-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable the '-f' option (log output to debug file instead of stdout). Force
enable it, binary size +963 bytes for an ARM target.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v1 -> v2:
  - force enable it (suggested by Gustavo Zacarias)
---
 package/wpa_supplicant/wpa_supplicant.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 3ab8e05..5a81a91 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -23,7 +23,8 @@ WPA_SUPPLICANT_CONFIG_ENABLE = \
 	CONFIG_IEEE80211AC	\
 	CONFIG_IEEE80211N	\
 	CONFIG_IEEE80211R	\
-	CONFIG_INTERNAL_LIBTOMMATH
+	CONFIG_INTERNAL_LIBTOMMATH \
+	CONFIG_DEBUG_FILE
 
 WPA_SUPPLICANT_CONFIG_DISABLE = \
 	CONFIG_SMARTCARD
-- 
2.3.3
