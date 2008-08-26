From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 15:37:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20080826223730.CCE973C7CA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 15:37:30 -0700 (Tue, 26 Aug 2008)
New Revision: 23229

Log:
libglib2 fix !BR2_USE_WCHAR compilation

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-08-26 22:37:27 UTC (rev 23228)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-08-26 22:37:30 UTC (rev 23229)
@@ -41,7 +41,8 @@
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal ac_cv_prog_F77=no \
-		ac_cv_prog_CXX=no ac_cv_func_posix_getgrgid_r=no
+		ac_cv_prog_CXX=no ac_cv_func_posix_getgrgid_r=no \
+		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 LIBGLIB2_CONF_OPT =	--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --prefix=/usr \
