From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri,  2 Mar 2018 15:04:28 +0200
Subject: [Buildroot] [PATCH/next 1/1] libepoxy: bump to version 1.5.0,
 add license hash
Message-ID: <20180302130428.92132-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release of Epoxy makes "0001-Forward-EGL-cflags-into-epoxy.pc.patch"
unnecessary. Other than bugfixes and a couple of functions added to the
API, this release is backwards-compatible with programs built against
the 1.4.x releases.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../0001-Forward-EGL-cflags-into-epoxy.pc.patch    | 32 ----------------------
 package/libepoxy/libepoxy.hash                     |  7 +++--
 package/libepoxy/libepoxy.mk                       |  4 +--
 3 files changed, 7 insertions(+), 36 deletions(-)
 delete mode 100644 package/libepoxy/0001-Forward-EGL-cflags-into-epoxy.pc.patch

diff --git a/package/libepoxy/0001-Forward-EGL-cflags-into-epoxy.pc.patch b/package/libepoxy/0001-Forward-EGL-cflags-into-epoxy.pc.patch
deleted file mode 100644
index 286f875bc9..0000000000
--- a/package/libepoxy/0001-Forward-EGL-cflags-into-epoxy.pc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 99b8373dbe8fb3bac835ebad90f91cfd213e4acb Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 15 Mar 2017 10:02:54 -0300
-Subject: [PATCH] Forward EGL cflags into epoxy.pc
-
-When building mesa egl without x11 and gles2 the headers need a
-MESA_EGL_NO_X11_HEADERS define to avoid including X11 headers.
-Forward EGL CFLAGS into epoxy.pc to avoid build failures when linking
-against libepoxy on this scenario.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: pull request https://github.com/anholt/libepoxy/pull/113
-
- epoxy.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/epoxy.pc.in b/epoxy.pc.in
-index 7828a77..8278b7d 100644
---- a/epoxy.pc.in
-+++ b/epoxy.pc.in
-@@ -10,6 +10,6 @@ epoxy_has_wgl=@epoxy_has_wgl@
- Name: epoxy
- Description: epoxy GL dispatch Library
- Version: @PACKAGE_VERSION@
--Cflags: -I${includedir}
-+Cflags: -I${includedir} @EGL_CFLAGS@
- Libs: -L${libdir} -lepoxy
- Libs.private: @DLOPEN_LIBS@
--- 
-2.10.2
-
diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
index d7ebec5b5f..654d1675fd 100644
--- a/package/libepoxy/libepoxy.hash
+++ b/package/libepoxy/libepoxy.hash
@@ -1,2 +1,5 @@
-# From ftp://ftp.gnome.org/pub/GNOME/sources/libepoxy/1.4/libepoxy-1.4.3.sha256sum
-sha256 0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6  libepoxy-1.4.3.tar.xz
+# From ftp://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.0.sha256sum
+sha256 4c94995398a6ebf691600dda2e9685a0cac261414175c2adf4645cdfab42a5d5  libepoxy-1.5.0.tar.xz
+
+# Hashes for license files:
+sha256 8d5144666f9c4df9bbd69b8900086d5979259152a1060421cdcc0fb9061a1c12  COPYING
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index 366cc11367..b9498b17b4 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBEPOXY_VERSION_MAJOR = 1.4
-LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).3
+LIBEPOXY_VERSION_MAJOR = 1.5
+LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).0
 LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
 LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
-- 
2.16.2
