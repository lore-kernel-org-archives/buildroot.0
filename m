From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 31 Dec 2008 09:35:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: libcurl libglade
Message-ID: <20081231093507.E451776FDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-31 09:35:06 +0000 (Wed, 31 Dec 2008)
New Revision: 24623

Log:
libcurl/libglade: touch _HOOK_POST_INSTALL target

Modified:
   trunk/buildroot/package/libcurl/libcurl.mk
   trunk/buildroot/package/libglade/libglade.mk


Changeset:
Modified: trunk/buildroot/package/libcurl/libcurl.mk
===================================================================
--- trunk/buildroot/package/libcurl/libcurl.mk	2008-12-31 03:43:24 UTC (rev 24622)
+++ trunk/buildroot/package/libcurl/libcurl.mk	2008-12-31 09:35:06 UTC (rev 24623)
@@ -21,6 +21,7 @@
 $(LIBCURL_HOOK_POST_INSTALL):
 	rm -rf $(TARGET_DIR)/usr/bin/curl-config \
 	       $(if $(BR2_PACKAGE_CURL),,$(TARGET_DIR)/usr/bin/curl)
+	touch $@
 
 curl: libcurl
 curl-clean: libcurl-clean

Modified: trunk/buildroot/package/libglade/libglade.mk
===================================================================
--- trunk/buildroot/package/libglade/libglade.mk	2008-12-31 03:43:24 UTC (rev 24622)
+++ trunk/buildroot/package/libglade/libglade.mk	2008-12-31 09:35:06 UTC (rev 24623)
@@ -15,3 +15,4 @@
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc \
 	       $(TARGET_DIR)/usr/share/xml/libglade \
 	       $(TARGET_DIR)/usr/bin/libglade-convert
+	touch $@
