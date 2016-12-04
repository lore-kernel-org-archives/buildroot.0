From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:32:29 +0100
Subject: [Buildroot] [git commit] package/efl: use liblz4 from lz4 package
Message-ID: <20161204143233.C638681841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e723eaf564d61064d888b52c4283f6dd456bc765
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Efl libraries bundle a copy of liblz4 which is also provided by
lz4 Buildroot package. Switch to liblz4 from lz4 package.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/Config.in | 1 +
 package/efl/efl.mk    | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 69b0dcf..5d687e8 100644
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
index bdf304d..6ddd454 100644
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
