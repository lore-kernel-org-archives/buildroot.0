From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Dec 2014 00:45:44 +0100
Subject: [Buildroot] [git commit] stunnel: adjust initscript
Message-ID: <20141215234642.5E349803BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d98be88165d5d8d428d102552b1f70e76ecbdab7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use proper status messages, make spacing standard instead of a mix of
spacing/tabbing, drop boringly obvious comment from the header.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/S50stunnel |   37 ++++++++++++++++++-------------------
 1 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/package/stunnel/S50stunnel b/package/stunnel/S50stunnel
index 95bb301..5827fe0 100644
--- a/package/stunnel/S50stunnel
+++ b/package/stunnel/S50stunnel
@@ -1,36 +1,35 @@
 #!/bin/sh
-#
-# Starts stunnel
-#
 
 start() {
-	echo -n "Starting stunnel: "
-	start-stop-daemon -S -q -p /var/run/stunnel.pid --exec /usr/bin/stunnel
-	echo "OK"
+  echo -n "Starting stunnel: "
+  start-stop-daemon -S -q -p /var/run/stunnel.pid --exec /usr/bin/stunnel
+  [ $? = 0 ] && echo "OK" || echo "FAIL"
 }
+
 stop() {
-	echo -n "Stopping stunnel: "
-	start-stop-daemon -K -q -p /var/run/stunnel.pid
-	echo "OK"
+  echo -n "Stopping stunnel: "
+  start-stop-daemon -K -q -p /var/run/stunnel.pid
+  [ $? = 0 ] && echo "OK" || echo "FAIL"
 }
+
 restart() {
-	stop
-	start
+  stop
+  start
 }
 
 case "$1" in
   start)
-	start
-	;;
+    start
+    ;;
   stop)
-	stop
-	;;
+    stop
+    ;;
   restart|reload)
-	restart
-	;;
+    restart
+    ;;
   *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
+    echo "Usage: $0 {start|stop|restart}"
+    exit 1
 esac
 
 exit $?
