From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Feb 2016 16:27:02 +0100
Subject: [Buildroot] [PATCH/next v9 12/28] package/freeswitch: enable mod_av,
	add optional dependencies to ffmpeg, libvpx & libyuv
In-Reply-To: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456586838-21197-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mod_av delivers native support for these video codecs:

codec,H263 Video,mod_av
codec,H263+ Video,mod_av
codec,H264 Video,mod_av

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 3925573..51762cf 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -156,6 +156,11 @@ endef
 
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE)$(BR2_PACKAGE_FFMPEG_SWSCALE)$(BR2_PACKAGE_LIBVPX)$(BR2_PACKAGE_LIBYUV),yyyy)
+FREESWITCH_DEPENDENCIES += ffmpeg libvpx libyuv
+FREESWITCH_ENABLED_MODULES += applications/mod_av
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
-- 
2.7.0
