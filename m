From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Sat, 10 Jan 2009 14:55:52 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20090110145553.16CB476A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-10 14:55:52 +0000 (Sat, 10 Jan 2009)
New Revision: 24745

Log:
We do not need gtk-doc on the target (and hopefully not in staging.. )


Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-01-10 13:47:18 UTC (rev 24744)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-01-10 14:55:52 UTC (rev 24745)
@@ -45,6 +45,7 @@
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 LIBGLIB2_CONF_OPT = --enable-shared \
+		--disable-gtk-doc \
 		--enable-static
 
 LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig
