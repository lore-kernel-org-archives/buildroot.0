From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 22 Sep 2020 00:37:45 +0300
Subject: [Buildroot] [PATCH v2 1/4] package/wpebackend-fdo: bump to version
 1.8.0
In-Reply-To: <20200921213748.1846851-1-aperez@igalia.com>
References: <20200921213748.1846851-1-aperez@igalia.com>
Message-ID: <20200921213748.1846851-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new version adds a few new features, and now uses libepoxy for
OpenGL code, so add that as a dependency. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.8.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v1 -> v2:
  - Dropped unneeded dependencies, BR2_PACKAGE_HAS_LIBEGL_WAYLAND
    already implies that an EGL+GLES stack is available, which is
    what wpebackend-fdo needs.
---
 package/wpebackend-fdo/Config.in           | 1 +
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index 161e4c9a7e..8a8c820c9b 100644
--- a/package/wpebackend-fdo/Config.in
+++ b/package/wpebackend-fdo/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBWPE
 	select BR2_PACKAGE_WAYLAND
diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 0b821f3443..2f8321833c 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.6.1.tar.xz.sums
-md5  ea6c2a13e6c2423f2c2b0b31fcf9567b  wpebackend-fdo-1.6.1.tar.xz
-sha1  53e38189324d9c0c87f40164d8349a827663aabd  wpebackend-fdo-1.6.1.tar.xz
-sha256  740eee3327acfb462b8460519a219e30dc0a870326e88e2ddc4fe2c8de20b1c9  wpebackend-fdo-1.6.1.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.8.0.tar.xz.sums
+md5  6df96f80ff34c02d56f32a7a153a62c0  wpebackend-fdo-1.8.0.tar.xz
+sha1  48dd8d5d525e0c89b8b7068fe51c439921804240  wpebackend-fdo-1.8.0.tar.xz
+sha256  9652a99c75fe1c6eab0585b6395f4e104b2427e4d1f42969f1f77df29920d253  wpebackend-fdo-1.8.0.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 5bc2d3ed37..e0331e7bd3 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.6.1
+WPEBACKEND_FDO_VERSION = 1.8.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
 WPEBACKEND_FDO_LICENSE = BSD-2-Clause
 WPEBACKEND_FDO_LICENSE_FILES = COPYING
-WPEBACKEND_FDO_DEPENDENCIES = libglib2 libwpe wayland
+WPEBACKEND_FDO_DEPENDENCIES = libepoxy libglib2 libwpe wayland
 
 $(eval $(cmake-package))
-- 
2.28.0
