From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 30 Jul 2016 15:36:33 -0300
Subject: [Buildroot] [PATCH] warpboard: README: Improve instructions about
	using wifi
Message-ID: <1469903793-5987-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Provide a more complete set of instructions on how to get Wifi
working on the warpboard.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/freescale/warpboard/README | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
index 871d5cd..d900c6d 100644
--- a/board/freescale/warpboard/README
+++ b/board/freescale/warpboard/README
@@ -66,4 +66,14 @@ $ hciconfig hci0 up
 Using Wifi
 ==========
 
-$ ifconfig wlan0 up
+Enable the wireless_utils and wpa_suplicant packages, and then run:
+
+# modprobe brcmfmac
+# iwconfig wlan0 essid ACCESSPOINTNAME
+# wpa_passphrase ACCESSPOINTNAME > /etc/wpa.conf
+(enter the wifi password and press enter)
+# wpa_supplicant -Dwext -iwlan0 -c /etc/wpa.conf &
+# udhcpc -i wlan0
+# ping buildroot.org
+
+Enjoy!
-- 
1.9.1
