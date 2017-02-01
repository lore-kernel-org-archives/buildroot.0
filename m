From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  1 Feb 2017 16:34:49 +0200
Subject: [Buildroot] [PATCH] dbus: remove init script status op
Message-ID: <e13ba7be4cd326b90b0c71cc25b44718f18d8980.1485959689.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no status() shell routine in this script.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dbus/S30dbus | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
index 4427b5c72c0a..b4bcf9c7aa9a 100644
--- a/package/dbus/S30dbus
+++ b/package/dbus/S30dbus
@@ -53,10 +53,6 @@ case "$1" in
     stop)
         stop
         ;;
-    status)
-        status $processname
-        RETVAL=$?
-        ;;
     restart)
         stop
         start
@@ -72,7 +68,7 @@ case "$1" in
         RETVAL=$?
         ;;
     *)
-        echo "Usage: $0 {start|stop|status|restart|condrestart|reload}"
+        echo "Usage: $0 {start|stop|restart|condrestart|reload}"
         ;;
 esac
 exit $RETVAL
-- 
2.11.0
