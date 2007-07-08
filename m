From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 14:12:53 +0200 (CEST)
Subject: [Buildroot] dbus: wrong place to lookup libexpat.so
Message-ID: <0707081411270.26961@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Index: dbus.mk
===================================================================
--- dbus.mk	(revision 19026)
+++ dbus.mk	(working copy)
@@ -51,7 +51,7 @@
 	touch  $(DBUS_DIR)/.configured

 $(DBUS_DIR)/$(DBUS_BINARY): $(DBUS_DIR)/.configured
-	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/lib/libexpat.so" -C $(DBUS_DIR) all
+	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/usr/lib/libexpat.so" -C $(DBUS_DIR) all

 $(STAGING_DIR)/usr/lib/libdbus-1.so: $(DBUS_DIR)/$(DBUS_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR)/dbus install


-- 
Cristian
