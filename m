From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Wed, 29 Apr 2009 08:51:39 +0000 (UTC)
Subject: [Buildroot] svn commit: [26238]
	trunk/buildroot/package/shared-mime-info
Message-ID: <20090429085139.9DDC87646C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2009-04-29 08:51:39 +0000 (Wed, 29 Apr 2009)
New Revision: 26238

Log:
Fix issues in shared-mime-info

 * Properly indent Config.in
 * Remove unneeded SHARED_MIME_INFO_INSTALL_STAGING_OPT definition

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/package/shared-mime-info/Config.in
   trunk/buildroot/package/shared-mime-info/shared-mime-info.mk


Changeset:
Modified: trunk/buildroot/package/shared-mime-info/Config.in
===================================================================
--- trunk/buildroot/package/shared-mime-info/Config.in	2009-04-29 08:12:22 UTC (rev 26237)
+++ trunk/buildroot/package/shared-mime-info/Config.in	2009-04-29 08:51:39 UTC (rev 26238)
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SHARED_MIME_INFO
 	bool "shared-mime-info"
 	select BR2_PACKAGE_LIBGLIB2
-        select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXML2
 	help
-                The shared-mime-info package contains the core
-                database of common types and the update-mime-database
-                command used to extend it.
+	  The shared-mime-info package contains the core
+	  database of common types and the update-mime-database
+	  command used to extend it.
 
-                http://freedesktop.org/wiki/Software/shared-mime-info
+	  http://freedesktop.org/wiki/Software/shared-mime-info

Modified: trunk/buildroot/package/shared-mime-info/shared-mime-info.mk
===================================================================
--- trunk/buildroot/package/shared-mime-info/shared-mime-info.mk	2009-04-29 08:12:22 UTC (rev 26237)
+++ trunk/buildroot/package/shared-mime-info/shared-mime-info.mk	2009-04-29 08:51:39 UTC (rev 26238)
@@ -8,7 +8,6 @@
 SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 
 SHARED_MIME_INFO_INSTALL_STAGING = YES
-SHARED_MIME_INFO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 SHARED_MIME_INFO_INSTALL_TARGET = NO
 
 SHARED_MIME_INFO_AUTORECONF = NO
