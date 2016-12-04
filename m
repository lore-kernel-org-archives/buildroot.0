From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Dec 2016 13:22:05 +0100
Subject: [Buildroot] [PATCH] package/efl: use liblz4 from lz4 package
In-Reply-To: <1480854125-27023-1-git-send-email-romain.naour@gmail.com>
References: <1480854125-27023-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1480854125-27023-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Efl libraries bundle a copy of liblz4 which is also provided by
lz4 Buildroot package. Switch to liblz4 from lz4 package.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in | 1 +
 package/efl/efl.mk    | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 7ae8c05..c51fc56 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBCURL # Ecore_con_url, runtime dependency
 	# https://phab.enlightenment.org/T2728
 	select BR2_PACKAGE_LUAJIT # Lua support broken
+	select BR2_PACKAGE_LZ4
 	select BR2_PACKAGE_UTIL_LINUX
 	# libblkid is part of required tools, see EFL's README.
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index a4a5c71..5db57f6 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -20,7 +20,7 @@ EFL_LICENSE_FILES = \
 EFL_INSTALL_STAGING = YES
 
 EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
-	jpeg luajit udev util-linux zlib
+	jpeg luajit lz4 udev util-linux zlib
 
 # Configure options:
 # --disable-lua-old: build elua for the target.
@@ -28,6 +28,7 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 # --disable-sdl: disable sdl2 support.
 # --disable-spectre: disable spectre image loader.
 # --disable-xinput22: disable X11 XInput v2.2+ support.
+# --enable-liblz4: use liblz4 from lz4 package.
 # --with-doxygen: disable doxygen documentation
 EFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
@@ -43,6 +44,7 @@ EFL_CONF_OPTS = \
 	--disable-spectre \
 	--disable-xinput22 \
 	--disable-wayland \
+	--enable-liblz4 \
 	--with-doxygen=no
 
 # Disable untested configuration warning.
-- 
2.5.5
