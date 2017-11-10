From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:21:03 -0500
Subject: [Buildroot] [NEXT 11/17] libpjsip: add G.722.1 codec
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-11-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 3 +++
 package/libpjsip/libpjsip.mk | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 32dac9c1b3..2eea1dc73b 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -64,6 +64,9 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_G711
 config BR2_PACKAGE_LIBPJSIP_CODEC_G722
 	bool "G.722"
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_G7221
+	bool "G.722.1"
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 481a02e786..d3acb93483 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -30,7 +30,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-speex-aec \
 	--disable-resample \
 	--disable-opencore-amr \
-	--disable-g7221-codec \
 	--disable-ilbc-codec \
 	--disable-libwebrtc \
 	--disable-opus \
@@ -108,4 +107,9 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G722),y)
 LIBPJSIP_CONF_OPTS += --disable-g722-codec
 endif
 
+# libpjsip can only use a bundled version of libg7221
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G7221),y)
+LIBPJSIP_CONF_OPTS += --disable-g7221-codec
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
