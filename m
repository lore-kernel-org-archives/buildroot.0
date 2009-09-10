From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Sep 2009 09:25:55 +0200
Subject: [Buildroot] [git commit master] coreutils: fix
	rename-with-trailing-slash bug override variable name
Message-ID: <20090910072642.05D46777A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dfca1b2e0e70833fd22a3d67bebb38ce497572fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The variable controlling if coreutils thinks the system has the
rename-with-trailing-slash bug is called
gl_cv_func_rename_trailing_slash_bug and not vb_cv_..

Forcing this off works around a bug in coreutils configure, which
otherwise tries to compile Windows-only workaround code.

Reported-by: Stephen Rodgers <hwstar@rodgers.sdcoxmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/coreutils/coreutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 087948b..ad9092c 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -46,7 +46,7 @@ $(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
 		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
 		ac_cv_func_lstat_empty_string_bug=no \
 		ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no \
+		gl_cv_func_rename_trailing_slash_bug=no \
 		ac_cv_have_decl_nanosleep=yes \
 		jm_cv_func_nanosleep_works=yes \
 		gl_cv_func_working_utimes=yes \
-- 
1.6.3.3
