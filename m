From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 22:59:44 +0100
Subject: [Buildroot] [git commit] package/wpa_supplicant: Enable support for
	log to debug file
Message-ID: <20150317220034.C75BD80438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b969918b989cd2d4e2b98d1e4733702f12edef45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the '-f' option (log output to debug file instead of stdout). Force
enable it, binary size +963 bytes for an ARM target.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
