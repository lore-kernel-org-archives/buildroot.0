From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  5 Jul 2008 00:44:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/curl
Message-ID: <20080705074434.38F253C679@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-05 00:44:28 -0700 (Sat, 05 Jul 2008)
New Revision: 22647

Log:
Use latest config.* from buildroot in curl

Modified:
   trunk/buildroot/package/curl/curl.mk


Changeset:
Modified: trunk/buildroot/package/curl/curl.mk
===================================================================
--- trunk/buildroot/package/curl/curl.mk	2008-07-05 07:25:06 UTC (rev 22646)
+++ trunk/buildroot/package/curl/curl.mk	2008-07-05 07:44:28 UTC (rev 22647)
@@ -26,7 +26,9 @@
 	(cd $(CURL_DIR); rm -rf config.cache; \
 		aclocal; \
 		libtoolize --force; \
-		./reconf; \
+		./reconf; )
+	$(CONFIG_UPDATE) $(CURL_DIR)
+	(cd $(CURL_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
