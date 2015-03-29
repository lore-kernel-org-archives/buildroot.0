From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 15:25:43 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 1.5.1
Message-ID: <20150329132636.1A15880797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bce454f32f3d551dcb45c5140bfaded7885c95a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0002-wayland.patch, patch is not necessary anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/0002-wayland.patch |   26 --------------------------
 package/libva/libva.hash         |    4 ++--
 package/libva/libva.mk           |    2 +-
 3 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/package/libva/0002-wayland.patch b/package/libva/0002-wayland.patch
deleted file mode 100644
index e309096..0000000
--- a/package/libva/0002-wayland.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fixes compile error in libva-intel-driver
-
-make[4]: Entering directory `/home/br/br/output/build/libva-intel-driver-1.3.2/src'
-  CC       i965_drv_video_la-i965_output_wayland.lo
-i965_output_wayland.c:31:41: fatal error: wayland-drm-client-protocol.h: No such file or directory
-compilation terminated.
-
-Patch sent upstream:
-http://lists.freedesktop.org/archives/libva/2014-July/002519.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libva-1.3.1.org/va/wayland/Makefile.am libva-1.3.1/va/wayland/Makefile.am
---- libva-1.3.1.org/va/wayland/Makefile.am	2014-05-09 06:28:15.000000000 +0200
-+++ libva-1.3.1/va/wayland/Makefile.am	2014-07-19 11:46:01.126931242 +0200
-@@ -54,8 +54,8 @@
- 
- noinst_LTLIBRARIES		= libva_wayland.la
- libva_waylandincludedir		= ${includedir}/va
--libva_waylandinclude_HEADERS	= $(source_h)
--libva_wayland_la_SOURCES	= $(source_c) $(protocol_source_h)
-+libva_waylandinclude_HEADERS	= $(source_h) $(protocol_source_h)
-+libva_wayland_la_SOURCES	= $(source_c)
- noinst_HEADERS			= $(source_h_priv)
- 
- # Wayland protocol
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index ec87e26..eaec0af 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# http://lists.freedesktop.org/archives/libva/2014-December/002981.html
-sha1	f83cc0d1dd42701ec79d943d9462f092d32c51fa	libva-1.5.0.tar.bz2
+# From http://lists.freedesktop.org/archives/libva/2015-March/003249.html
+sha1	b315a86fcd3bd1e073e2c1b62416550885cd7420	libva-1.5.1.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 176c498..d3b58ae 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.5.0
+LIBVA_VERSION = 1.5.1
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
