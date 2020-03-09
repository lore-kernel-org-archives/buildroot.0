From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 09 Mar 2020 14:21:42 -0000
Subject: [Buildroot] [git commit] package/avahi: drop most of the
 AVAHI_CONF_ENV vars
Message-ID: <20200309140903.B210B7FBD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02bd5eb59ff113203ea60ffee68bfdbacc4c9245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most are legacy from when the package was added and not really necessary.

This commit is based on dropping the CONF_ENV vars in libgtk2 [1].

[1] https://git.buildroot.net/buildroot/commit/package/libgtk2/libgtk2.mk?id=4d80cbdf6c2c186da26f36575d6635604f00d29a

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avahi/avahi.mk | 51 +-------------------------------------------------
 1 file changed, 1 insertion(+), 50 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 53021f6b6d..23127edcb9 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -10,56 +10,7 @@ AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
 
-AVAHI_CONF_ENV = \
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
-	am_cv_func_working_getline=yes \
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
-	avahi_cv_sys_cxx_works=yes \
-	DATADIRNAME=share
+AVAHI_CONF_ENV = DATADIRNAME=share
 
 # Note: even if we have Gtk2 and Gtk3 support in Buildroot, we
 # explicitly disable support for them, in order to avoid the following
