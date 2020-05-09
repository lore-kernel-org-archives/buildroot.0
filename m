From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 23:33:46 +0200
Subject: [Buildroot] [git commit branch/next] package/at-spi2-core: bump to
 version 2.36.0
Message-ID: <20200509211851.58A03912AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cc1eedae22da67d65d1c4321d61a4456bd5d4f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patch (already in version)
- Add upstream link on sha256
- License is LGPL-2.1+ since
  https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/1256988c433cf8b9e0780c13d66374cb057f7329
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-meson.build-for-meson-0.50.0.patch    | 35 ----------------------
 package/at-spi2-core/at-spi2-core.hash             |  6 ++--
 package/at-spi2-core/at-spi2-core.mk               |  4 +--
 3 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/package/at-spi2-core/0001-Fix-meson.build-for-meson-0.50.0.patch b/package/at-spi2-core/0001-Fix-meson.build-for-meson-0.50.0.patch
deleted file mode 100644
index 154d7010d3..0000000000
--- a/package/at-spi2-core/0001-Fix-meson.build-for-meson-0.50.0.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3b154996a27ede1c94cbc590e2db3858389d18c2 Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Tue, 12 Mar 2019 11:46:24 +0100
-Subject: [PATCH] Fix meson.build for meson 0.50.0.
-
-Since meson 0.50.0 it is not possible anymore to specify an
-absolute directory for subdir. To keep current functionality,
-use install_dir instead.
-
-atspi/meson.build:60:0: ERROR: Subdir keyword must not be an absolute path.
-
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-
-Upstream: https://github.com/GNOME/at-spi2-core/commit/44a812ea51223d82f21a098a2d45fcc5c329ce7a.patch
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- atspi/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/atspi/meson.build b/atspi/meson.build
-index 17bfc45..2e44ffd 100644
---- a/atspi/meson.build
-+++ b/atspi/meson.build
-@@ -57,7 +57,7 @@ atspi_headers = [
-
- atspi_includedir = join_paths(get_option('prefix'), get_option('includedir'), 'at-spi-2.0', 'atspi')
-
--install_headers(atspi_headers, subdir: atspi_includedir)
-+install_headers(atspi_headers, install_dir: atspi_includedir)
-
- atspi_enums = gnome.mkenums('atspi-enum-types',
-                             sources: [ 'atspi-constants.h', 'atspi-types.h' ],
---
-2.21.0
-
diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 9c96da312b..e2cc403e71 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,3 +1,5 @@
+# From http://ftp.acc.umu.se/pub/gnome/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
+sha256  88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a  at-spi2-core-2.36.0.tar.xz
+
 # locally calculated
-sha256 42a2487ab11ce43c288e73b2668ef8b1ab40a0e2b4f94e80fca04ad27b6f1c87  at-spi2-core-2.28.0.tar.xz
-sha256 c6105b34ab6829ff5c70eba234f40053215fa9f8383ced271b0e370a1923624b  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index 3a5197eb03..cf7fdd297c 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.28
+AT_SPI2_CORE_VERSION_MAJOR = 2.36
 AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
-AT_SPI2_CORE_LICENSE = LGPL-2.0+
+AT_SPI2_CORE_LICENSE = LGPL-2.1+
 AT_SPI2_CORE_LICENSE_FILES = COPYING
 AT_SPI2_CORE_INSTALL_STAGING = YES
 AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst \
