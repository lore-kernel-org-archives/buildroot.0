From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 19 Aug 2014 21:20:47 -0400
Subject: [Buildroot] [PATCH 2/2] tvheadend: fix undefined variable in error
	print
In-Reply-To: <1408497647-2258-1-git-send-email-danomimanchego123@gmail.com>
References: <1408497647-2258-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1408497647-2258-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variable "$SCRIPTNAME" is undefined; replace with "$0".

Also, fix "Stopping" spelling.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/tvheadend/S99tvheadend |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/S99tvheadend b/package/tvheadend/S99tvheadend
index c29e32d..75b66f3 100644
--- a/package/tvheadend/S99tvheadend
+++ b/package/tvheadend/S99tvheadend
@@ -31,7 +31,7 @@ case "$1" in
         fi
         ;;
     stop)
-        printf "Stoping TVHeadend daemon: "
+        printf "Stopping TVHeadend daemon: "
         start-stop-daemon -K -q -p ${PIDFILE} -s TERM
         sleep 2
         if start-stop-daemon -K -q -p ${PIDFILE} -t; then
@@ -46,7 +46,7 @@ case "$1" in
         "${0}" start
         ;;
     *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        echo "Usage: $0 {start|stop|restart|force-reload}" >&2
         exit 1
         ;;
 esac
-- 
1.7.9.5
