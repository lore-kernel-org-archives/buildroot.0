From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 19:48:56 +0200
Subject: [Buildroot] [git commit] autoconf: bump to version 2.68
Message-ID: <20120624180619.4E74B83506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd7081bae524390e4ec22e8d100d5a242b63d29d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...toconf-2.65-fix-m4-detection-test-on-dash.patch |   36 --------------------
 ...ch => autoconf-dont-add-dirty-to-version.patch} |    0
 package/autoconf/autoconf.mk                       |    4 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/autoconf/autoconf-2.65-fix-m4-detection-test-on-dash.patch b/package/autoconf/autoconf-2.65-fix-m4-detection-test-on-dash.patch
deleted file mode 100644
index 35f99b2..0000000
--- a/package/autoconf/autoconf-2.65-fix-m4-detection-test-on-dash.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Patch taken upstream at
-http://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=7f75858f577f11a844781764f30cd42cfe8a5669,
-with the following modifications:
-
- * Changes to NEWS file removed to avoid conflicts
-
- * Changes also made manually to the generated configure
-   script. Otherwise, host-autoconf is needed to compile
-   host-autoconf !
-
-Index: autoconf-2.65.old/configure
-===================================================================
---- autoconf-2.65.old.orig/configure	2009-12-15 16:11:05.175566911 +0100
-+++ autoconf-2.65.old/configure	2009-12-15 16:11:37.739562146 +0100
-@@ -2380,7 +2380,7 @@
-       ac_snippet=change'quote(<,>)in''dir(<if''def>,mac,bug)'
-       ac_snippet=${ac_snippet}pat'subst(a,\(b\)\|\(a\),\1)d'nl
-       test -z "`$ac_path_M4 -F conftest.m4f </dev/null 2>&1`" \
--      && test -z "`echo $ac_snippet | $ac_path_M4 --trace=mac 2>&1`" \
-+      && test -z "`$as_echo $ac_snippet | $ac_path_M4 --trace=mac 2>&1`" \
-       && test -f conftest.m4f \
-       && ac_cv_path_M4=$ac_path_M4 ac_path_M4_found=:
-       rm -f conftest.m4f
-Index: autoconf-2.65.old/m4/m4.m4
-===================================================================
---- autoconf-2.65.old.orig/m4/m4.m4	2009-12-15 16:11:05.207566124 +0100
-+++ autoconf-2.65.old/m4/m4.m4	2009-12-15 16:11:18.595562030 +0100
-@@ -29,7 +29,7 @@
-       ac_snippet=change'quote(<,>)in''dir(<if''def>,mac,bug)'
-       ac_snippet=${ac_snippet}pat'subst(a,\(b\)\|\(a\),\1)d'nl
-       test -z "`$ac_path_M4 -F conftest.m4f </dev/null 2>&1`" \
--      && test -z "`echo $ac_snippet | $ac_path_M4 --trace=mac 2>&1`" \
-+      && test -z "`AS_ECHO([$ac_snippet]) | $ac_path_M4 --trace=mac 2>&1`" \
-       && test -f conftest.m4f \
-       && ac_cv_path_M4=$ac_path_M4 ac_path_M4_found=:
-       rm -f conftest.m4f],
diff --git a/package/autoconf/autoconf-2.65-dont-add-dirty-to-version.patch b/package/autoconf/autoconf-dont-add-dirty-to-version.patch
similarity index 100%
rename from package/autoconf/autoconf-2.65-dont-add-dirty-to-version.patch
rename to package/autoconf/autoconf-dont-add-dirty-to-version.patch
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 7c42bf9..4e7f3fc 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -3,8 +3,8 @@
 # autoconf
 #
 #############################################################
-AUTOCONF_VERSION = 2.65
-AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
+
+AUTOCONF_VERSION = 2.68
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
