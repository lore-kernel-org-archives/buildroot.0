From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Jan 2012 14:37:20 +0100
Subject: [Buildroot] [git commit] tremor: bump version
Message-ID: <20120125140244.0588490573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f3dc70b4fcd45dea7c83bd946f3a531ac76fbd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previous snapshot is now more than 2 years, and numerous fixes have been
added to svn. Old Patch is now upstream, libogg is required.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../tremor/tremor-export-all-symbols.patch         |   32 --------------------
 package/multimedia/tremor/tremor.mk                |    8 ++--
 2 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/package/multimedia/tremor/tremor-export-all-symbols.patch b/package/multimedia/tremor/tremor-export-all-symbols.patch
deleted file mode 100644
index 127d16b..0000000
--- a/package/multimedia/tremor/tremor-export-all-symbols.patch
+++ /dev/null
@@ -1,32 +0,0 @@
---- tremor-16259-orig/configure.in	2009-12-02 11:45:11.000000000 +0100
-+++ tremor-16259/configure.in	2009-12-03 16:50:19.000000000 +0100
-@@ -72,23 +72,6 @@
- LDFLAGS="$LDFLAGS $ldflags_save"
- 
- 
--# Test whenever ld supports -version-script
--AC_PROG_LD
--AC_PROG_LD_GNU
--if test "x$lt_cv_prog_gnu_ld" = "xyes"; then
--   SHLIB_VERSION_ARG="Wl,--version-script=Version_script"
--
--   dnl Set extra linker options
--   case "$target_os" in
--  linux* | solaris* )
--    SHLIB_VERSION_ARG="-Wl,--version-script=Version_script"
--    ;;
--  *)
--    ;;
--   esac
--   LDFLAGS="$LDFLAGS $SHLIB_VERSION_ARG"
--fi
--
- dnl --------------------------------------------------
- dnl Options 
- dnl --------------------------------------------------
-@@ -128,4 +111,4 @@
- AC_SUBST(DEBUG)
- AC_SUBST(PROFILE)
- 
--AC_OUTPUT(Makefile Version_script)
-+AC_OUTPUT(Makefile)
diff --git a/package/multimedia/tremor/tremor.mk b/package/multimedia/tremor/tremor.mk
index cf228b8..b836010 100644
--- a/package/multimedia/tremor/tremor.mk
+++ b/package/multimedia/tremor/tremor.mk
@@ -4,12 +4,12 @@
 #
 ############################################################
 
-TREMOR_SITE:=http://svn.xiph.org/trunk/Tremor/
-TREMOR_SITE_METHOD:=svn
-TREMOR_VERSION:=16259
+TREMOR_SITE = http://svn.xiph.org/trunk/Tremor/
+TREMOR_SITE_METHOD = svn
+TREMOR_VERSION = 18153
 
 TREMOR_AUTORECONF = YES
 TREMOR_INSTALL_STAGING = YES
-TREMOR_INSTALL_TARGET = YES
+TREMOR_DEPENDENCIES = libogg
 
 $(eval $(call AUTOTARGETS))
