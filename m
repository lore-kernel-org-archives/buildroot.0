From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:43 +0100
Subject: [Buildroot] [PATCH 42/52] package/libpjsip: add option to enable
	G.722 codec
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <940f0b916fdd9a1e590f663fd239d07b7eca9c19.1483093662.git.yann.morin.1998@free.fr>
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
index 1c9d2ce..903dd1d 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -15,6 +15,9 @@ if BR2_PACKAGE_LIBPJSIP
 config BR2_PACKAGE_LIBPJSIP_CODEC_G711
 	bool "G.711 codec"
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_G722
+	bool "G.722 codec"
+
 config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
     bool "GSM codec"
     depends on !BR2_STATIC_LIBS # libgsm
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index dd279d3..a7d66f5 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -39,7 +39,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-small-filter \
 	--disable-large-filter \
 	--disable-l16-codec \
-	--disable-g722-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
 	--disable-ffmpeg \
@@ -72,6 +71,10 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G711),y)
 LIBPJSIP_CONF_OPTS += --disable-g711-codec
 endif
 
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G722),y)
+LIBPJSIP_CONF_OPTS += --disable-g722-codec
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_GSM),y)
 LIBPJSIP_DEPENDENCIES += libgsm
 LIBPJSIP_CONF_OPTS += --with-external-gsm
-- 
2.7.4
