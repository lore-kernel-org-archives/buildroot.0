From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:21:04 -0500
Subject: [Buildroot] [NEXT 12/17] libpjsip: add ilbc codec
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-12-aduskett@gmail.com>
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
index 2eea1dc73b..97aaeb2322 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -67,6 +67,9 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_G722
 config BR2_PACKAGE_LIBPJSIP_CODEC_G7221
 	bool "G.722.1"
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_ILBC
+	bool "iLBC"
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index d3acb93483..050904f9d7 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -30,7 +30,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-speex-aec \
 	--disable-resample \
 	--disable-opencore-amr \
-	--disable-ilbc-codec \
 	--disable-libwebrtc \
 	--disable-opus \
 	--disable-ext-sound \
@@ -112,4 +111,9 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G7221),y)
 LIBPJSIP_CONF_OPTS += --disable-g7221-codec
 endif
 
+# libpjsip can only use a bundled version of libilbc
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_ILBC),y)
+LIBPJSIP_CONF_OPTS += --disable-ilbc-codec
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
