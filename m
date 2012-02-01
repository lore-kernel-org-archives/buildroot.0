From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 17:34:18 +0100
Subject: [Buildroot] [git commit] libevas: explicitly set host configure
	options
Message-ID: <20120201194911.7CE4A90975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a67631eb6edec288e3a8f8f1db0f7ca10c000bdd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So the build doesn't fail if any of the dependencies aren't available.
Also enable the jpeg loader as that is needed by the libelementary build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/libevas.mk |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index e34967b..7758b18 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -12,8 +12,21 @@ LIBEVAS_INSTALL_STAGING = YES
 LIBEVAS_DEPENDENCIES = host-pkg-config zlib libeina freetype
 
 HOST_LIBEVAS_DEPENDENCIES = host-pkg-config host-zlib host-libeina \
-				host-freetype host-libpng
-HOST_LIBEVAS_CONF_OPT += --enable-image-loader-png --disable-cpu-sse3
+				host-freetype host-libpng host-jpeg
+HOST_LIBEVAS_CONF_OPT += \
+	--enable-image-loader-png \
+	--enable-image-loader-jpeg \
+	--disable-image-loader-gif \
+	--disable-image-loader-tiff \
+	--disable-image-loader-eet \
+	--disable-font-loader-eet \
+	--disable-cpu-sse3 \
+	--disable-software-sdl \
+	--disable-gl-sdl \
+	--disable-software-xlib \
+	--disable-gl-xlib \
+	--enable-software-xcb \
+	--disable-gl-xcb
 
 # rendering options
 ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE),y)
