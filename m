From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:46 +0100
Subject: [Buildroot] [PATCH 45/52] package/libpjsip: add option to enable
	L16 codec
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <220797c8c061426f7e2602ee95a67fd09fa4c586.1483093662.git.yann.morin.1998@free.fr>
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
index c7cdd68..ee09e46 100644
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
index 67329eb..19f6edb 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -36,7 +36,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-ext-sound \
 	--disable-small-filter \
 	--disable-large-filter \
-	--disable-l16-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
 	--disable-ffmpeg \
@@ -90,6 +89,10 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_ILBC),y)
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
2.7.4
