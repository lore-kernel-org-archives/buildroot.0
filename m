From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:23:18 +0100
Subject: [Buildroot] [PATCH v8 18/28] package/freeswitch: enable mod_isac
In-Reply-To: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456007008-5200-19-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 0b88bed..70f1b3d 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -160,6 +160,12 @@ endef
 
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+# mod_isac supports a limited set of archs
+# src/mod/codecs/mod_isac/typedefs.h
+ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_64),y)
+FREESWITCH_ENABLED_MODULES += codecs/mod_isac
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE)$(BR2_PACKAGE_FFMPEG_SWSCALE)$(BR2_PACKAGE_LIBVPX)$(BR2_PACKAGE_LIBYUV),yyyy)
 FREESWITCH_DEPENDENCIES += ffmpeg libvpx libyuv
 FREESWITCH_ENABLED_MODULES += applications/mod_av
-- 
2.7.0
