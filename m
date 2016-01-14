From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Jan 2016 22:40:05 +0100
Subject: [Buildroot] [PATCH v6 24/29] package/freeswitch: enable mod_alsa,
	add optional dependency to alsa-lib
In-Reply-To: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452807610-15534-25-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index fb60779..01c8bab 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -132,6 +132,11 @@ endef
 
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+FREESWITCH_DEPENDENCIES += alsa-lib
+FREESWITCH_ENABLED_MODULES += endpoints/mod_alsa
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE)$(BR2_PACKAGE_FFMPEG_SWSCALE)$(BR2_PACKAGE_LIBVPX)$(BR2_PACKAGE_LIBYUV),yyyy)
 FREESWITCH_DEPENDENCIES += ffmpeg libvpx libyuv
 FREESWITCH_ENABLED_MODULES += applications/mod_av
-- 
2.6.4
