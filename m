From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 23:20:22 +0200
Subject: [Buildroot] [git commit] package/omxplayer: remove
	BR2_PACKAGE_BOOST_ARCH_SUPPORTS option
Message-ID: <20160606212027.7CF4081D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaabd3ce032f4dd3b832ad3a5952f6382df6dde2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option was globally removed with
https://git.busybox.net/buildroot/commit/package/boost?id=668ce456448d671f30bf98c4d4819a88b0bf9f4e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
