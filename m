From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 23 Apr 2009 11:44:58 +0000 (UTC)
Subject: [Buildroot] svn commit: [26193] trunk/buildroot/package/dbus-glib
Message-ID: <20090423114458.80D0A76454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-23 11:44:58 +0000 (Thu, 23 Apr 2009)
New Revision: 26193

Log:
dbus-glib: host compilation needs libglib2 and expat

Modified:
   trunk/buildroot/package/dbus-glib/dbus-glib.mk


Changeset:
Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-04-23 11:44:54 UTC (rev 26192)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-04-23 11:44:58 UTC (rev 26193)
@@ -40,7 +40,7 @@
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(DBUS_GLIB_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(STAMP_DIR)/host_dbusglib_configured: $(STAMP_DIR)/host_dbusglib_unpacked $(STAMP_DIR)/host_dbus_installed
+$(STAMP_DIR)/host_dbusglib_configured: $(STAMP_DIR)/host_dbusglib_unpacked $(STAMP_DIR)/host_dbus_installed $(STAMP_DIR)/host_expat_installed $(STAMP_DIR)/host_libglib2_installed
 	(cd $(DBUS_GLIB_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
