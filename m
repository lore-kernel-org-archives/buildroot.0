From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 13:02:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20081026200234.4230C3C6B6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-26 13:02:34 -0700 (Sun, 26 Oct 2008)
New Revision: 23806

Log:
libglib2: remove redundant configure args

Patch by Markus Heidelberg.

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-10-26 19:57:55 UTC (rev 23805)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-10-26 20:02:34 UTC (rev 23806)
@@ -11,7 +11,7 @@
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-LIBGLIB2_CONF_ENV =	$(TARGET_CONFIGURE_OPTS) $(TARGET_CONFIGURE_ARGS) \
+LIBGLIB2_CONF_ENV =	\
 		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
@@ -28,7 +28,7 @@
 		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
+		utils_cv_func_mkdir_trailing_slash_bug=no \
 		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
 		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
 		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
