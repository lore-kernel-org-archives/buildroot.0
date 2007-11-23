From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Nov 2007 02:00:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20071123100008.2E8793006A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-23 02:00:07 -0800 (Fri, 23 Nov 2007)
New Revision: 20491

Log:
Use BR2_HAVE_MANPAGES

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-11-23 09:46:42 UTC (rev 20490)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-11-23 10:00:07 UTC (rev 20491)
@@ -74,7 +74,9 @@
 	$(MAKE) DESTDIR=$(TARGET_DIR) initddir=/etc/init.d -C $(DBUS_DIR)/bus install
 	$(INSTALL) -m 0755 package/dbus/S97messagebus $(TARGET_DIR)/etc/init.d
 	rm -f $(TARGET_DIR)/etc/init.d/messagebus
+ifneq ($(BR2_HAVE_MANPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/man
+endif
 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	rm -rf $(TARGET_DIR)/etc/rc.d
 
