From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:22:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080306182210.C3F3C120244@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:22:10 -0800 (Thu, 06 Mar 2008)
New Revision: 21221

Log:
reordered path fixes

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-03-06 18:21:33 UTC (rev 21220)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-03-06 18:22:10 UTC (rev 21221)
@@ -177,8 +177,18 @@
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_TARGET_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
 endif
+
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
 	$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	
+	# Fix compiler path
+	$(SED) '\,QMAKE_CC, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_CXX, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_LINK, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_LINK_SHLIB, c\QMAKE_LINK_SHLIB = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_AR, c\QMAKE_AR = $(TARGET_CROSS)ar cqs' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_RANLIB, c\QMAKE_RANLIB = $(TARGET_RANLIB)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_STRIP, c\QMAKE_STRIP = $(TARGET_CROSS)strip' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
 		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
@@ -224,6 +234,7 @@
 		-fast \
 		-nomake examples \
 		-no-rpath \
+		-no-fatal_error \
 		$(QTOPIA4_QT3SUPPORT) \
 		$(QTOPIA4_TSLIB) \
 		$(QTOPIA4_LARGEFILE) \
@@ -256,14 +267,6 @@
 	-rm $(TARGET_DIR)/usr/lib/libQtSql*
 	# Remove Svg libraries, not needed
 	-rm $(TARGET_DIR)/usr/lib/libQtSvg*
-	# Fix compiler path
-	$(SED) '\,QMAKE_CC, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_CXX, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_LINK, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_LINK_SHLIB, c\QMAKE_LINK_SHLIB = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_AR, c\QMAKE_AR = $(TARGET_CROSS)ar cqs' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_RANLIB, c\QMAKE_RANLIB = $(TARGET_RANLIB)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_STRIP, c\QMAKE_STRIP = $(TARGET_CROSS)strip' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 	touch $@
 
 
