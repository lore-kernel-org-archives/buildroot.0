From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:23:23 +0100
Subject: [Buildroot] [PATCH v8 23/28] package/freeswitch: enable mod_alsa,
	add optional dependency to alsa-lib
In-Reply-To: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456007008-5200-24-git-send-email-bernd.kuhls@t-online.de>
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
index f008248..b097794 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -166,6 +166,11 @@ ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_6
 FREESWITCH_ENABLED_MODULES += codecs/mod_isac
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+FREESWITCH_DEPENDENCIES += alsa-lib
+FREESWITCH_ENABLED_MODULES += endpoints/mod_alsa
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE)$(BR2_PACKAGE_FFMPEG_SWSCALE)$(BR2_PACKAGE_LIBVPX)$(BR2_PACKAGE_LIBYUV),yyyy)
 FREESWITCH_DEPENDENCIES += ffmpeg libvpx libyuv
 FREESWITCH_ENABLED_MODULES += applications/mod_av
-- 
2.7.0
