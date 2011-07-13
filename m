From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 12 Jul 2011 17:45:22 -0700
Subject: [Buildroot] [PATCH] Fix colon location in S01logging script
Message-ID: <201107121745.23113.hartleys@visionengravers.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The S01logging script currently displays the start/stop messages like this:

Start logging :OK

The normal form for these messages is:

Start logging: OK

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index 6badebe..581f192 100644
--- a/package/busybox/S01logging
+++ b/package/busybox/S01logging
@@ -5,13 +5,13 @@
 
 case "$1" in
   start)
-	echo -n "Starting logging :"
+	echo -n "Starting logging: "
 	start-stop-daemon -S -q -p /var/run/syslog.pid --exec /sbin/syslogd -- -m 0
 	start-stop-daemon -S -q -p /var/run/klogd.pid --exec /sbin/klogd
 	echo "OK"
 	;;
   stop)
-	echo -n "Stopping logging :"
+	echo -n "Stopping logging: "
 	start-stop-daemon -K -q -p /var/run/syslog.pid
 	start-stop-daemon -K -q -p /var/run/klogd.pid
 	echo "OK"
