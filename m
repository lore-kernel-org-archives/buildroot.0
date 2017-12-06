From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 21:54:36 +0100
Subject: [Buildroot] [git commit] package/omxplayer: add missing dependency
 to alsa-lib
Message-ID: <20171206204715.023DD825C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e28a4dfc513a4ef821e4a898cc96fe28d9be09c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump in 58a00a13 (omxplayer: bump to version 2ee17b2),
omxplayer gained a dependency to alsa-lib.

Fixes:
    http://autobuild.buildroot.org/results/652/65212c59a37398681b341263bd76ba8a65ff7828/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julius Kriukas <julius@kriukas.lt>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omxplayer/Config.in    | 3 ++-
 package/omxplayer/omxplayer.mk | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
index b417aa3..bdb3f40 100644
--- a/package/omxplayer/Config.in
+++ b/package/omxplayer/Config.in
@@ -4,9 +4,10 @@ config BR2_PACKAGE_OMXPLAYER
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # ffmpeg
 	depends on BR2_INSTALL_LIBSTDCPP # boost
-	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, boost, libusb
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FFMPEG
diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
index 6e92250..6999269 100644
--- a/package/omxplayer/omxplayer.mk
+++ b/package/omxplayer/omxplayer.mk
@@ -10,7 +10,7 @@ OMXPLAYER_LICENSE = GPL-2.0+
 OMXPLAYER_LICENSE_FILES = COPYING
 
 OMXPLAYER_DEPENDENCIES = \
-	host-pkgconf boost dbus ffmpeg freetype libidn libusb pcre \
+	host-pkgconf alsa-lib boost dbus ffmpeg freetype libidn libusb pcre \
 	rpi-userland zlib
 
 OMXPLAYER_EXTRA_CFLAGS = \
