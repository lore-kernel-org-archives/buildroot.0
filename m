From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 26 Aug 2007 13:47:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070826204719.53187A6ABE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-26 13:47:18 -0700 (Sun, 26 Aug 2007)
New Revision: 19702

Log:
- If we are to build some libs then require them to exist.
- Strip host files with host strip (untested, will likely need a HOSTSTRIP)


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-08-26 20:40:31 UTC (rev 19701)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-08-26 20:47:18 UTC (rev 19702)
@@ -316,20 +316,20 @@
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
+	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
+	-strip --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libstdc++.so*
+	cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
+	-strip --strip-unneeded $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
-	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/usr/lib/
-	-cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/usr/lib/
-	-cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/usr/lib/security
-	-cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
-	-cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
+	cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
+	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
 endif
 	touch $@
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-26 20:40:31 UTC (rev 19701)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-26 20:47:18 UTC (rev 19702)
@@ -340,18 +340,18 @@
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
-	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
-	-cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/lib/
-	-cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/lib/
 	mkdir -p $(TARGET_DIR)/usr/lib/security
-	-cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
-	-cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
+	cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
+	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
 endif
 	touch $@
 
