From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Sep 2012 11:48:51 -0300
Subject: [Buildroot] [PATCH 04/10] mpc: bump to version 1.0.1 and license
	change
In-Reply-To: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1347029337-12494-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpc/mpc-0.9-configure.patch |   69 -----------------------------------
 package/mpc/mpc.mk                  |    8 ++--
 2 files changed, 4 insertions(+), 73 deletions(-)
 delete mode 100644 package/mpc/mpc-0.9-configure.patch

diff --git a/package/mpc/mpc-0.9-configure.patch b/package/mpc/mpc-0.9-configure.patch
deleted file mode 100644
index 21dd242..0000000
--- a/package/mpc/mpc-0.9-configure.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-
-Issue http://lists.gforge.inria.fr/pipermail/mpc-discuss/2011-February/000805.html
-Upstream patch https://gforge.inria.fr/scm/viewvc.php/trunk/configure.ac?root=mpc&r1=932&r2=936
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- trunk/configure.ac	2011/02/21 12:18:31	932
-+++ trunk/configure.ac	2011/02/21 16:41:09	936
-@@ -33,7 +33,7 @@
- AC_CANONICAL_HOST
- AC_CONFIG_MACRO_DIR([m4])
- 
--dnl Extra arguments to configure
-+# Extra arguments to configure
- AC_ARG_WITH([mpfr_include],
-             [AC_HELP_STRING([--with-mpfr-include=DIR],
-                             [MPFR include directory])],
-@@ -85,18 +85,19 @@
-              )
- 
- 
--dnl Setup CC and CFLAGS
-+# Setup CC and CFLAGS
-+AC_PROG_CC
-+AC_LANG(C)
- 
--dnl Check for user specification of CC or CFLAGS
-+# Set up LibTool
-+AC_PROG_LIBTOOL
-+
-+# Check for user specification of CC or CFLAGS
- if test -n "$CFLAGS" || test -n "$CC" ; then
-    user_redefine_cc=yes
- fi
- 
--# Check for programs
--AC_PROG_CC
--AC_LANG(C)
--
--dnl Check GMP Header
-+# Check GMP Header
- AC_MSG_CHECKING(for gmp.h)
- AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
- #include "gmp.h"
-@@ -105,22 +106,19 @@
-  AC_MSG_ERROR([gmp.h can't be found, or is unusable.])
- ])
- 
--dnl Check for GMP CFLAGS in gmp.h
-+# Check for GMP CFLAGS in gmp.h
- if test -z "$user_redefine_cc" ; then
-    MPC_GMP_CC_CFLAGS
- fi
- 
- 
--dnl Configs for Windows DLLs
-+# Configs for Windows DLLs
- case $host in
-   *-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2*)
-      MPC_WINDOWS
- esac
- 
- 
--dnl Finally set up LibTool
--AC_PROG_LIBTOOL
--
- # Checks for header files.
- AC_HEADER_STDC
- AC_CHECK_HEADERS([complex.h locale.h inttypes.h stdint.h limits.h unistd.h sys/time.h])
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 47bdbbb..a366db7 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-MPC_VERSION = 0.9
-MPC_SITE = http://www.multiprecision.org/mpc/download
-MPC_LICENSE = LGPLv2.1+
-MPC_LICENSE_FILES = COPYING.LIB
+MPC_VERSION = 1.0.1
+MPC_SITE = $(BR2_GNU_MIRROR)/mpc
+MPC_LICENSE = LGPLv3+
+MPC_LICENSE_FILES = COPYING.LESSER
 MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
 MPC_AUTORECONF = YES
-- 
1.7.8.6
