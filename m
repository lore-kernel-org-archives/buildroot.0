From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:20:56 -0500
Subject: [Buildroot] [NEXT 04/17] libpjsip: add oss option
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-4-aduskett@gmail.com>
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
index a289c90a92..0a6398d508 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -23,6 +23,9 @@ config BR2_PACKAGE_LIBPJSIP_ALSA
 	bool "alsa support"
 	select BR2_PACKAGE_ALSA_LIB
 
+config BR2_PACKAGE_LIBPJSIP_OSS
+	bool "OSS support"
+
 endif # BR2_PACKAGE_LIBPJSIP_SOUND
 
 endif # BR2_PACKAGE_LIBPJSIP
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index f354cd3538..d02ca4e803 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -35,7 +35,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-ilbc-codec \
 	--disable-libwebrtc \
 	--disable-opus \
-	--disable-oss \
 	--disable-ext-sound \
 	--disable-g711-codec \
 	--disable-l16-codec \
@@ -75,4 +74,8 @@ ifeq ($(BR2_PACKAGE_LIBPJSIP_ALSA),y)
 LIBPJSIP_DEPENDENCIES += alsa-lib
 endif
 
+ifneq ($(BR2_PACKAGE_LIBPJSIP_OSS),y)
+LIBPJSIP_CONF_OPTS += --disable-oss
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
