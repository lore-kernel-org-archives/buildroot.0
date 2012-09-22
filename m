From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:56 +0200
Subject: [Buildroot] [git commit] xapp_xauth: bump version
Message-ID: <20120922194201.4A5349963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d97fe429f22b27200b8e16f5de85b785d1f4678e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch    |   11 -----------
 package/x11r7/xapp_xauth/xapp_xauth.mk             |    2 +-
 2 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch b/package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch
deleted file mode 100644
index 61c6b14..0000000
--- a/package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- xauth-1.0.3/configure.ac.orig	2007-06-06 22:33:44.000000000 +0200
-+++ xauth-1.0.3/configure.ac	2007-06-06 22:33:57.000000000 +0200
-@@ -40,7 +40,7 @@
- AC_CHECK_HEADERS([net/errno.h])
- 
- # Checks for pkg-config packages
--PKG_CHECK_MODULES(XAUTH, x11 xau xext xmuu)
-+PKG_CHECK_MODULES(XAUTH, x11 xau xext xmuu xcb)
- AC_SUBST(XAUTH_CFLAGS)
- AC_SUBST(XAUTH_LIBS)
- 
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index 0444c93..d075c05 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XAUTH_VERSION = 1.0.4
+XAPP_XAUTH_VERSION = 1.0.5
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
