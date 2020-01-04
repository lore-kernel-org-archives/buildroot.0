From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 22:00:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm/: bump version to
 3.5.13
Message-ID: <20200104210016.450228-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://cgit.freedesktop.org/xorg/lib/libXpm/commit/?id=7af7c5e275b69daedee3696bee1e880586f30373

Removed autoreconf.

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xlib_libXpm/0001-fork-check.patch   | 21 -------------------
 package/x11r7/xlib_libXpm/xlib_libXpm.hash    |  7 +++++--
 package/x11r7/xlib_libXpm/xlib_libXpm.mk      |  4 +---
 3 files changed, 6 insertions(+), 26 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXpm/0001-fork-check.patch

diff --git a/package/x11r7/xlib_libXpm/0001-fork-check.patch b/package/x11r7/xlib_libXpm/0001-fork-check.patch
deleted file mode 100644
index fb4fb7d133..0000000000
--- a/package/x11r7/xlib_libXpm/0001-fork-check.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Allow usage when fork() is not available
-
-When fork() is not available, we need to define NO_ZPIPE so that
-libXpm doesn't try to fork/exec to use a pipe to uncompress compressed
-.xpm files. There is obviously a loss of functionality, but loading
-uncompressed .xpm files should continue to work.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -22,6 +22,7 @@
- 
- # Checks for library functions
- AC_CHECK_FUNCS([strlcat])
-+AC_CHECK_FUNC([fork],[], AC_DEFINE(NO_ZPIPE))
- 
- # Obtain compiler/linker options for dependencies
- PKG_CHECK_MODULES(XPM, xproto x11)
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index d7389128ff..c3aa695c56 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,5 +1,8 @@
-# From https://lists.x.org/archives/xorg-announce/2016-December/002752.html
-sha256 fd6a6de3da48de8d1bb738ab6be4ad67f7cb0986c39bd3f7d51dd24f7854bdec  libXpm-3.5.12.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-December/003034.html
+md5 6f0ecf8d103d528cfc803aa475137afa  libXpm-3.5.13.tar.bz2
+sha1 38b1a2728adb49f4e255aba1530f51789815ffc4  libXpm-3.5.13.tar.bz2
+sha256 9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25  libXpm-3.5.13.tar.bz2
+sha512 3b8f6e926272f39b1d95135c2274c00f5aaee1f9fb2ef79f71628df5edeb7ba20158819ef6a778101cc4092493a3b5b613c53634fdccadcc0fc85f0605e5e9a5  libXpm-3.5.13.tar.bz2
 # Locally calculated
 sha256 ed3b06bb3b75a0954bd6837a96b41a4676f60dfeee647271613aadecc0fd596e COPYING
 sha256 cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71 COPYRIGHT
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 0c7f69e16e..455fb10bf2 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.12
+XLIB_LIBXPM_VERSION = 3.5.13
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
 XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
 XLIB_LIBXPM_LICENSE_FILES = COPYING COPYRIGHT
 XLIB_LIBXPM_INSTALL_STAGING = YES
-# we patch configure.ac
-XLIB_LIBXPM_AUTORECONF = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xorgproto \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(TARGET_NLS_DEPENDENCIES)
-- 
2.20.1
