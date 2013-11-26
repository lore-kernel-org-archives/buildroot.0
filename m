From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Nov 2013 12:42:37 +0100
Subject: [Buildroot] [git commit] mongoose: wait some time between stop and
	start of the service
Message-ID: <20131126114423.C62CF9BD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be1cf3bad4317508f8268556943b4449863697fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Startup script fails to restart the service: 1s delay is enough to fix
this.

Also apply a minor fix of the script name in the usage string

Signed-off-by: Davide Viti <d.viti@infosolution.it>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/S85mongoose |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/S85mongoose b/package/mongoose/S85mongoose
index ff7da05..dc042d0 100755
--- a/package/mongoose/S85mongoose
+++ b/package/mongoose/S85mongoose
@@ -28,12 +28,12 @@ case "$1" in
   restart|force-reload)
 	echo -n "Restarting $DESC: "
 	start-stop-daemon -K -x "$DAEMON"
+	sleep 1
 	start-stop-daemon -S -x "$DAEMON" -b -- $OPTIONS
 	echo "$NAME."
 	;;
   *)
-	N=/etc/init.d/$NAME
-	echo "Usage: $N {start|stop|restart|force-reload}" >&2
+	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
 	exit 1
 	;;
 esac
