From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 31 Mar 2013 20:56:50 +0200
Subject: [Buildroot] [git commit] Fix path to pidfile
Message-ID: <20130331195240.3B70E9B3EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b22957a2c8cb79024f811618f4d09f191d88a6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Tilman Keskin??z <arved@arved.at>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/S01logging |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
