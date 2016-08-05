From: Fabio Estevam <festevam@gmail.com>
Date: Fri,  5 Aug 2016 00:53:24 -0300
Subject: [Buildroot] [PATCH] imx6ulpico: linux.fragment: Disable CONFIG_SMP
Message-ID: <1470369204-1675-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

imx6ul has currently an issue on kernel 4.7 that causes a stall when running
the "reboot" command.

This issue has been reported in the linux-arm-kernel mailing list, but we
don't have a proper fix at the moment.

This problem is not seen when SMP is disabled, so let's disable it for now
until a proper fix becomes available.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/technexion/imx6ulpico/linux.fragment | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/technexion/imx6ulpico/linux.fragment b/board/technexion/imx6ulpico/linux.fragment
index 892d0cb..88e323e 100644
--- a/board/technexion/imx6ulpico/linux.fragment
+++ b/board/technexion/imx6ulpico/linux.fragment
@@ -1 +1,2 @@
 CONFIG_CFG80211_WEXT=y
+CONFIG_SMP=n
-- 
2.7.4
