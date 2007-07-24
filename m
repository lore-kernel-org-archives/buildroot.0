From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 24 Jul 2007 07:12:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20070724141238.76176A608B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-24 07:12:38 -0700 (Tue, 24 Jul 2007)
New Revision: 19249

Log:
Fix some bugs in libxml2 make

Modified:
   trunk/buildroot/package/libxml2/Config.in
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/Config.in
===================================================================
--- trunk/buildroot/package/libxml2/Config.in	2007-07-24 14:10:03 UTC (rev 19248)
+++ trunk/buildroot/package/libxml2/Config.in	2007-07-24 14:12:38 UTC (rev 19249)
@@ -6,3 +6,13 @@
 	  Requires WCHAR
 
 	  ftp://xmlsoft.org/libxml2
+
+config BR2_PACKAGE_LIBXML2_TARGET_HEADERS
+	bool "libxml2 target headers"
+	default n
+	help
+	  XML C Parser
+	  Requires WCHAR
+
+	  ftp://xmlsoft.org/libxml2
+

Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2007-07-24 14:10:03 UTC (rev 19248)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2007-07-24 14:12:38 UTC (rev 19249)
@@ -53,11 +53,11 @@
 $(STAGING_DIR)/usr/include/libxml:	$(TARGET_DIR)/usr/lib/libxml2.a
 	cp -af $(LIBXML2_DIR)/include/libxml $(STAGING_DIR)/usr/include/libxml2
 
-$(TARGET_DIR)/usr/include:	libxml2-headers
+$(TARGET_DIR)/usr/include/libxml2:	libxml2-headers
 	cp -af $(LIBXML2_DIR)/include/libxml $(TARGET_DIR)/usr/include/libxml2
 
 
-libxml2-headers:	$(STAGING_DIR)/usr/include/libxml2
+libxml2-headers:	$(STAGING_DIR)/usr/include/libxml
 
 libxml2-target-headers: $(TARGET_DIR)/usr/include/libxml2
 
