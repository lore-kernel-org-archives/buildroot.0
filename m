From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 14 Nov 2017 11:07:10 -0500
Subject: [Buildroot] [NEXT v2 5/7] libpjsip: enable v4l2 support
In-Reply-To: <20171114160712.20086-1-aduskett@gmail.com>
References: <20171114160712.20086-1-aduskett@gmail.com>
Message-ID: <20171114160712.20086-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If v4l2 is selected, libpjsip should depend on it.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Remove the option to enable or disable v4l2 support in favor of
    just depending on libv4l if it's selected by the user.

 package/libpjsip/libpjsip.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 982e088..8b6fd09 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -40,7 +40,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g722-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
-	--disable-v4l2 \
 	--disable-openh264 \
 	--disable-libyuv \
 	--disable-ipp \
@@ -82,4 +81,10 @@ else
 LIBPJSIP_CONF_OPTS += --disable-ffmpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+LIBPJSIP_DEPENDENCIES += libv4l
+else
+LIBPJSIP_CONF_OPTS += --disable-v4l2
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
