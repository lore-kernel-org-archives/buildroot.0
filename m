From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 07:23:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20070923142316.263313009D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 07:23:16 -0700 (Sun, 23 Sep 2007)
New Revision: 19972

Log:
Cleanup libxml2 directory structure

Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2007-09-23 14:21:39 UTC (rev 19971)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2007-09-23 14:23:16 UTC (rev 19972)
@@ -65,16 +65,23 @@
 
 libxml2: uclibc $(TARGET_DIR)/usr/lib/libxml2.so libxml2-headers
 
-$(STAGING_DIR)/usr/include/libxml: $(TARGET_DIR)/usr/lib/libxml2.so
+$(STAGING_DIR)/usr/include/libxml2: $(TARGET_DIR)/usr/lib/libxml2.so
 	cp -af $(LIBXML2_DIR)/include/libxml $(STAGING_DIR)/usr/include/libxml2
+	touch -c $@
 
 $(TARGET_DIR)/usr/include/libxml2: libxml2-headers
-	cp -af $(LIBXML2_DIR)/include/libxml $(TARGET_DIR)/usr/include/libxml2
+	cp -af $(LIBXML2_DIR)/usr/include/libxml2 $(TARGET_DIR)/usr/include/libxml2
+	touch -c $@
 
+$(TARGET_DIR)/usr/include/libxml: libxml2-headers
+	ln -s libxml2/libxml $(LIBXML2_DIR)/usr/include/libxml
+	touch -c $@
 
-libxml2-headers: $(STAGING_DIR)/usr/include/libxml
+libxml2-headers: $(STAGING_DIR)/usr/include/libxml2
 
-libxml2-target-headers: $(TARGET_DIR)/usr/include/libxml2 $(TARGET_DIR)/usr/lib/libxml2.a
+libxml2-target-headers: $(TARGET_DIR)/usr/include/libxml2 \
+	$(TARGET_DIR)/usr/include/libxml2 \
+	$(TARGET_DIR)/usr/lib/libxml2.a
 
 libxml2-source: $(DL_DIR)/$(LIBXML2_SOURCE)
 
