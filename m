From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Fri, 29 Jul 2016 10:45:30 -0300
Subject: [Buildroot] [PATCH] warpboard: linux.fragment: Do not use
	CONFIG_BRCMFMAC as built-in
Message-ID: <1469799930-20206-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Selecting the driver CONFIG_BRCMFMAC as built-in causes some probe issues
as we cannot guarantee that the brcmfmac driver will be probed after the
rootfs has been mounted. The brcmfmac driver retrieves the firmware and
nvram file from the rootfs, so the rootfs should be mounted first.

To avoid such issues let the CONFIG_BRCMFMAC be built as module, which is
the original option in imx_v6_v7_defconfig.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/freescale/warpboard/linux.fragment | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/freescale/warpboard/linux.fragment b/board/freescale/warpboard/linux.fragment
index 736b9cd..892d0cb 100644
--- a/board/freescale/warpboard/linux.fragment
+++ b/board/freescale/warpboard/linux.fragment
@@ -1,2 +1 @@
 CONFIG_CFG80211_WEXT=y
-CONFIG_BRCMFMAC=y
-- 
1.9.1
