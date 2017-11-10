From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:20:58 -0500
Subject: [Buildroot] [NEXT 06/17] libpjsip: enable video option
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-6-aduskett@gmail.com>
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
index e00a4a30b0..20b8568d52 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -32,6 +32,9 @@ config BR2_PACKAGE_LIBPJSIP_PORTAUDIO
 
 endif # BR2_PACKAGE_LIBPJSIP_SOUND
 
+config BR2_PACKAGE_LIBPJSIP_VIDEO
+	bool "Enable video"
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 774959d50b..f45d9d1caf 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -29,7 +29,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-speex-codec \
 	--disable-speex-aec \
 	--disable-resample \
-	--disable-video \
 	--disable-opencore-amr \
 	--disable-g7221-codec \
 	--disable-ilbc-codec \
@@ -83,4 +82,8 @@ LIBPJSIP_DEPENDENCIES += portaudio
 LIBPJSIP_CONF_OPTS += --with-external-pa
 endif
 
+ifneq ($(BR2_PACKAGE_LIBPJSIP_VIDEO),y)
+LIBPJSIP_CONF_OPTS += --disable-video
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
