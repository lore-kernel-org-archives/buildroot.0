From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Apr 2017 16:20:57 +0200
Subject: [Buildroot] [PATCH 1/1] libmaxminddb: improve --disable-tests patch
Message-ID: <1491142857-28485-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following review of libmaxminddb patch by Thomas Petazzoni, here is an
enhanced version of the --disable-tests patch which has been sent
upstream.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Add-disable-tests-to-configure.patch      | 26 +++++++++-------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/package/libmaxminddb/0001-Add-disable-tests-to-configure.patch b/package/libmaxminddb/0001-Add-disable-tests-to-configure.patch
index 1ae5acc..8ff64e9 100644
--- a/package/libmaxminddb/0001-Add-disable-tests-to-configure.patch
+++ b/package/libmaxminddb/0001-Add-disable-tests-to-configure.patch
@@ -1,13 +1,13 @@
-From b12ca226c111730e2ef5d8a3d929dbd943fbe763 Mon Sep 17 00:00:00 2001
+From 8287848f747bd37298a2d32b8fd06cc59eb28028 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Thu, 9 Feb 2017 21:40:43 +0100
 Subject: [PATCH] Add --disable-tests to configure
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
- Makefile.am  |  6 +++++-
- configure.ac | 10 ++++++++++
- 2 files changed, 15 insertions(+), 1 deletion(-)
+ Makefile.am  | 6 +++++-
+ configure.ac | 6 ++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
 index 1804945..cebcd31 100644
@@ -28,22 +28,18 @@ index 1804945..cebcd31 100644
  EXTRA_DIST = doc t Changes.md LICENSE NOTICE README.md projects/VS12 projects/VS12-tests
  dist-hook:
 diff --git a/configure.ac b/configure.ac
-index 7916212..fc53ffd 100644
+index 7916212..2a22fab 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -119,6 +119,16 @@ AC_ARG_ENABLE(
+@@ -119,6 +119,12 @@ AC_ARG_ENABLE(
          esac],[debug=false])
  AM_CONDITIONAL([DEBUG], [test x$debug = xtrue])
  
-+AC_ARG_ENABLE(
-+        [tests],
-+        [  --enable-tests    Compilation of tests code],
-+        [case "${enableval}" in
-+          yes) tests=true ;;
-+          no)  tests=false ;;
-+          *) AC_MSG_ERROR([bad value ${enableval} for --enable-tests]) ;;
-+        esac],[tests=false])
-+AM_CONDITIONAL([TESTS], [test x$tests = xtrue])
++AC_ARG_ENABLE([tests],
++        AS_HELP_STRING([--enable-tests], [Compilation of tests code]),
++        [enable_tests=${enableval}],
++        [enable_tests=yes])
++AM_CONDITIONAL([TESTS], [test "${enable_tests}" = "yes"])
 +
  AC_CONFIG_FILES([Makefile
                   src/Makefile
-- 
2.5.0
