From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  3 Jul 2016 18:46:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/nfs-utils: Fix indent
In-Reply-To: <1467564419-21313-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467564419-21313-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467564419-21313-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use tabs everywhere still we don't have an official policy.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/nfs-utils/S60nfs | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 2d4e082..893b1e4 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -17,7 +17,7 @@ CFG_FILE=/etc/default/nfsd
 
 NR_THREADS=2
 if [ -f "${CFG_FILE}" ]; then
-    . "${CFG_FILE}"
+	. "${CFG_FILE}"
 fi
 
 
@@ -66,23 +66,23 @@ stop() {
 
 # See how we were called.
 case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart)
-	stop
-	start
-	;;
-  reload)
-	/usr/sbin/exportfs -r
-	touch /var/lock/subsys/nfs
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		stop
+		start
+		;;
+	reload)
+		/usr/sbin/exportfs -r
+		touch /var/lock/subsys/nfs
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
 
 exit 0
-- 
2.8.1
