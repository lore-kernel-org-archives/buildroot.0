From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Mar 2009 11:44:57 +0000 (UTC)
Subject: [Buildroot] svn commit: [25758] trunk/buildroot/package/dbus
Message-ID: <20090319114457.34F9C7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-19 11:44:56 +0000 (Thu, 19 Mar 2009)
New Revision: 25758

Log:
dbus: fix host build

Hunk missing from r25755.

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-03-19 11:41:05 UTC (rev 25757)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-03-19 11:44:56 UTC (rev 25758)
@@ -64,7 +64,7 @@
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(DBUS_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(STAMP_DIR)/host_dbus_configured: $(DBUS_HOST_DIR)/.unpacked $(STAMP_DIR)/host_expat_installed $(STAMP_DIR)/host_pkgconfig_installed
+$(STAMP_DIR)/host_dbus_configured: $(STAMP_DIR)/host_dbus_unpacked $(STAMP_DIR)/host_expat_installed $(STAMP_DIR)/host_pkgconfig_installed
 	(cd $(DBUS_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
