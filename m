From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Dec 2016 09:28:51 +0100
Subject: [Buildroot] [git commit] libevdev: bump version to 1.5.5
Message-ID: <20161202083538.F27F781D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=160f83db022a913679340cd029775ca87ee56d08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And update 0001-configure-add-disable-runtime-tests-option.patch.

For details see [1].

[1] https://lists.freedesktop.org/archives/input-tools/2016-November/001375.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onfigure-add-disable-runtime-tests-option.patch | 23 +++++++++++++++-------
 package/libevdev/libevdev.hash                     |  4 ++--
 package/libevdev/libevdev.mk                       |  2 +-
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch b/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch
index 405dff0..6a82917 100644
--- a/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch
+++ b/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch
@@ -1,18 +1,18 @@
-From 95527e43845a5063a6125d7779a30d44c3b437ac Mon Sep 17 00:00:00 2001
+From fe965061b4306e3ca811ff86dc1ca29f7db9af18 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Sun, 11 Oct 2015 13:33:19 +0200
 Subject: [PATCH] configure: add '--disable-runtime-tests' option
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- configure.ac | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
+ configure.ac | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 54a2510..286737b 100644
+index c1a9111..8fe7b8b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -74,7 +74,14 @@ else
+@@ -76,13 +76,20 @@ else
  	AC_MSG_WARN([check not found - skipping building unit tests])
  fi
  AM_CONDITIONAL(HAVE_VALGRIND, [test "x$VALGRIND" != "x"])
@@ -27,16 +27,25 @@ index 54a2510..286737b 100644
 +AM_CONDITIONAL(ENABLE_RUNTIME_TESTS, [test "x${enable_runtime_tests}x$HAVE_CHECK" = "xyesxyes"])
  AM_CONDITIONAL(ENABLE_STATIC_LINK_TEST, [test "x$enable_static" = "xyes"])
  
+ AC_ARG_ENABLE([test-run],
+ 	       AS_HELP_STRING([--enable-test-run], [For internal use only]),
+ 	       [run_tests="$enableval"], [run_tests="yes"])
+-AM_CONDITIONAL(RUN_TESTS, [test "x$run_tests" = "xyes"])
++AM_CONDITIONAL(RUN_TESTS, [test "x${enable_runtime_tests}x$run_tests" = "xyesxyes"])
+ 
  with_cflags=""
-@@ -159,7 +166,7 @@ AC_MSG_RESULT([
+ if test "x$GCC" = "xyes"; then
+@@ -167,8 +174,8 @@ AC_MSG_RESULT([
  	       Libdir				${libdir}
  
  	       Build documentation		${have_doxygen}
 -	       Enable unit-tests		${HAVE_CHECK}
+-	       Run unit-tests			${run_tests}
 +	       Enable unit-tests		${HAVE_CHECK} (runtime-tests: ${enable_runtime_tests})
++	       Run unit-tests			${run_tests} (runtime-tests: ${enable_runtime_tests})
  	       Enable profiling			${enable_gcov}
  	       Static library symbol check	${static_symbol_leaks_test}
  	       ])
 -- 
-2.1.4
+2.11.0
 
diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index a2a5cd8..1dbdfdb 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from https://lists.freedesktop.org/archives/input-tools/2016-August/001327.html
-sha256 11fe76d62cc76fbc9dbf8e94696a80eee63780139161e5cf54c55ec21a8173a4 libevdev-1.5.4.tar.xz
+# Hash from https://lists.freedesktop.org/archives/input-tools/2016-November/001375.html
+sha256 320120782018b992956b3fa29495c323832860807ac8ea74537e636a0e0280b1 libevdev-1.5.5.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index ef660c7..fca362f 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.5.4
+LIBEVDEV_VERSION = 1.5.5
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
