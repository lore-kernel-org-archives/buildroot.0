From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Apr 2016 06:22:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: mod_cv needs
	BR2_PACKAGE_OPENCV_LIB_OBJDETECT
Message-ID: <1460953338-15043-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/ffd/ffd572d7bb68d8ed46ce76b2af824503c587449f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index fdfdbf0..11b77e8 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -269,7 +269,7 @@ FREESWITCH_DEPENDENCIES += libsoundtouch
 FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV),y)
+ifeq ($(BR2_PACKAGE_OPENCV)$(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),yy)
 FREESWITCH_DEPENDENCIES += opencv
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
-- 
2.8.0.rc3
