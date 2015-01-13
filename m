From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 20:16:59 -0300
Subject: [Buildroot] [PATCH 4/7] rsyslog: clean up sysv initscript
In-Reply-To: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421191022-5509-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix indentation, remove redundant comment, print real start/stop status.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsyslog/S01logging | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/package/rsyslog/S01logging b/package/rsyslog/S01logging
index 0c4bbc7..97d519a 100644
--- a/package/rsyslog/S01logging
+++ b/package/rsyslog/S01logging
@@ -1,38 +1,37 @@
 #!/bin/sh
-#
-# Starts rsyslog.
-#
 
 start() {
-	echo -n "Starting rsyslog daemon: "
-	umask 077
-	start-stop-daemon -S -q -p /var/run/rsyslogd.pid --exec /usr/sbin/rsyslogd
-	echo "OK"
+  echo -n "Starting rsyslog daemon: "
+  umask 077
+  start-stop-daemon -S -q -p /var/run/rsyslogd.pid --exec /usr/sbin/rsyslogd
+  [ $? = 0 ] && echo "OK" || echo "FAIL"
 }
+
 stop() {
-	echo -n "Stopping rsyslog daemon: "
-	start-stop-daemon -K -q -p /var/run/rsyslogd.pid
-	echo "OK"
+  echo -n "Stopping rsyslog daemon: "
+  start-stop-daemon -K -q -p /var/run/rsyslogd.pid
+  [ $? = 0 ] && echo "OK" || echo "FAIL"
 }
+
 restart() {
-	stop
-	start
+  stop
+  sleep 1
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
-
-- 
2.0.5
