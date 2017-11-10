From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:20:57 -0500
Subject: [Buildroot] [NEXT 05/17] libpjsip: add portaudio option
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 4 ++++
 package/libpjsip/libpjsip.mk | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 0a6398d508..e00a4a30b0 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -26,6 +26,10 @@ config BR2_PACKAGE_LIBPJSIP_ALSA
 config BR2_PACKAGE_LIBPJSIP_OSS
 	bool "OSS support"
 
+config BR2_PACKAGE_LIBPJSIP_PORTAUDIO
+	bool "portaudio support"
+	select BR2_PACKAGE_PORTAUDIO
+
 endif # BR2_PACKAGE_LIBPJSIP_SOUND
 
 endif # BR2_PACKAGE_LIBPJSIP
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index d02ca4e803..774959d50b 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -78,4 +78,9 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_OSS),y)
 LIBPJSIP_CONF_OPTS += --disable-oss
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_PORTAUDIO),y)
+LIBPJSIP_DEPENDENCIES += portaudio
+LIBPJSIP_CONF_OPTS += --with-external-pa
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
