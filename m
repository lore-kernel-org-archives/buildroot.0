From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 25 Oct 2008 01:38:34 +0200
Subject: [Buildroot] [PATCH] libglib2: remove redundant configure args
Message-ID: <200810250138.34304.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/libglib2/libglib2.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ba77399..1a20666 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -11,7 +11,7 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-LIBGLIB2_CONF_ENV =	$(TARGET_CONFIGURE_OPTS) $(TARGET_CONFIGURE_ARGS) \
+LIBGLIB2_CONF_ENV =	\
 		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
@@ -28,7 +28,7 @@ LIBGLIB2_CONF_ENV =	$(TARGET_CONFIGURE_OPTS) $(TARGET_CONFIGURE_ARGS) \
 		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
+		utils_cv_func_mkdir_trailing_slash_bug=no \
 		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
 		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
 		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
-- 
1.5.6.4
