From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 15:37:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20080826223727.C982F3C7AE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 15:37:27 -0700 (Tue, 26 Aug 2008)
New Revision: 23228

Log:
libglib2: select libiconv

Modified:
   trunk/buildroot/package/libglib2/Config.in
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/Config.in
===================================================================
--- trunk/buildroot/package/libglib2/Config.in	2008-08-26 22:37:23 UTC (rev 23227)
+++ trunk/buildroot/package/libglib2/Config.in	2008-08-26 22:37:27 UTC (rev 23228)
@@ -3,6 +3,7 @@
 	select BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_GETTEXT
 	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_LIBICONV
 	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-08-26 22:37:23 UTC (rev 23227)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-08-26 22:37:27 UTC (rev 23228)
@@ -53,6 +53,6 @@
 		--infodir=/usr/info --enable-shared \
 		--enable-static $(DISABLE_NLS)
 
-LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig
+LIBGLIB2_DEPENDENCIES = uclibc gettext libintl libiconv pkgconfig
 
 $(eval $(call AUTOTARGETS,package,libglib2))
