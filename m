From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:18:37 +0200
Subject: [Buildroot] [git commit] package/mesa3d: Bump version to 10.3.0
Message-ID: <20140921192111.A44939D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34292fadc8421c6a0e3a5b722b2e2cc8249478e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- rebased mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...atform.h-not-installed-if-EGL-is-disabled.patch |   31 +++++++------------
 package/mesa3d/mesa3d.mk                           |    4 +-
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch b/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
index 53ba519..5dc9099 100644
--- a/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
+++ b/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
@@ -11,16 +11,12 @@ This patch installs this header file unconditionally.
 Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=77240
 
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- src/egl/main/Makefile.am | 3 ---
- src/mapi/Makefile.am     | 3 +++
- 2 files changed, 3 insertions(+), 3 deletions(-)
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de> (rebased for mesa3d 10.3)
 
-diff --git a/src/egl/main/Makefile.am b/src/egl/main/Makefile.am
-index 60cb600..1cd5cd2 100644
---- a/src/egl/main/Makefile.am
-+++ b/src/egl/main/Makefile.am
-@@ -126,9 +126,6 @@ pkgconfigdir = $(libdir)/pkgconfig
+diff -uNr Mesa-10.3.0-rc2.org/src/egl/main/Makefile.am Mesa-10.3.0-rc2/src/egl/main/Makefile.am
+--- Mesa-10.3.0-rc2.org/src/egl/main/Makefile.am	2014-08-29 00:00:57.000000000 +0200
++++ Mesa-10.3.0-rc2/src/egl/main/Makefile.am	2014-09-02 21:35:52.548071820 +0200
+@@ -85,9 +85,6 @@
  
  pkgconfig_DATA = egl.pc
  
@@ -30,17 +26,14 @@ index 60cb600..1cd5cd2 100644
  egldir = $(includedir)/EGL
  egl_HEADERS = \
  	$(top_srcdir)/include/EGL/eglext.h \
-diff --git a/src/mapi/Makefile.am b/src/mapi/Makefile.am
-index ef53803..2a8c555 100644
---- a/src/mapi/Makefile.am
-+++ b/src/mapi/Makefile.am
-@@ -40,3 +40,6 @@ endif
- if HAVE_OPENVG
+diff -uNr Mesa-10.3.0-rc2.org/src/mapi/Makefile.am Mesa-10.3.0-rc2/src/mapi/Makefile.am
+--- Mesa-10.3.0-rc2.org/src/mapi/Makefile.am	2014-09-01 01:22:12.000000000 +0200
++++ Mesa-10.3.0-rc2/src/mapi/Makefile.am	2014-09-02 21:36:22.891686861 +0200
+@@ -211,4 +211,7 @@
  SUBDIRS += vgapi
  endif
-+
+ 
 +khrdir = $(includedir)/KHR
 +khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
--- 
-1.9.1
-
++
+ include $(top_srcdir)/install-lib-links.mk
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f986d0e..8fc5075 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.2.7
+MESA3D_VERSION = 10.3.0
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
-MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
+MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/10.3
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
 MESA3D_AUTORECONF = YES
