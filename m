From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 23:36:15 +0200
Subject: [Buildroot] [git commit] warpboard: README: Improve instructions
	about using wifi
Message-ID: <20160801082747.B696B81F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc8472fb8ab08ed24d03f42cac62a209d87f30a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provide a more complete set of instructions on how to get Wifi
working on the warpboard.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
