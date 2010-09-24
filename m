From: Martin Banky <martin.banky@gmail.com>
Date: Thu, 23 Sep 2010 19:55:00 -0700
Subject: [Buildroot] [PATCH 2/6] coreutils: changed/removed some of the
	configure environmental variables
In-Reply-To: <1285296904-25793-1-git-send-email-Martin.Banky@gmail.com>
References: <1285296904-25793-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285296904-25793-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ac_cv_func_closedir_void=no - no longer used
ac_cv_func_fnmatch_gnu=yes - no longer used
ac_cv_func_getcwd_null=yes - duplicate of gl_cv_func_getcwd_null
ac_cv_func_mkstemp=yes - changed to gl_cv_func_working_mkstemp
ac_cv_func_stat_empty_string_bug=no - no longer used
ac_cv_func_utime_null=yes - no longer used
ac_cv_have_decl_euidaccess=no - no longer used
ac_cv_have_decl_nanosleep=yes - no longer used
ac_cv_struct_st_mtim_nsec=no - no longer used
am_cv_func_working_getline=yes - duplicate
am_getline_needs_run_time_check=no - changed to gl_getline_needs_run_time_check
gl_cv_c_restrict=no - changed to ac_cv_c_restrict
gl_cv_func_mkstemp_limitations=no - no longer used
gl_cv_func_working_readdir=yes - no longer used
jm_ac_cv_func_link_follows_symlink=no - changed to gl_ac_cv_func_link_follows_symlink
jm_cv_func_gettimeofday_clobber=no - changed to gl_cv_func_gettimeofday_clobber
jm_cv_func_nanosleep_works=yes - no longer used
jm_cv_func_svid_putenv=yes - changed to gl_cv_func_svid_putenv
jm_cv_func_working_re_compile_pattern=yes - changed to gl_cv_func_re_compile_pattern_working
utils_cv_func_mkdir_trailing_slash_bug=no - duplicate of gl_cv_func_mkdir_trailing_slash_bug
utils_cv_func_mkstemp_limitations=no - duplicate of gl_cv_func_mkstemp_limitations

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/coreutils/coreutils.mk |   66 ++++++++++++++++------------------------
 1 files changed, 26 insertions(+), 40 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index f413411..dd47b0f 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -18,55 +18,41 @@ BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false hostname \
 	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
 	uname join
 
-COREUTILS_CONF_ENV = ac_cv_func_strtod=yes \
-		ac_fsusage_space=yes \
-		fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no \
-		ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no \
-		ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes \
-		ac_cv_func_getgroups_works=yes \
+COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 		ac_cv_func_chown_works=yes \
-		ac_cv_have_decl_euidaccess=no \
 		ac_cv_func_euidaccess=no \
-		ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes \
+		ac_cv_func_getdelim=yes \
+		ac_cv_func_getgroups=yes \
+		ac_cv_func_getgroups_works=yes \
+		ac_cv_func_getloadavg=no \
 		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
 		ac_cv_func_lstat_empty_string_bug=no \
-		ac_cv_func_stat_empty_string_bug=no \
-		gl_cv_func_rename_trailing_slash_bug=no \
-		ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes \
-		gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes \
-		ac_cv_have_decl_strerror_r=yes \
 		ac_cv_func_strerror_r_char_p=no \
-		jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes \
-		ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes \
-		utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no \
-		gl_cv_func_rename_dest_exists_bug=no \
-		jm_cv_func_gettimeofday_clobber=no \
+		ac_cv_func_strnlen_working=yes \
+		ac_cv_func_strtod=yes \
+		ac_cv_func_working_mktime=yes \
+		ac_cv_have_decl_strerror_r=yes \
+		ac_cv_have_decl_strnlen=yes \
+		ac_cv_lib_getloadavg_getloadavg=no \
+		ac_cv_lib_util_getloadavg=no \
+		ac_fsusage_space=yes \
+		ac_use_included_regex=no \
 		am_cv_func_working_getline=yes \
-		gl_cv_func_working_readdir=yes \
-		jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no \
-		ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no \
+		fu_cv_sys_stat_statfs2_bsize=yes \
+		gl_ac_cv_func_link_follows_symlink=no \
 		gl_cv_func_getcwd_null=yes \
 		gl_cv_func_getcwd_path_max=yes \
-		ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no \
-		am_cv_func_working_getline=yes \
+		gl_cv_func_gettimeofday_clobber=no \
 		gl_cv_func_mkdir_trailing_slash_bug=no \
-		gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes \
-		jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no \
-		gl_cv_c_restrict=no
+		gl_cv_func_re_compile_pattern_working=yes \
+		gl_cv_func_rename_dest_exists_bug=no \
+		gl_cv_func_rename_trailing_slash_bug=no \
+		gl_cv_func_svid_putenv=yes \
+		gl_cv_func_tzset_clobber=no \
+		gl_cv_func_working_mkstemp=yes \
+		gl_cv_func_working_utimes=yes \
+		gl_getline_needs_run_time_check=no \
+		utils_cv_localtime_cache=no
 
 COREUTILS_CONF_OPT = --disable-rpath \
 		--disable-dependency-tracking
-- 
1.7.3
