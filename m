From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 00:08:36 +0200
Subject: [Buildroot] [git commit] package/libplayer: switch to
	BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
Message-ID: <20160606220841.9F5D381841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=211b3f8885004e897aacfa519941997798047b55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
