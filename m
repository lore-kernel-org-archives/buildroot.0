From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 26 Oct 2018 19:52:36 +0200
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.6.0
Message-ID: <20181026175236.18825-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

Rebased patch 0001-configure-add-disable-runtime-tests-option.patch.

[1] https://lists.freedesktop.org/archives/input-tools/2018-October/001488.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ure-add-disable-runtime-tests-option.patch | 25 +++++++------------
 package/libevdev/libevdev.hash                | 10 ++++----
 package/libevdev/libevdev.mk                  |  2 +-
 3 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch b/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch
index 6a829175c3..745903178c 100644
--- a/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch
+++ b/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch
@@ -1,18 +1,20 @@
-From fe965061b4306e3ca811ff86dc1ca29f7db9af18 Mon Sep 17 00:00:00 2001
+From 93f6bc2b97a2b76a5e725d63d4b6c2dfe7baf63b Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Sun, 11 Oct 2015 13:33:19 +0200
 Subject: [PATCH] configure: add '--disable-runtime-tests' option
 
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased libevdev-1.6.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- configure.ac | 15 +++++++++++----
- 1 file changed, 11 insertions(+), 4 deletions(-)
+ configure.ac | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index c1a9111..8fe7b8b 100644
+index 5161d93..2b3bb26 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -76,13 +76,20 @@ else
+@@ -76,7 +76,14 @@ else
  	AC_MSG_WARN([check not found - skipping building unit tests])
  fi
  AM_CONDITIONAL(HAVE_VALGRIND, [test "x$VALGRIND" != "x"])
@@ -27,25 +29,16 @@ index c1a9111..8fe7b8b 100644
 +AM_CONDITIONAL(ENABLE_RUNTIME_TESTS, [test "x${enable_runtime_tests}x$HAVE_CHECK" = "xyesxyes"])
  AM_CONDITIONAL(ENABLE_STATIC_LINK_TEST, [test "x$enable_static" = "xyes"])
  
- AC_ARG_ENABLE([test-run],
- 	       AS_HELP_STRING([--enable-test-run], [For internal use only]),
- 	       [run_tests="$enableval"], [run_tests="yes"])
--AM_CONDITIONAL(RUN_TESTS, [test "x$run_tests" = "xyes"])
-+AM_CONDITIONAL(RUN_TESTS, [test "x${enable_runtime_tests}x$run_tests" = "xyesxyes"])
- 
  with_cflags=""
- if test "x$GCC" = "xyes"; then
-@@ -167,8 +174,8 @@ AC_MSG_RESULT([
+@@ -162,7 +169,7 @@ AC_MSG_RESULT([
  	       Libdir				${libdir}
  
  	       Build documentation		${have_doxygen}
 -	       Enable unit-tests		${HAVE_CHECK}
--	       Run unit-tests			${run_tests}
 +	       Enable unit-tests		${HAVE_CHECK} (runtime-tests: ${enable_runtime_tests})
-+	       Run unit-tests			${run_tests} (runtime-tests: ${enable_runtime_tests})
  	       Enable profiling			${enable_gcov}
  	       Static library symbol check	${static_symbol_leaks_test}
  	       ])
 -- 
-2.11.0
+2.19.1
 
diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index e4294dcade..4a750e0ac9 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,8 +1,8 @@
-# https://lists.freedesktop.org/archives/input-tools/2018-March/001464.html
-md5  a1ca11e961c1efed720fac4130881904 libevdev-1.5.9.tar.xz
-sha1 9457e33af5c1e66e29c1385a5550fe60aef8e42e libevdev-1.5.9.tar.xz
-sha256 e1663751443bed9d3e76a4fe2caf6fa866a79705d91cacad815c04e706198a75 libevdev-1.5.9.tar.xz
-sha512 4496ab4d9dc165f416a574c21a7fcee54ae104c21ef4785a4dd0311fff428020cdbb5da7bf3f835e78dae05effdb1a557d189347f6e62dd6be2d8bcdc845850c libevdev-1.5.9.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2018-October/001488.html
+md5 154b24f01425c4c82fdc3e11f2c13af6 libevdev-1.6.0.tar.xz
+sha1 ef584a500833fe737bacb89350f93314b07f1c42 libevdev-1.6.0.tar.xz
+sha256 f5005c865987d980cc1279b9ec6131b06a89fd9892f649f2a68262b8786ef814 libevdev-1.6.0.tar.xz
+sha512 73046da447773716c9f0c9f511f3a0a6ababcf92a146eba363014afcbdb465f4c3cd8be0917f2f01561a72f24f20fe8ecd333467437d9d85c03afcb433d05060 libevdev-1.6.0.tar.xz
 
 # Hash for license files:
 sha256 f063d1279b31e73007e1c54493391818b4cb5f9162d590120397e0347b932137 COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 880d75dfbd..d8361028da 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.5.9
+LIBEVDEV_VERSION = 1.6.0
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.19.1
