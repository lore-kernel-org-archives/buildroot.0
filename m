From: arved at arved.at <arved@arved.at>
Date: Thu, 28 Mar 2013 16:41:26 +0100
Subject: [Buildroot] [PATCH 1/1] Fix the syslogd initscript pidfile handling
	- Fix name to pidfile - Enable CONFIG_FEATURE_PIDFILE
Message-ID: <1364485286-24497-1-git-send-email-arved@arved.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tilman Keskin?z <arved@arved.at>


Signed-off-by: Tilman Keskin?z <arved@arved.at>
---
 package/busybox/S01logging            |    4 ++--
 package/busybox/busybox-1.20.x.config |    2 +-
 package/busybox/busybox-1.21.x.config |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index edece39..37a2c11 100644
--- a/package/busybox/S01logging
+++ b/package/busybox/S01logging
@@ -6,13 +6,13 @@
 case "$1" in
   start)
 	echo -n "Starting logging: "
-	start-stop-daemon -S -q -p /var/run/syslog.pid --exec /sbin/syslogd -- -m 0
+	start-stop-daemon -S -q -p /var/run/syslogd.pid --exec /sbin/syslogd -- -m 0
 	start-stop-daemon -S -q -p /var/run/klogd.pid --exec /sbin/klogd
 	echo "OK"
 	;;
   stop)
 	echo -n "Stopping logging: "
-	start-stop-daemon -K -q -p /var/run/syslog.pid
+	start-stop-daemon -K -q -p /var/run/syslogd.pid
 	start-stop-daemon -K -q -p /var/run/klogd.pid
 	echo "OK"
 	;;
diff --git a/package/busybox/busybox-1.20.x.config b/package/busybox/busybox-1.20.x.config
index 5525434..d199996 100644
--- a/package/busybox/busybox-1.20.x.config
+++ b/package/busybox/busybox-1.20.x.config
@@ -41,7 +41,7 @@ CONFIG_FEATURE_DEVPTS=y
 CONFIG_FEATURE_CLEAN_UP=y
 CONFIG_FEATURE_UTMP=y
 CONFIG_FEATURE_WTMP=y
-# CONFIG_FEATURE_PIDFILE is not set
+CONFIG_FEATURE_PIDFILE=y
 CONFIG_FEATURE_SUID=y
 # CONFIG_FEATURE_SUID_CONFIG is not set
 # CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
diff --git a/package/busybox/busybox-1.21.x.config b/package/busybox/busybox-1.21.x.config
index e46b528..67acdff 100644
--- a/package/busybox/busybox-1.21.x.config
+++ b/package/busybox/busybox-1.21.x.config
@@ -41,7 +41,7 @@ CONFIG_FEATURE_DEVPTS=y
 CONFIG_FEATURE_CLEAN_UP=y
 CONFIG_FEATURE_UTMP=y
 CONFIG_FEATURE_WTMP=y
-# CONFIG_FEATURE_PIDFILE is not set
+CONFIG_FEATURE_PIDFILE=Y
 CONFIG_PID_FILE_PATH=""
 CONFIG_FEATURE_SUID=y
 # CONFIG_FEATURE_SUID_CONFIG is not set
-- 
1.7.10.4
