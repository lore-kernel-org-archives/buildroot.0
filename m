From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 13:09:04 -0500
Subject: [Buildroot] [NEXT v3 7/8] libpjsip: enable libsamplerate
In-Reply-To: <20171120180905.5903-1-aduskett@gmail.com>
References: <20171120180905.5903-1-aduskett@gmail.com>
Message-ID: <20171120180905.5903-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libsamplerate is selected, libpjsip should depend on it.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None
  
Changes v2 -> v3:
  - Add this patch to the series.
  
 package/libpjsip/libpjsip.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index d16d060..149810d 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -29,7 +29,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-libwebrtc \
 	--disable-oss \
 	--disable-ext-sound \
-	--disable-libsamplerate \
 	--disable-sdl \
 	--disable-openh264 \
 	--disable-libyuv \
@@ -68,6 +67,13 @@ else
 LIBPJSIP_CONF_OPTS += --without-external-pa
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+LIBPJSIP_DEPENDENCIES += libsamplerate
+LIBPJSIP_CONF_OPTS += --enable-libsamplerate
+else
+LIBPJSIP_CONF_OPTS += --disable-libsamplerate
+endif
+
 # When --enable-ffmpeg is given, the code to enable FFmpeg is not executed.
 # Also, when cross-compiling and no --with-ffmpeg option is given, FFmpeg is
 # disabled. Therefore, a --with-ffmpeg option needs to be given. Normally it
-- 
2.13.6
