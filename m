From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Feb 2016 16:27:16 +0100
Subject: [Buildroot] [PATCH/next v9 26/28] package/freeswitch: enable
	mod_imagick, add optional dependencies to imagemagick,
	libvpx & libyuv
In-Reply-To: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456586838-21197-27-git-send-email-bernd.kuhls@t-online.de>
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
index c9277ed..d97fd3f 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -180,6 +180,11 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
 
+ifeq ($(BR2_PACKAGE_IMAGEMAGICK)$(BR2_PACKAGE_LIBVPX)$(BR2_PACKAGE_LIBYUV),yyy)
+FREESWITCH_DEPENDENCIES += imagemagick libvpx libyuv
+FREESWITCH_ENABLED_MODULES += formats/mod_imagick
+endif
+
 ifeq ($(BR2_PACKAGE_LIBBROADVOICE),y)
 FREESWITCH_DEPENDENCIES += libbroadvoice
 FREESWITCH_ENABLED_MODULES += codecs/mod_bv
-- 
2.7.0
