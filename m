From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 12:17:06 +0200
Subject: [Buildroot] [git commit] warpboard: linux.fragment: Do not use
	CONFIG_BRCMFMAC as built-in
Message-ID: <20160730101717.6A41C7F91D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=525c50ecb30cb2508c860ee86549d81349c28fa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Selecting the driver CONFIG_BRCMFMAC as built-in causes some probe issues
as we cannot guarantee that the brcmfmac driver will be probed after the
rootfs has been mounted. The brcmfmac driver retrieves the firmware and
nvram file from the rootfs, so the rootfs should be mounted first.

To avoid such issues let the CONFIG_BRCMFMAC be built as module, which is
the original option in imx_v6_v7_defconfig.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
