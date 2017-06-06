From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Jun 2017 23:27:46 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] imx-uuc: fix
	start-stop-daemon stop failure
Message-ID: <20170606212751.39B80827D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=097f9d17c1eb2fe4fbba5e94fad75f82a2f4bfcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The daemon service script associated with imx-uuc failed to stop the daemon
since the PID of the process wasn't stored at start time.

Adding -m option allowed to create the uuc.pid file as expected.

Signed-off-by: Alexandre Esse <alexandre.esse.dev@gmail.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 41e86cd5cad853d7778231be8ce7c6fdb87e3da4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-uuc/S80imx-uuc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-uuc/S80imx-uuc b/package/freescale-imx/imx-uuc/S80imx-uuc
index 8a02f88..9a92c98 100644
--- a/package/freescale-imx/imx-uuc/S80imx-uuc
+++ b/package/freescale-imx/imx-uuc/S80imx-uuc
@@ -6,7 +6,7 @@ DAEMON=/usr/bin/$NAME
 case "$1" in
     start)
 	printf "Starting $NAME: "
-	start-stop-daemon -S -q -b -p /var/run/${NAME}.pid -x $DAEMON
+	start-stop-daemon -S -q -b -m -p /var/run/${NAME}.pid -x $DAEMON
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
     stop)
