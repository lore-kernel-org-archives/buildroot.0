From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Dec 2015 17:17:12 -0300
Subject: [Buildroot] [PATCH] cairo: drop CAIRO_CONF_ENV variables
Message-ID: <1449778632-9069-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are completely historic from the initial commit (3a0a8791) and
completely unused.

Two separate builds with/without give nothing relevant with:

$ diff -u cairo.cv/config.log cairo-1.14.4/config.log|grep ^+

Same applies to removals with:

$ diff -u cairo.cv/config.log cairo-1.14.4/config.log|grep ^-

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cairo/cairo.mk | 52 --------------------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 9018b29..d80d068 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -12,58 +12,6 @@ CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 CAIRO_AUTORECONF = YES
 
-CAIRO_CONF_ENV = \
-	ac_cv_func_posix_getpwuid_r=yes \
-	glib_cv_stack_grows=no \
-	glib_cv_uscore=no \
-	ac_cv_func_strtod=yes \
-	ac_fsusage_space=yes \
-	fu_cv_sys_stat_statfs2_bsize=yes \
-	ac_cv_func_closedir_void=no \
-	ac_cv_func_getloadavg=no \
-	ac_cv_lib_util_getloadavg=no \
-	ac_cv_lib_getloadavg_getloadavg=no \
-	ac_cv_func_getgroups=yes \
-	ac_cv_func_getgroups_works=yes \
-	ac_cv_func_chown_works=yes \
-	ac_cv_have_decl_euidaccess=no \
-	ac_cv_func_euidaccess=no \
-	ac_cv_have_decl_strnlen=yes \
-	ac_cv_func_strnlen_working=yes \
-	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-	ac_cv_func_lstat_empty_string_bug=no \
-	ac_cv_func_stat_empty_string_bug=no \
-	vb_cv_func_rename_trailing_slash_bug=no \
-	ac_cv_have_decl_nanosleep=yes \
-	jm_cv_func_nanosleep_works=yes \
-	gl_cv_func_working_utimes=yes \
-	ac_cv_func_utime_null=yes \
-	ac_cv_have_decl_strerror_r=yes \
-	ac_cv_func_strerror_r_char_p=no \
-	jm_cv_func_svid_putenv=yes \
-	ac_cv_func_getcwd_null=yes \
-	ac_cv_func_getdelim=yes \
-	ac_cv_func_mkstemp=yes \
-	utils_cv_func_mkstemp_limitations=no \
-	utils_cv_func_mkdir_trailing_slash_bug=no \
-	jm_cv_func_gettimeofday_clobber=no \
-	gl_cv_func_working_readdir=yes \
-	jm_ac_cv_func_link_follows_symlink=no \
-	utils_cv_localtime_cache=no \
-	ac_cv_struct_st_mtim_nsec=no \
-	gl_cv_func_tzset_clobber=no \
-	gl_cv_func_getcwd_null=yes \
-	gl_cv_func_getcwd_path_max=yes \
-	ac_cv_func_fnmatch_gnu=yes \
-	am_getline_needs_run_time_check=no \
-	am_cv_func_working_getline=yes \
-	gl_cv_func_mkdir_trailing_slash_bug=no \
-	gl_cv_func_mkstemp_limitations=no \
-	ac_cv_func_working_mktime=yes \
-	jm_cv_func_working_re_compile_pattern=yes \
-	ac_use_included_regex=no \
-	gl_cv_c_restrict=no
-
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
 endif
-- 
2.4.10
