From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXt to 1.0.7
Message-ID: <20100308133656.5A669776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=637763f309b74d2b88a3bf692ee41f0d652fc355
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXt/Config.in                 |    2 +-
 .../xlib_libXt-1.0.6-cross-compile-fix.patch       |   28 --------------------
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXt/xlib_libXt-1.0.6-cross-compile-fix.patch

diff --git a/package/x11r7/xlib_libXt/Config.in b/package/x11r7/xlib_libXt/Config.in
index f2d2161..0656aab 100644
--- a/package/x11r7/xlib_libXt/Config.in
+++ b/package/x11r7/xlib_libXt/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XCB_PROTO
 	select BR2_PACKAGE_LIBXCB
 	help
-	  libXt 1.0.4
+	  libXt 1.0.7
 	  X.Org Xt library
diff --git a/package/x11r7/xlib_libXt/xlib_libXt-1.0.6-cross-compile-fix.patch b/package/x11r7/xlib_libXt/xlib_libXt-1.0.6-cross-compile-fix.patch
deleted file mode 100644
index f02edcb..0000000
--- a/package/x11r7/xlib_libXt/xlib_libXt-1.0.6-cross-compile-fix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-diff --git a/configure.ac b/configure.ac
-index 043ab5f..cb00a41 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -48,6 +48,10 @@ if test x"$CC_FOR_BUILD" = x; then
- 	fi
- fi
- AC_SUBST([CC_FOR_BUILD])
-+CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
-+AC_SUBST(CFLAGS_FOR_BUILD)
-+LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
-+AC_SUBST(LDFLAGS_FOR_BUILD)
- 
- PKG_CHECK_MODULES(XT, sm x11 xproto kbproto)
- 
-diff --git a/util/Makefile.am b/util/Makefile.am
-index 0d3ff01..37b78d2 100644
---- a/util/Makefile.am
-+++ b/util/Makefile.am
-@@ -5,6 +5,8 @@ noinst_PROGRAMS = makestrs
- endif
- 
- CC = @CC_FOR_BUILD@
-+CFLAGS = @CFLAGS_FOR_BUILD@
-+LDFLAGS = @LDFLAGS_FOR_BUILD@
- 
- EXTRA_DIST = \
- 	Shell.ht \
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 2fcf889..e3e43e4 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.0.6
+XLIB_LIBXT_VERSION = 1.0.7
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_AUTORECONF = YES
-- 
1.6.3.3
