From: Ryan Coe <bluemrp9@gmail.com>
Date: Sun,  5 Jun 2016 12:34:33 -0700
Subject: [Buildroot] [PATCH 1/1] omxplayer: remove
	BR2_PACKAGE_BOOST_ARCH_SUPPORTS as it no longer exists
Message-ID: <20160605193433.13519-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
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
2.8.3
