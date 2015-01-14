From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:26:43 +0100
Subject: [Buildroot] [git commit] rsyslog: clean up sysv initscript
Message-ID: <20150114192851.3A7C280DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ffa7389af80bd99e5930c0cf2556f47dcb0793a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix indentation, remove redundant comment, print real start/stop status.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/S01logging |   41 ++++++++++++++++++++---------------------
 1 files changed, 20 insertions(+), 21 deletions(-)

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
