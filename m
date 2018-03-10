From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 08:45:50 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libxshmfence: bump
 version to 1.3
Message-ID: <20180310074850.44F3D800EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2524acd4179fccc627a72ff188bf51c95fed9867
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream, added all upstream hashes and license
hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onfigure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch | 31 ----------------------
 .../x11r7/xlib_libxshmfence/xlib_libxshmfence.hash |  9 +++++--
 .../x11r7/xlib_libxshmfence/xlib_libxshmfence.mk   |  2 +-
 3 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/package/x11r7/xlib_libxshmfence/0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch b/package/x11r7/xlib_libxshmfence/0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch
deleted file mode 100644
index 1ca1303267..0000000000
--- a/package/x11r7/xlib_libxshmfence/0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0b550a4e7acf02d3478602848f6afbfcbfb0d4b2 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 29 Jan 2018 16:24:36 +0000
-Subject: [PATCH] configure.ac: call AC_USE_SYSTEM_EXTENSIONS
-
-With glibc 2.27 memfd_create() is inside a _GNU_SOURCE guard, so call
-AC_USE_SYSTEM_EXTENSIONS to get this defined.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Upstream: https://cgit.freedesktop.org/xorg/lib/libxshmfence/commit/?id=0b550a4e7acf02d3478602848f6afbfcbfb0d4b2
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 55772d0..ed77e6d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,6 +28,8 @@ AC_INIT([libxshmfence], [1.2],
- AC_CONFIG_SRCDIR([Makefile.am])
- AC_CONFIG_HEADERS([config.h])
- 
-+AC_USE_SYSTEM_EXTENSIONS
-+
- # Initialize Automake
- AM_INIT_AUTOMAKE([foreign dist-bzip2])
- 
--- 
-2.14.3
-
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
index 05eb07111b..afdffb827f 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-January/002515.html
-sha256	d21b2d1fd78c1efbe1f2c16dae1cb23f8fd231dcf891465b8debe636a9054b0c	libxshmfence-1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-February/002840.html
+md5 42dda8016943dc12aff2c03a036e0937  libxshmfence-1.3.tar.bz2
+sha1 3472218fc0e8ee8183533d22dbcd4bbe90bf3ab8  libxshmfence-1.3.tar.bz2
+sha256 b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7  libxshmfence-1.3.tar.bz2
+sha512 c446e055f8fac62b9aa266132289a4cfc030282147974c45ce96d1768a98d1afb997470e58e4a68513174c404cbf373bdde2f0cd4b34abdbce1d89dd0b6fe2b7  libxshmfence-1.3.tar.bz2
+# Locally computed
+sha256 64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index 9686c408c1..f51cf0d5cb 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXSHMFENCE_VERSION = 1.2
+XLIB_LIBXSHMFENCE_VERSION = 1.3
 XLIB_LIBXSHMFENCE_SOURCE = libxshmfence-$(XLIB_LIBXSHMFENCE_VERSION).tar.bz2
 XLIB_LIBXSHMFENCE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSHMFENCE_LICENSE = MIT
