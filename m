From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 28 Oct 2019 10:26:56 -0700
Subject: [Buildroot] [PATCH 1/3] package/at-spi2-core: bump to version 2.34.0
Message-ID: <20191028172658.923021-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 ...001-Fix-meson.build-for-meson-0.50.0.patch | 35 -------------------
 package/at-spi2-core/at-spi2-core.hash        |  2 +-
 package/at-spi2-core/at-spi2-core.mk          |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/at-spi2-core/0001-Fix-meson.build-for-meson-0.50.0.patch

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
index 9c96da312b..2ccbe27aba 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 42a2487ab11ce43c288e73b2668ef8b1ab40a0e2b4f94e80fca04ad27b6f1c87  at-spi2-core-2.28.0.tar.xz
+sha256 d629cdbd674e539f8912028512af583990938c7b49e25184c126b00121ef11c6  at-spi2-core-2.34.0.tar.xz
 sha256 c6105b34ab6829ff5c70eba234f40053215fa9f8383ced271b0e370a1923624b  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index 3a5197eb03..38426fef59 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.28
+AT_SPI2_CORE_VERSION_MAJOR = 2.34
 AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
-- 
2.23.0
