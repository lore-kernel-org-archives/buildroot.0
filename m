From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Jun 2018 18:36:28 +0200
Subject: [Buildroot] [PATCH 1/1] apache: add reload target to sysv init
 script
Message-ID: <20180622163628.2519-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apache/S50apache | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/apache/S50apache b/package/apache/S50apache
index 623a7eef3b..b687419055 100644
--- a/package/apache/S50apache
+++ b/package/apache/S50apache
@@ -4,8 +4,11 @@ case "$1" in
   start|restart|graceful|graceful-stop|stop)
 	apachectl -k $1
 	;;
+  reload)
+	apachectl -k restart
+	;;
   *)
-	echo "Usage: $0 {start|restart|graceful|graceful-stop|stop}"
+	echo "Usage: $0 {start|restart|reload|graceful|graceful-stop|stop}"
 	exit 1
 esac
 
-- 
2.14.1
