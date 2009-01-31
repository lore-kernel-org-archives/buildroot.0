From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 31 Jan 2009 12:02:41 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20090131120242.19B9276219@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-31 12:02:40 +0000 (Sat, 31 Jan 2009)
New Revision: 25176

Log:
dbus dependencies needs to be ready before ./configure

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-01-31 10:18:23 UTC (rev 25175)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-01-31 12:02:40 UTC (rev 25176)
@@ -28,7 +28,7 @@
 	$(DBUS_CAT) $(DL_DIR)/$(DBUS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked
+$(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked $(DBUS_XML_DEP)
 	(cd $(DBUS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -113,3 +113,9 @@
 ifeq ($(BR2_PACKAGE_DBUS),y)
 TARGETS+=dbus
 endif
+
+dbus-status:
+	@echo	BR2_DBUS_EXPAT=$(BR2_DBUS_EXPAT)
+	@echo	DBUS_XML=$(DBUS_XML)
+	@echo	DBUS_XML_DEP=$(DBUS_XML_DEP)
+
