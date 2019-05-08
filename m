From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed,  8 May 2019 20:02:10 +0200
Subject: [Buildroot] [PATCH 1/1]
 board/lemaker/bananapro/linux-wifi.fragment: add rfkill driver into kernel
 by default
Message-ID: <20190508180210.10521-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes following error:

	# wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
	Successfully initialized wpa_supplicant
	rfkill: Cannot open RFKILL control device

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 board/lemaker/bananapro/linux-wifi.fragment | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/lemaker/bananapro/linux-wifi.fragment b/board/lemaker/bananapro/linux-wifi.fragment
index 8e4bd5cc7d..f4ede39faa 100644
--- a/board/lemaker/bananapro/linux-wifi.fragment
+++ b/board/lemaker/bananapro/linux-wifi.fragment
@@ -2,6 +2,7 @@
 CONFIG_WIRELESS=y
 CONFIG_CFG80211=y
 CONFIG_CFG80211_WEXT=y
+CONFIG_RFKILL=y
 
 # Network device support
 CONFIG_WLAN=y
-- 
2.21.0
