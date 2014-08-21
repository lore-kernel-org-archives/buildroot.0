From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:23:02 +0200
Subject: [Buildroot] [git commit] tvheadend: fix undefined variable in error
	print
Message-ID: <20140821132318.0D3889D4CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54007178336031fabe0033b5eb8303a8fe3b42bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The variable "$SCRIPTNAME" is undefined; replace with "$0".

Also, fix "Stopping" spelling.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/S99tvheadend |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
