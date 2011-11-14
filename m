From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 09:34:42 +0100
Subject: [Buildroot] [git commit branch/next] coreutils: bump to version 8.14
Message-ID: <20111114083550.889CD8F555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddfb134399b295dbf3410be3ee4bb52d7b97e6ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...man.patch => coreutils-8.14-hostname-man.patch} |    0
 package/coreutils/coreutils.mk                     |    7 +++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

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
