From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 15:37:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20080826223734.748F33C7DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 15:37:34 -0700 (Tue, 26 Aug 2008)
New Revision: 23230

Log:
libglib2: remove redundant configure args

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-08-26 22:37:30 UTC (rev 23229)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-08-26 22:37:34 UTC (rev 23230)
@@ -44,14 +44,7 @@
 		ac_cv_prog_CXX=no ac_cv_func_posix_getgrgid_r=no \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
-LIBGLIB2_CONF_OPT =	--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--exec-prefix=/usr --bindir=/usr/bin \
-		--sbindir=/usr/sbin --libdir=/usr/lib \
-		--libexecdir=/usr/lib --sysconfdir=/etc \
-		--datadir=/usr/share --localstatedir=/var \
-		--includedir=/usr/include --mandir=/usr/man \
-		--infodir=/usr/info --enable-shared \
+LIBGLIB2_CONF_OPT = --enable-shared \
 		--enable-static $(DISABLE_NLS)
 
 LIBGLIB2_DEPENDENCIES = uclibc gettext libintl libiconv pkgconfig
