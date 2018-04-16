From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 16 Apr 2018 19:58:30 +0300
Subject: [Buildroot] [PATCH] package/wayland: Bump version to 1.15.0
Message-ID: <20180416165830.43193-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All hashes provided by upstream.

Updated Yann's patch:
 - Took v2 from https://patchwork.freedesktop.org/patch/143038/
 - Rebased on top of v1.15

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...002-configure-add-option-to-disable-tests.patch | 39 ++++++++++++----------
 package/wayland/wayland.hash                       | 10 +++---
 package/wayland/wayland.mk                         |  2 +-
 3 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/package/wayland/0002-configure-add-option-to-disable-tests.patch b/package/wayland/0002-configure-add-option-to-disable-tests.patch
index 8c67d9a3bc..c6e4a49681 100644
--- a/package/wayland/0002-configure-add-option-to-disable-tests.patch
+++ b/package/wayland/0002-configure-add-option-to-disable-tests.patch
@@ -1,6 +1,6 @@
-From 33b025e04bf3fa94b74ea3325b3fd7c3f546bcb1 Mon Sep 17 00:00:00 2001
+From 55ae8e1103f4697bfa01a84301a6560b89de5248 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 5 Mar 2017 10:06:02 +0100
+Date: Mon, 16 Apr 2018 19:52:34 +0300
 Subject: [PATCH] configure: add option to disable tests
 
 When building for a product, tests are not needed.
@@ -11,40 +11,45 @@ available.
 So, add an option to configure to disable building tests altogether.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>
+Tested-by: Eric Engestrom <eric.engestrom@imgtec.com>
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+
 ---
-Patch submitted upstream:
-https://lists.freedesktop.org/archives/wayland-devel/2017-March/033359.html
+Changes v1 -> v2:
+  - fix typo in yes-check  (Eric)
 ---
- Makefile.am  | 3 ++-
+ Makefile.am  | 2 ++
  configure.ac | 8 ++++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
+ 2 files changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index d0c8bd3..9c2541d 100644
+index 741db5ebf9d9..4862d42959f0 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -143,7 +143,7 @@ libwayland_cursor_la_CFLAGS =			\
- 	-I$(top_srcdir)/src			\
- 	-DICONDIR=\"$(ICONDIR)\"
+@@ -160,6 +160,7 @@ pkgconfig_DATA += egl/wayland-egl.pc
+ include_HEADERS += egl/wayland-egl-backend.h
+ pkgconfig_DATA += egl/wayland-egl-backend.pc
  
--
 +if ENABLE_TESTS
  built_test_programs =				\
  	array-test				\
  	client-test				\
-@@ -258,6 +258,7 @@ os_wrappers_test_LDADD = libtest-runner.la
+@@ -287,6 +288,7 @@ os_wrappers_test_LDADD = libtest-runner.la
  
  exec_fd_leak_checker_SOURCES = tests/exec-fd-leak-checker.c
  exec_fd_leak_checker_LDADD = libtest-runner.la
 +endif
  
  EXTRA_DIST += tests/scanner-test.sh			\
- 	tests/data/example.xml				\
+ 	protocol/tests.xml				\
 diff --git a/configure.ac b/configure.ac
-index b583bef..96a5575 100644
+index c74ee97b24a2..5c94b7b76b06 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -87,10 +87,18 @@ AC_ARG_ENABLE([dtd-validation],
+@@ -89,10 +89,18 @@ AC_ARG_ENABLE([dtd-validation],
  	      [],
  	      [enable_dtd_validation=yes])
  
@@ -58,11 +63,11 @@ index b583bef..96a5575 100644
  
  AM_CONDITIONAL(ENABLE_LIBRARIES, test "x$enable_libraries" = xyes)
  
-+AM_CONDITIONAL(ENABLE_TESTS, test "x$enable_tests" = "yes")
++AM_CONDITIONAL(ENABLE_TESTS, test "x$enable_tests" = xyes)
 +
  AC_ARG_WITH(icondir, [  --with-icondir=<dir>    Look for cursor icons here],
  		     [  ICONDIR=$withval],
  		     [  ICONDIR=${datadir}/icons])
 -- 
-2.7.4
+2.14.3
 
diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index c46aca2bda..4fa83a4247 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-August/034748.html
-md5  0235f6075c32c3be61cff94fa0b9f108  wayland-1.14.0.tar.xz
-sha1 53a443be3bafe73209bbc49ef2cb134ed16e0141  wayland-1.14.0.tar.xz
-sha256 ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8  wayland-1.14.0.tar.xz
-sha512 bd38b2b8963d4d98d42c270e5d7dbff6323789a173b19b67a18258424fd8adee5021b282c9d7f6dad0bd25aa0160e76aecd8ed803d4eb25d911ef0a81cd713a5  wayland-1.14.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2018-April/037767.html
+md5  b7393c17fdce9a8d383edab656c92fd2  wayland-1.15.0.tar.xz
+sha1 374e07b4f3b7fdfa7c4206cdd48224ea00d69d68  wayland-1.15.0.tar.xz
+sha256 eb3fbebb8559d56a80ad3753ec3db800f587329067962dbf65e14488b4b7aeb0  wayland-1.15.0.tar.xz
+sha512 f908917f1b575d2dc4d9770d3303e2637e8744fcb5c81feb2af2fe82cc51f54e22beaddfbe775fcf9623584169b7a062c75076132abeb888717180bfab53b3a8  wayland-1.15.0.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 10710a8111..827924e402 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.14.0
+WAYLAND_VERSION = 1.15.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
2.16.2
