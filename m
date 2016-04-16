From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Apr 2016 12:55:14 +0200
Subject: [Buildroot] [PATCH v14 23/27] package/freeswitch: enable mod_imagick
In-Reply-To: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460804118-4900-24-git-send-email-bernd.kuhls@t-online.de>
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
index 73ea144..534b964 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -175,6 +175,11 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
 
+ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
+FREESWITCH_DEPENDENCIES += imagemagick
+FREESWITCH_ENABLED_MODULES += formats/mod_imagick
+endif
+
 ifeq ($(BR2_PACKAGE_LIBBROADVOICE),y)
 FREESWITCH_DEPENDENCIES += libbroadvoice
 FREESWITCH_ENABLED_MODULES += codecs/mod_bv
-- 
2.8.0.rc3
