From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jun 2016 15:16:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libplayer: switch to
	BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
Message-ID: <1465046200-13948-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libplayer/Config.in | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index aa599ae..665b947 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -11,12 +11,7 @@ config BR2_PACKAGE_LIBPLAYER
 if BR2_PACKAGE_LIBPLAYER
 config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	bool "mplayer backend"
-	# mplayer
-	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb || \
-		BR2_microblaze || BR2_aarch64 || BR2_nios2)
-	# mplayer
-	# Broken support for <ARMv5
-	depends on !BR2_ARM_CPU_ARMV4
+	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	select BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
-- 
2.8.1
