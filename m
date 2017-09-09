From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:45 +0200
Subject: [Buildroot] [PATCH 39/49 v2] package/libpjsip: add option to enable
	G.722 codec
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <4b4b7ce29e1301785af9a9c9fefcf7bd4baecf8e.1504993178.git.yann.morin.1998@free.fr>
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
index 1c9d2ce900..903dd1d693 100644
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
index 10016fa732..9992e14795 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -38,7 +38,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-small-filter \
 	--disable-large-filter \
 	--disable-l16-codec \
-	--disable-g722-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
 	--disable-ffmpeg \
@@ -76,6 +75,10 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G711),y)
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
2.11.0
