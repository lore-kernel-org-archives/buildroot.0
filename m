From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Aug 2017 15:18:32 +0200
Subject: [Buildroot] [git commit] board/boundarydevices: add mac parameter
	for BD-SDMAC in bootscript
Message-ID: <20170819131224.6FC3080F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d257a25c9ccc41fcc4d1096732187cab16dfdb85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our new WiFi 802.11ac BT4.1 module (BD-SDMAC [1]) driver allows to
override the wlan MAC address using a module parameter.

Since its driver is now included in our external repository [2], update
the bootscript so it sets the parameter for that driver too.

As a FYI, $wlmac is based on Ethernet MAC address located in fuses.

[1] https://boundarydevices.com/product/bd_sdmac_wifi/
[2] https://github.com/boundarydevices/buildroot-external-boundary

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/boundarydevices/common/6x_bootscript.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/boundarydevices/common/6x_bootscript.txt b/board/boundarydevices/common/6x_bootscript.txt
index 2fc687a..af5822a 100644
--- a/board/boundarydevices/common/6x_bootscript.txt
+++ b/board/boundarydevices/common/6x_bootscript.txt
@@ -106,6 +106,7 @@ fi
 
 if itest.s "x" != "x${wlmac}" ; then
 	setenv bootargs ${bootargs} wlcore.mac=${wlmac}
+	setenv bootargs ${bootargs} wlan.mac=${wlmac}
 fi
 
 if itest.s "x" != "x${gpumem}" ; then
