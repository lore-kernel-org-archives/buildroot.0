From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 20 Mar 2009 07:47:29 +0000 (UTC)
Subject: [Buildroot] svn commit: [25767] trunk/buildroot/package/dbus
Message-ID: <20090320074729.E0E317643D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-20 07:47:29 +0000 (Fri, 20 Mar 2009)
New Revision: 25767

Log:
dbus: put local state files in /var and not /usr/var

For read only rootfs'es - Like it used to be.

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-03-20 07:45:36 UTC (rev 25766)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-03-20 07:47:29 UTC (rev 25767)
@@ -29,6 +29,7 @@
 		--disable-doxygen-docs \
 		--disable-static \
 		--enable-dnotify \
+		--localstatedir=/var \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid
 
