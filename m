From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:05:51 +0200
Subject: [Buildroot] [git commit] xbmc: bump version to 13.1
Message-ID: <20140608130901.C99709B261@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c71e4fe1dd3925fa8dbc343fcd67fb97a0f214f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/Config.in |    1 +
 package/xbmc/xbmc.mk   |    8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 52bf0cd..592fdc1 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -35,6 +35,7 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_LIBUNGIF
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index b6cf145..ca605a4 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XBMC_VERSION = 12.3-Frodo
-XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
+XBMC_VERSION = 13.1-Gotham
+XBMC_SOURCE = $(XBMC_VERSION).tar.gz
+XBMC_SITE = https://github.com/xbmc/xbmc/archive
 XBMC_LICENSE = GPLv2
 XBMC_LICENSE_FILES = LICENSE.GPL
 # XBMC needs host-sdl_image (and therefore host-sdl) for a host tools it builds
@@ -15,7 +16,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 XBMC_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
-	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
+	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
 # xbmc at i386 depends on nasm
@@ -37,6 +38,7 @@ XBMC_CONF_ENV = \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
 XBMC_CONF_OPT +=  \
+	--with-arch=$(BR2_ARCH) \
 	--disable-alsa \
 	--disable-crystalhd \
 	--disable-debug \
