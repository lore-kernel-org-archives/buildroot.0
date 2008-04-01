From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Apr 2008 07:50:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/thttpd
Message-ID: <20080401145041.6239D3C52B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-01 07:50:40 -0700 (Tue, 01 Apr 2008)
New Revision: 21611

Log:
thttpd: remove unused files

Patch by Simon Pasch


Removed:
   trunk/buildroot/package/thttpd/S90thttpd
   trunk/buildroot/package/thttpd/thttpd.conf


Changeset:
Deleted: trunk/buildroot/package/thttpd/S90thttpd
===================================================================
--- trunk/buildroot/package/thttpd/S90thttpd	2008-04-01 14:47:57 UTC (rev 21610)
+++ trunk/buildroot/package/thttpd/S90thttpd	2008-04-01 14:50:40 UTC (rev 21611)
@@ -1,43 +0,0 @@
-#!/bin/sh 
-
-DAEMON=/usr/sbin/thttpd
-test -f $DAEMON || exit 0
-
-start() {
-	echo -n "Starting thttpd: "
-	$DAEMON -C /etc/thttpd.conf
-	if [ $? != 0 ]; then
-		echo "FAILED"
-		exit 1
-	else
-		echo "done"
-	fi
-}
-
-stop() {
-	echo -n "Stopping ProFTPD: "
-	kill -9 `cat /var/run/thttpd.pid`
-        echo "done"
-}
-
-case "$1" in
-    start)
-	start
-	;;
-
-    stop)
-	stop
-	;;
-
-    restart)
-    	stop
-    	start
-	;;
-
-    *)
-	echo "Usage: /etc/init.d/S90thttpd {start|stop|restart}"
-	exit 1
-	;;
-esac
-
-exit 0

Deleted: trunk/buildroot/package/thttpd/thttpd.conf
===================================================================
--- trunk/buildroot/package/thttpd/thttpd.conf	2008-04-01 14:47:57 UTC (rev 21610)
+++ trunk/buildroot/package/thttpd/thttpd.conf	2008-04-01 14:50:40 UTC (rev 21611)
@@ -1,7 +0,0 @@
-chroot
-dir=/var/www
-pidfile=/var/run/thttpd.pid
-logfile=/var/log/thttpd
-host=dtu-7100
-user=nobody
-cgipat=**.cgi
