From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 13 Nov 2011 19:27:58 -0300
Subject: [Buildroot] [PATCH 10/10] coreutils: bump to version 8.14
In-Reply-To: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
References: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1321223278-14388-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...man.patch => coreutils-8.14-hostname-man.patch} |    0
 package/coreutils/coreutils.mk                     |    7 +++++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 rename package/coreutils/{coreutils-8.9-hostname-man.patch => coreutils-8.14-hostname-man.patch} (100%)

diff --git a/package/coreutils/coreutils-8.9-hostname-man.patch b/package/coreutils/coreutils-8.14-hostname-man.patch
similarity index 100%
rename from package/coreutils/coreutils-8.9-hostname-man.patch
rename to package/coreutils/coreutils-8.14-hostname-man.patch
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 7ee37b1..eb88535 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -3,9 +3,10 @@
 # coreutils
 #
 #############################################################
-COREUTILS_VERSION = 8.9
-COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.gz
+
+COREUTILS_VERSION = 8.14
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
+COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 
 # If both coreutils and busybox are selected, make certain coreutils
 # wins the fight over who gets to have their utils actually installed.
@@ -20,6 +21,7 @@ COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false hostnam
 COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 		ac_cv_func_chown_works=yes \
 		ac_cv_func_euidaccess=no \
+		ac_cv_func_fstatat=yes \
 		ac_cv_func_getdelim=yes \
 		ac_cv_func_getgroups=yes \
 		ac_cv_func_getgroups_works=yes \
@@ -41,6 +43,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 		gl_cv_func_getcwd_null=yes \
 		gl_cv_func_getcwd_path_max=yes \
 		gl_cv_func_gettimeofday_clobber=no \
+		gl_cv_func_fstatat_zero_flag=no \
 		gl_cv_func_link_follows_symlink=no \
 		gl_cv_func_re_compile_pattern_working=yes \
 		gl_cv_func_svid_putenv=yes \
-- 
1.7.3.4
