From: Julius Kriukas <julius@kriukas.lt>
Date: Tue,  5 Dec 2017 01:30:35 +0200
Subject: [Buildroot] [PATCH 1/1] omxplayer: add missing dependency on
 alsa-lib
Message-ID: <20171204233035.2183-1-julius@kriukas.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Omxplayer depends on alsa-lib. This patch fixes:

http://autobuild.buildroot.net/results/652/65212c59a37398681b341263bd76ba8a65ff7828

Signed-off-by: Julius Kriukas <julius@kriukas.lt>
---
 package/omxplayer/Config.in    | 1 +
 package/omxplayer/omxplayer.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
index b417aa3b0b..67367cf123 100644
--- a/package/omxplayer/Config.in
+++ b/package/omxplayer/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_OMXPLAYER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libusb
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FFMPEG
diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
index 6e92250438..6999269161 100644
--- a/package/omxplayer/omxplayer.mk
+++ b/package/omxplayer/omxplayer.mk
@@ -10,7 +10,7 @@ OMXPLAYER_LICENSE = GPL-2.0+
 OMXPLAYER_LICENSE_FILES = COPYING
 
 OMXPLAYER_DEPENDENCIES = \
-	host-pkgconf boost dbus ffmpeg freetype libidn libusb pcre \
+	host-pkgconf alsa-lib boost dbus ffmpeg freetype libidn libusb pcre \
 	rpi-userland zlib
 
 OMXPLAYER_EXTRA_CFLAGS = \
-- 
2.11.0
