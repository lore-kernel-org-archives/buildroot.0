From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 14 Apr 2017 14:13:45 +0200
Subject: [Buildroot] [PATCH 5/5] package/efl: add poppler imageloader
	optional dependency
In-Reply-To: <20170414121345.10026-1-romain.naour@gmail.com>
References: <20170414121345.10026-1-romain.naour@gmail.com>
Message-ID: <20170414121345.10026-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/efl.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index c71c084..4008d30 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -24,7 +24,6 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 
 # Configure options:
 # --disable-lua-old: build elua for the target.
-# --disable-poppler: disable poppler image loader.
 # --disable-sdl: disable sdl2 support.
 # --disable-spectre: disable spectre image loader.
 # --disable-xinput22: disable X11 XInput v2.2+ support.
@@ -43,7 +42,6 @@ EFL_CONF_OPTS = \
 	--disable-image-loader-jp2k \
 	--with-net-control=none \
 	--disable-lua-old \
-	--disable-poppler \
 	--disable-sdl \
 	--disable-spectre \
 	--disable-xinput22 \
@@ -262,6 +260,13 @@ else
 EFL_CONF_OPTS += --disable-image-loader-webp
 endif
 
+ifeq ($(BR2_PACKAGE_POPPLER),y)
+EFL_DEPENDENCIES += poppler
+EFL_CONF_OPTS += --enable-poppler
+else
+EFL_CONF_OPTS += --disable-poppler
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_LIBRAW),y)
 EFL_DEPENDENCIES += libraw
 EFL_CONF_OPTS += --enable-libraw
-- 
2.9.3
