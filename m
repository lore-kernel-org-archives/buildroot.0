From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 18 Aug 2017 16:15:52 +0200
Subject: [Buildroot] [PATCH] board/boundarydevices: add mac parameter for
	BD-SDMAC in bootscript
Message-ID: <20170818141552.1749-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our new WiFi 802.11ac BT4.1 module (BD-SDMAC [1]) driver allows to
override the wlan MAC address using a module parameter.

Since its driver is now included in our external repository [2], update
the bootscript so it sets the parameter for that driver too.

As a FYI, $wlmac is based on Ethernet MAC address located in fuses.

[1] https://boundarydevices.com/product/bd_sdmac_wifi/
[2] https://github.com/boundarydevices/buildroot-external-boundary

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/boundarydevices/common/6x_bootscript.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/boundarydevices/common/6x_bootscript.txt b/board/boundarydevices/common/6x_bootscript.txt
index 2fc687aff4..af5822a88b 100644
--- a/board/boundarydevices/common/6x_bootscript.txt
+++ b/board/boundarydevices/common/6x_bootscript.txt
@@ -106,6 +106,7 @@ fi
 
 if itest.s "x" != "x${wlmac}" ; then
 	setenv bootargs ${bootargs} wlcore.mac=${wlmac}
+	setenv bootargs ${bootargs} wlan.mac=${wlmac}
 fi
 
 if itest.s "x" != "x${gpumem}" ; then
-- 
2.14.1
