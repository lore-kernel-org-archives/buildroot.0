From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 13:02:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20081026200237.27C313C6D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-26 13:02:36 -0700 (Sun, 26 Oct 2008)
New Revision: 23807

Log:
libglib2: remove $(DISABLE_NLS) from configure options

The configure option --disable-nls is not supported anymore in glib
since version 2.0, see file ChangeLog.pre-2-0 line 544.

Patch by Markus Heidelberg.

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-10-26 20:02:34 UTC (rev 23806)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-10-26 20:02:36 UTC (rev 23807)
@@ -45,7 +45,7 @@
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 LIBGLIB2_CONF_OPT = --enable-shared \
-		--enable-static $(DISABLE_NLS)
+		--enable-static
 
 LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig
 
