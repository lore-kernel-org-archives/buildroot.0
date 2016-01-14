From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Jan 2016 22:40:08 +0100
Subject: [Buildroot] [PATCH v6 27/29] package/freeswitch: enable mod_imagick,
	add optional dependencies to imagemagick, libvpx & libyuv
In-Reply-To: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452807610-15534-28-git-send-email-bernd.kuhls@t-online.de>
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
index fadb9c6..2c07a47 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -160,6 +160,11 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
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
2.6.4
