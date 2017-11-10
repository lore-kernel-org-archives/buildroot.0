From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:21:02 -0500
Subject: [Buildroot] [NEXT 10/17] libpjsip: add G.722 codec
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-10-aduskett@gmail.com>
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
index 8ff8d12b4f..32dac9c1b3 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -61,6 +61,9 @@ comment "dependency-less codecs"
 config BR2_PACKAGE_LIBPJSIP_CODEC_G711
 	bool "G.711"
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_G722
+	bool "G.722"
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 761a9c01b6..481a02e786 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -36,7 +36,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-opus \
 	--disable-ext-sound \
 	--disable-l16-codec \
-	--disable-g722-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
 	--disable-openh264 \
@@ -105,4 +104,8 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G711),y)
 LIBPJSIP_CONF_OPTS += --disable-g711-codec
 endif
 
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G722),y)
+LIBPJSIP_CONF_OPTS += --disable-g722-codec
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
