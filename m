From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 08:14:41 +0200
Subject: [Buildroot] [git commit] Fix colon location in S01logging script
Message-ID: <20110713062815.AE3488A593@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=72eb844be64567dadd7d619aa049fafbfa347736
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The S01logging script currently displays the start/stop messages like this:

Start logging :OK

The normal form for these messages is:

Start logging: OK

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/S01logging |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.7.3.4
