From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:21:05 -0500
Subject: [Buildroot] [NEXT 13/17] libpjsip: add L16 codec
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-13-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 3 +++
 package/libpjsip/libpjsip.mk | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 97aaeb2322..884a88bd50 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -70,6 +70,9 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_G7221
 config BR2_PACKAGE_LIBPJSIP_CODEC_ILBC
 	bool "iLBC"
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_L16
+	bool "L16"
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 050904f9d7..2da9a975bc 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -33,7 +33,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-libwebrtc \
 	--disable-opus \
 	--disable-ext-sound \
-	--disable-l16-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
 	--disable-openh264 \
@@ -116,4 +115,8 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_ILBC),y)
 LIBPJSIP_CONF_OPTS += --disable-ilbc-codec
 endif
 
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_L16),y)
+LIBPJSIP_CONF_OPTS += --disable-l16-codec
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
