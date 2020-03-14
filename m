From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:03:57 +0100
Subject: [Buildroot] [git commit] package/c-ares: bump to version 1.16.0
Message-ID: <20200314135116.03BED829FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6620250fc56057a2495bc0c222681bf36d4ee5ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-use_check_build_instead_of_check_user.patch    | 17 -----------------
 package/c-ares/c-ares.hash                              |  4 ++--
 package/c-ares/c-ares.mk                                |  4 +---
 3 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/package/c-ares/0001-use_check_build_instead_of_check_user.patch b/package/c-ares/0001-use_check_build_instead_of_check_user.patch
deleted file mode 100644
index 8210ed673b..0000000000
--- a/package/c-ares/0001-use_check_build_instead_of_check_user.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Use XC_CHECK_BUILD_FLAGS instead of XC_CHECK_USER_FLAGS.
-Otherwise it complains of CPPFLAGS in CFLAGS.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura c-ares-1.10.0.orig/m4/xc-cc-check.m4 c-ares-1.10.0/m4/xc-cc-check.m4
---- c-ares-1.10.0.orig/m4/xc-cc-check.m4	2013-12-26 19:40:46.354195974 -0300
-+++ c-ares-1.10.0/m4/xc-cc-check.m4	2013-12-26 19:41:01.850718535 -0300
-@@ -59,7 +59,7 @@
- 
- AC_DEFUN([_XC_PROG_CC], [
-   AC_REQUIRE([_XC_PROG_CC_PREAMBLE])dnl
--  AC_REQUIRE([XC_CHECK_USER_FLAGS])dnl
-+  AC_REQUIRE([XC_CHECK_BUILD_FLAGS])dnl
-   AC_REQUIRE([AC_PROG_INSTALL])dnl
-   AC_REQUIRE([AC_PROG_CC])dnl
-   AC_REQUIRE([AM_PROG_CC_C_O])dnl
diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index a3599aaa11..d4fe483ae6 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 6cdb97871f2930530c97deb7cf5c8fa4be5a0b02c7cea6e7c7667672a39d6852 c-ares-1.15.0.tar.gz
+sha256  de058ad7c128156e2db6dc98b8a359924d6f210a1b99dd36ba15c8f839a83a89  c-ares-1.16.0.tar.gz
 
 # Hash for license file
-sha256 db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c LICENSE.md
+sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index f9e440d9b1..e8723bf784 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.15.0
+C_ARES_VERSION = 1.16.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
-# Rebuild configure to avoid XC_CHECK_USER_CFLAGS
-C_ARES_AUTORECONF = YES
 C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = LICENSE.md
 
