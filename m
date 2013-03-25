From: arved at arved.at <arved@arved.at>
Date: Mon, 25 Mar 2013 15:48:12 +0100
Subject: [Buildroot] [PATCH 3/4] Fix path to pidfile
In-Reply-To: <1364222893-23858-1-git-send-email-arved@arved.at>
References: <1364222893-23858-1-git-send-email-arved@arved.at>
Message-ID: <1364222893-23858-3-git-send-email-arved@arved.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tilman Keskin?z <arved@arved.at>


Signed-off-by: Tilman Keskin?z <arved@arved.at>
---
 package/busybox/S01logging |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.7.10.4
