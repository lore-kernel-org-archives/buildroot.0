From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:48 +0200
Subject: [Buildroot] [PATCH 42/49 v2] package/libpjsip: add option to enable
	L16 codec
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <12b2579880375ccceb08b4f71586da1a04a284e3.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libpjsip/Config.in   | 3 +++
 package/libpjsip/libpjsip.mk | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index c7cdd68c69..ee09e4646a 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -32,6 +32,9 @@ comment "GSM codec needs a toolchain w/ shared libraries"
 config BR2_PACKAGE_LIBPJSIP_CODEC_ILBC
 	bool "iLBC codec"
 
+config BR2_PACKAGE_LIBPJSIP_L16_CODEC
+	bool "L16 codec"
+
 config BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX
 	bool "Speex codec"
 	select BR2_PACKAGE_SPEEX
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index e55ee86060..e090b406c3 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -35,7 +35,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-ext-sound \
 	--disable-small-filter \
 	--disable-large-filter \
-	--disable-l16-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
 	--disable-ffmpeg \
@@ -94,6 +93,10 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_ILBC),y)
 LIBPJSIP_CONF_OPTS += --disable-ilbc-codec
 endif
 
+ifneq ($(BR2_PACKAGE_LIBPJSIP_L16_CODEC),y)
+LIBPJSIP_CONF_OPTS += --disable-l16-codec
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX),y)
 LIBPJSIP_DEPENDENCIES += speex
 LIBPJSIP_CONF_OPTS += --with-external-speex
-- 
2.11.0
