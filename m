From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Oct 2015 21:59:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump to version 11.0.2
Message-ID: <1443902393-22284-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mesa3d 10.6.x is reaching end-of-life:
http://lists.freedesktop.org/archives/mesa-announce/2015-October/000178.html
"NOTE: It is anticipated that 10.6.9 will be the final release in the
10.6 series. Users of 10.6 are encouraged to migrate to the 11.0 series
in order to obtain future fixes."

Run-time testing with Kodi Isengard on an Intel GPU was positive.

Rebased 0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk                              | 2 +-
 .../0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch     | 4 ++--
 package/mesa3d/mesa3d.hash                                            | 4 ++--
 package/mesa3d/mesa3d.mk                                              | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index dc74d37..e0f8585 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 10.6.8
+MESA3D_HEADERS_VERSION = 11.0.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch b/package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
index 5dc9099..ab773f8 100644
--- a/package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
+++ b/package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
@@ -14,8 +14,8 @@ Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de> (rebased for mesa3d 10.3)
 
 diff -uNr Mesa-10.3.0-rc2.org/src/egl/main/Makefile.am Mesa-10.3.0-rc2/src/egl/main/Makefile.am
---- Mesa-10.3.0-rc2.org/src/egl/main/Makefile.am	2014-08-29 00:00:57.000000000 +0200
-+++ Mesa-10.3.0-rc2/src/egl/main/Makefile.am	2014-09-02 21:35:52.548071820 +0200
+--- Mesa-10.3.0-rc2.org/src/egl/Makefile.am	2014-08-29 00:00:57.000000000 +0200
++++ Mesa-10.3.0-rc2/src/egl/Makefile.am	2014-09-02 21:35:52.548071820 +0200
 @@ -85,9 +85,6 @@
  
  pkgconfig_DATA = egl.pc
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 0501314..2f2442a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2015-September/000175.html
-sha256	e36ee5ceeadb3966fb5ce5b4cf18322dbb76a4f075558ae49c3bba94f57d58fd	mesa-10.6.8.tar.xz
+# From http://lists.freedesktop.org/archives/mesa-announce/2015-September/000177.html
+sha256	fce11fb27eb87adf1e620a76455d635c6136dfa49ae58c53b34ef8d0c7b7eae4	mesa-11.0.2.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f7feb0f..94aa01f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 10.6.8
+MESA3D_VERSION = 11.0.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.5.3
