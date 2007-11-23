From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Nov 2007 05:21:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20071123132116.C2D9F3008B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-23 05:21:15 -0800 (Fri, 23 Nov 2007)
New Revision: 20498

Log:
Generate uuid at startup if needed

Modified:
   trunk/buildroot/package/dbus/S97messagebus


Changeset:
Modified: trunk/buildroot/package/dbus/S97messagebus
===================================================================
--- trunk/buildroot/package/dbus/S97messagebus	2007-11-23 13:11:42 UTC (rev 20497)
+++ trunk/buildroot/package/dbus/S97messagebus	2007-11-23 13:21:15 UTC (rev 20498)
@@ -22,6 +22,7 @@
 start() {
     echo -n "Starting system message bus: "
 
+    dbus-uuidgen --ensure
     dbus-daemon --system
     RETVAL=$?
     echo "done"
