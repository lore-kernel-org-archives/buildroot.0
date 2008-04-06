From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  6 Apr 2008 06:33:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20080406133300.757EA3C445@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-06 06:32:59 -0700 (Sun, 06 Apr 2008)
New Revision: 21656

Log:
Make sure XML deps are available before building dbus

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2008-04-06 13:14:07 UTC (rev 21655)
+++ trunk/buildroot/package/dbus/dbus.mk	2008-04-06 13:32:59 UTC (rev 21656)
@@ -28,7 +28,7 @@
 	$(DBUS_CAT) $(DL_DIR)/$(DBUS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked
+$(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked $(DBUS_XML_DEP)
 	(cd $(DBUS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
