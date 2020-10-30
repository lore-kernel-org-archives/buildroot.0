From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Fri, 30 Oct 2020 15:25:29 +0100
Subject: [Buildroot] [PATCH] package/wine: update dependencies for 5.12
Message-ID: <20201030142529.500522-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.mk | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 7d7b22a137..7eafe9b06d 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -145,11 +145,18 @@ else
 WINE_CONF_OPTS += --without-png
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+WINE_CONF_OPTS += --with-usb
+WINE_DEPENDENCIES += libusb
+else
+WINE_CONF_OPTS += --without-usb
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
-WINE_CONF_OPTS += --with-v4l
+WINE_CONF_OPTS += --with-v4l2
 WINE_DEPENDENCIES += libv4l
 else
-WINE_CONF_OPTS += --without-v4l
+WINE_CONF_OPTS += --without-v4l2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
@@ -386,7 +393,8 @@ HOST_WINE_CONF_OPTS += \
 	--without-sane \
 	--without-sdl \
 	--without-tiff \
-	--without-v4l \
+	--without-usb \
+	--without-v4l2 \
 	--without-vkd3d \
 	--without-vulkan \
 	--without-x \
-- 
2.25.1
