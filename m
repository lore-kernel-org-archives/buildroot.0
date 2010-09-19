From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:25 -0700
Subject: [Buildroot] [PATCH 03/21] autoconf: bump to 2.67
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-4-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 ...toconf-2.65-fix-m4-detection-test-on-dash.patch |   36 --------------------
 package/autoconf/autoconf.mk                       |    2 +-
 2 files changed, 1 insertions(+), 37 deletions(-)
 delete mode 100644 package/autoconf/autoconf-2.65-fix-m4-detection-test-on-dash.patch

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
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 8794466..b1fc52d 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -3,7 +3,7 @@
 # autoconf
 #
 #############################################################
-AUTOCONF_VERSION = 2.65
+AUTOCONF_VERSION = 2.67
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-- 
1.7.2.3
