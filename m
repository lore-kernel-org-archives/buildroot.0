From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 20:06:21 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcurl
Message-ID: <20081228200621.4D79C76D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 20:06:20 +0000 (Sun, 28 Dec 2008)
New Revision: 24581

Log:
libcurl: add dummy curl-* targets

Modified:
   trunk/buildroot/package/libcurl/libcurl.mk


Changeset:
Modified: trunk/buildroot/package/libcurl/libcurl.mk
===================================================================
--- trunk/buildroot/package/libcurl/libcurl.mk	2008-12-28 20:04:01 UTC (rev 24580)
+++ trunk/buildroot/package/libcurl/libcurl.mk	2008-12-28 20:06:20 UTC (rev 24581)
@@ -21,3 +21,8 @@
 $(LIBCURL_HOOK_POST_INSTALL):
 	rm -rf $(TARGET_DIR)/usr/bin/curl-config \
 	       $(if $(BR2_PACKAGE_CURL),,$(TARGET_DIR)/usr/bin/curl)
+
+curl: libcurl
+curl-clean: libcurl-clean
+curl-dirclean: libcurl-dirclean
+curl-source: libcurl-source
