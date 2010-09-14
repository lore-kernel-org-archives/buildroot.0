From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:30 -0700
Subject: [Buildroot] [PATCH 03/21] autoconf: bump to 2.67
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-3-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES                                            |    5 ++-
 ...toconf-2.65-fix-m4-detection-test-on-dash.patch |   36 --------------------
 package/autoconf/autoconf.mk                       |    2 +-
 3 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 package/autoconf/autoconf-2.65-fix-m4-detection-test-on-dash.patch

diff --git a/CHANGES b/CHANGES
index 7b5875c..6abd5c0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,9 @@
 
 	Toolchain: ARM cortex A9 support
 
-	Updated/fixed packages: alsa-lib, alsa-utils, berkeleydb, busybox,
-	dropbear, iptables, kismet, openvpn, qt, usbutils
+	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, 
+	berkeleydb, busybox, dropbear, iptables, kismet, openvpn, qt,
+	usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
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
