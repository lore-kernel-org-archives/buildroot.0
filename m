From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:15:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: libdnet python
Message-ID: <20090111201536.0E3DD76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:15:35 +0000 (Sun, 11 Jan 2009)
New Revision: 24758

Log:
Change name from PYTHON_VERSION_SHORT to PYTHON_VERSION_MAJOR

Modified:
   trunk/buildroot/package/libdnet/libdnet.mk
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/libdnet/libdnet.mk
===================================================================
--- trunk/buildroot/package/libdnet/libdnet.mk	2009-01-11 20:13:49 UTC (rev 24757)
+++ trunk/buildroot/package/libdnet/libdnet.mk	2009-01-11 20:15:35 UTC (rev 24758)
@@ -16,7 +16,7 @@
 ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
 LIBDNET_DEPENDENCIES += python
 LIBDNET_CONF_OPT += --with-python
-LIBDNET_MAKE_OPT = PYTHON=python$(PYTHON_VERSION_SHORT) PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_SHORT)
+LIBDNET_MAKE_OPT = PYTHON=python$(PYTHON_VERSION_MAJOR) PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 LIBDNET_INSTALL_TARGET_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
 LIBDNET_INSTALL_STAGING_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
 endif

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2009-01-11 20:13:49 UTC (rev 24757)
+++ trunk/buildroot/package/python/python.mk	2009-01-11 20:15:35 UTC (rev 24758)
@@ -4,7 +4,7 @@
 #
 #############################################################
 PYTHON_VERSION=2.4.5
-PYTHON_VERSION_SHORT=2.4
+PYTHON_VERSION_MAJOR=2.4
 PYTHON_SOURCE:=Python-$(PYTHON_VERSION).tar.bz2
 PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_DIR:=$(BUILD_DIR)/Python-$(PYTHON_VERSION)
@@ -12,7 +12,7 @@
 PYTHON_BINARY:=python
 PYTHON_TARGET_BINARY:=usr/bin/python
 PYTHON_DEPS:=
-PYTHON_SITE_PACKAGE_DIR=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/site-packages
+PYTHON_SITE_PACKAGE_DIR=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
 BR2_PYTHON_DISABLED_MODULES=dbm zipfile
 
@@ -78,7 +78,7 @@
 	touch $@
 
 $(PYTHON_DIR)/.patched: $(PYTHON_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(PYTHON_DIR) package/python/ python-$(PYTHON_VERSION_SHORT)-\*.patch
+	toolchain/patch-kernel.sh $(PYTHON_DIR) package/python/ python-$(PYTHON_VERSION_MAJOR)-\*.patch
 	touch $@
 
 $(PYTHON_DIR)/.hostpython: $(PYTHON_DIR)/.patched
@@ -134,16 +134,16 @@
 		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
 		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen && \
 	rm $(TARGET_DIR)/usr/bin/python && \
-	ln -s python$(PYTHON_VERSION_SHORT) $(TARGET_DIR)/usr/bin/python && \
+	ln -s python$(PYTHON_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/python && \
 	rm $(TARGET_DIR)/usr/bin/idle && \
 	rm $(TARGET_DIR)/usr/bin/pydoc && \
 	find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \; && \
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/test
-	cp -dpr $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_SHORT) $(STAGING_DIR)/usr/include/
-	mkdir -p $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)
-	cp -dpr $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/config $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/
+		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/test
+	cp -dpr $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) $(STAGING_DIR)/usr/include/
+	mkdir -p $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
+	cp -dpr $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/
 
 ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -exec rm {} \;
@@ -152,18 +152,18 @@
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
 endif
 ifneq ($(BR2_PACKAGE_PYTHON_DEV),y)
-	rm -rf $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_SHORT)
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/config
+	rm -rf $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
 endif
 ifneq ($(BR2_PACKAGE_PYTHON_BSDDB),y)
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/bsddb
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/bsddb
 endif
 ifneq ($(BR2_PACKAGE_PYTHON_CURSES),y)
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/curses
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/curses
 endif
 ifneq ($(BR2_PACKAGE_PYTHON_TKINTER),y)
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/lib-tk
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/lib-tk
 endif
 
 python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
