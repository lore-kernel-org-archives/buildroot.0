From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 21:29:08 +0100
Subject: [Buildroot] [git commit] pango: drop PANGO_CONF_ENV variables
Message-ID: <20151211202913.6A99082523@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc8bc8649683bdaad368851e1db284f1b47fca97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are completely historic from the initial commit (d106a63d) and
completely unused.

Two separate builds with/without give nothing relevant with:

$ diff -u pango.cv/config.log pango-1.38.1/config.log|grep ^+

Same applies to removals with:

$ diff -u pango.cv/config.log pango-1.38.1/config.log|grep ^-

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk | 53 --------------------------------------------------
 1 file changed, 53 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 6c96cd3..a6b1a60 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -13,59 +13,6 @@ PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPLv2+
 PANGO_LICENSE_FILES = COPYING
 
-PANGO_CONF_ENV = \
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
-	gl_cv_c_restrict=no \
-	ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
-
 PANGO_CONF_OPTS = --enable-explicit-deps=no
 HOST_PANGO_CONF_OPTS = --enable-explicit-deps=no
 
