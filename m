From: Eric Limpens <limpens@gmail.com>
Date: Wed,  1 Oct 2014 21:55:02 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: use select instead of epoll
Message-ID: <1412193302-5794-1-git-send-email-limpens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed with Gustavo on the mailing-list, remove EPOLL flag.
wpa_supplicant isn't able to answer DBUS message as events are
never delivered.

Signed-off-by: Eric Limpens <limpens@gmail.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 0ca2ce5..f825d86 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -20,7 +20,6 @@ WPA_SUPPLICANT_CONFIG_EDITS =
 WPA_SUPPLICANT_CONFIG_SET =
 
 WPA_SUPPLICANT_CONFIG_ENABLE = \
-	CONFIG_ELOOP_EPOLL	\
 	CONFIG_IEEE80211AC	\
 	CONFIG_IEEE80211N	\
 	CONFIG_IEEE80211R	\
-- 
1.9.1
