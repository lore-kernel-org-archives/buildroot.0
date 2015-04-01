From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 20:04:16 +0200
Subject: [Buildroot] [git commit] cairo: bump to version 1.14.2
Message-ID: <20150401181230.F268B7FE18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa2aca8831dea3fcf0deceb5060a074b0b18255b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file and remove upstream patches.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/0002-openvg-build-fix.patch   |   28 ---------------------------
 package/cairo/0004-fix-nofork-any2ppm.patch |   23 ----------------------
 package/cairo/cairo.hash                    |    2 +
 package/cairo/cairo.mk                      |    2 +-
 4 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/package/cairo/0002-openvg-build-fix.patch b/package/cairo/0002-openvg-build-fix.patch
deleted file mode 100644
index 6614934..0000000
--- a/package/cairo/0002-openvg-build-fix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix build of OpenVG backend on platforms without X11
-
-https://bugs.freedesktop.org/show_bug.cgi?id=72911
-
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
-
-Index: b/boilerplate/cairo-boilerplate-vg.c
-===================================================================
---- a/boilerplate/cairo-boilerplate-vg.c
-+++ b/boilerplate/cairo-boilerplate-vg.c
-@@ -215,7 +215,7 @@ _cairo_boilerplate_vg_create_surface_egl (const char		    *name,
- 	EGL_ALPHA_SIZE, 8,
- 	EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
- 	EGL_RENDERABLE_TYPE, EGL_OPENVG_BIT,
--	None
-+	EGL_NONE
-     };
-     int rgb_attribs[] = {
- 	EGL_RED_SIZE, 8,
-@@ -225,7 +225,7 @@ _cairo_boilerplate_vg_create_surface_egl (const char		    *name,
- 	EGL_VG_ALPHA_FORMAT, EGL_VG_ALPHA_FORMAT_PRE_BIT,
- 	EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
- 	EGL_RENDERABLE_TYPE, EGL_OPENVG_BIT,
--	None
-+	EGL_NONE
-     };
-     int dummy_attribs[] = {
- 	EGL_WIDTH, 8, EGL_HEIGHT, 8,
diff --git a/package/cairo/0004-fix-nofork-any2ppm.patch b/package/cairo/0004-fix-nofork-any2ppm.patch
deleted file mode 100644
index 16cc2e0..0000000
--- a/package/cairo/0004-fix-nofork-any2ppm.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-test: fix build of any2ppm if fork is not available.
-
-The test program any2ppm can run as daemon. This feature can be disabled at
-compile time, if the required headers are not present. However the support for
-fork() is not checked.
-
-This patch fixes this issue.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-
-Index: cairo-1.12.10/test/any2ppm.c
-===================================================================
---- cairo-1.12.10.orig/test/any2ppm.c	2012-04-19 14:17:34.000000000 +0200
-+++ cairo-1.12.10/test/any2ppm.c	2014-04-25 11:13:30.000000000 +0200
-@@ -79,7 +79,7 @@
- 
- #include <errno.h>
- 
--#if HAVE_UNISTD_H && HAVE_FCNTL_H && HAVE_SIGNAL_H && HAVE_SYS_STAT_H && HAVE_SYS_SOCKET_H && HAVE_SYS_POLL_H && HAVE_SYS_UN_H
-+#if HAVE_UNISTD_H && HAVE_FCNTL_H && HAVE_SIGNAL_H && HAVE_SYS_STAT_H && HAVE_SYS_SOCKET_H && HAVE_SYS_POLL_H && HAVE_SYS_UN_H && HAVE_FORK
- #include <fcntl.h>
- #include <signal.h>
- #include <sys/stat.h>
diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
new file mode 100644
index 0000000..79b2ec6
--- /dev/null
+++ b/package/cairo/cairo.hash
@@ -0,0 +1,2 @@
+# From http://cairographics.org/releases/cairo-1.14.2.tar.xz.sha1
+sha1	c8da68aa66ca0855b5d0ff552766d3e8679e1d24	cairo-1.14.2.tar.xz
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 37adc82..2c55338 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.12.12
+CAIRO_VERSION = 1.14.2
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPLv2.1+
 CAIRO_LICENSE_FILES = COPYING
