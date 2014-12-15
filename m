From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Dec 2014 19:56:27 -0300
Subject: [Buildroot] [PATCH 2/2] stunnel: adjust initscript
In-Reply-To: <1418684187-12402-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418684187-12402-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1418684187-12402-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use proper status messages, make spacing standard instead of a mix of
spacing/tabbing, drop boringly obvious comment from the header.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/stunnel/S50stunnel | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

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
-- 
2.0.4
