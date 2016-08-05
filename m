From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Aug 2016 09:15:22 +0200
Subject: [Buildroot] [git commit] imx6ulpico: linux.fragment: Disable
	CONFIG_SMP
Message-ID: <20160805071803.7781A8182C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0b507d31ab335f115f1eb472c58611fda1f2a67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

imx6ul has currently an issue on kernel 4.7 that causes a stall when running
the "reboot" command.

This issue has been reported in the linux-arm-kernel mailing list, but we
don't have a proper fix at the moment.

This problem is not seen when SMP is disabled, so let's disable it for now
until a proper fix becomes available.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
