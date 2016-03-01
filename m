From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Mar 2016 22:58:54 +0100
Subject: [Buildroot] [PATCH/next v10 26/28] package/freeswitch: enable
	mod_imagemagick
In-Reply-To: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456869536-18324-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit enables mod_imagemagick, which requires imagemagick, libvpx
and libyuv as optional dependencies.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index d610875..5cab8ba 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -174,6 +174,11 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
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
