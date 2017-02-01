From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 22:12:50 +0100
Subject: [Buildroot] [git commit] dbus: remove init script status op
Message-ID: <20170201211301.A965081EC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b4848d6b94dc722fd6cdd6b512bdfe9efaf014a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The status command calls the Upstart status utility which we don't have.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/S30dbus | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
index 4427b5c..b4bcf9c 100644
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
