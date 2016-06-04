From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jun 2016 15:13:01 +0200
Subject: [Buildroot] [PATCH 2/2] package/omxplayer: remove
	BR2_PACKAGE_BOOST_ARCH_SUPPORTS option
In-Reply-To: <1465045981-8529-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465045981-8529-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465045981-8529-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option was globally removed with
https://git.busybox.net/buildroot/commit/package/boost?id=668ce456448d671f30bf98c4d4819a88b0bf9f4e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/omxplayer/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
index b8946e9..b417aa3 100644
--- a/package/omxplayer/Config.in
+++ b/package/omxplayer/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_OMXPLAYER
 	bool "omxplayer"
 	depends on BR2_arm
 	depends on BR2_USE_MMU # dbus
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # ffmpeg
 	depends on BR2_INSTALL_LIBSTDCPP # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libusb
@@ -28,7 +27,6 @@ config BR2_PACKAGE_OMXPLAYER
 comment "omxplayer needs rpi-userland and a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_arm
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_RPI_USERLAND
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-- 
2.8.1
