From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 16 Jun 2016 08:26:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: Disable mod_imagick,
	broken with imagemagick7
Message-ID: <1466058413-4945-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Problem sent upstream: https://freeswitch.org/jira/browse/FS-9272

Fixes
http://autobuild.buildroot.net/results/e20/e20c0b9a32f6bef5d43369437895058d44d0df58/
http://autobuild.buildroot.net/results/aa4/aa4d681de85497c2cdd2b0488d9b4569160b5f02/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index a05b293..414f297 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -178,11 +178,6 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
 
-ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
-FREESWITCH_DEPENDENCIES += imagemagick
-FREESWITCH_ENABLED_MODULES += formats/mod_imagick
-endif
-
 ifeq ($(BR2_PACKAGE_LIBBROADVOICE),y)
 FREESWITCH_DEPENDENCIES += libbroadvoice
 FREESWITCH_ENABLED_MODULES += codecs/mod_bv
-- 
2.8.1
