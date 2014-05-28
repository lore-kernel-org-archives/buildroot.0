From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:30 +0200
Subject: [Buildroot] [PATCH 07/30] xbmc: bump version to 13.1-RC1
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <14a1bf6f832b7a83e9641c1053d04764d8d90564.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: bump to the rc1]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/xbmc/Config.in | 1 +
 package/xbmc/xbmc.mk   | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

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
index 9f44c34..b1a821b 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XBMC_VERSION = 12.3-Frodo
+XBMC_VERSION = 13.1rc1-Gotham
 XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
 XBMC_LICENSE = GPLv2
 XBMC_LICENSE_FILES = LICENSE.GPL
@@ -15,7 +15,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 XBMC_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
-	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
+	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
 # xbmc at i386 depends on nasm
@@ -37,6 +37,7 @@ XBMC_CONF_ENV = \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
 XBMC_CONF_OPT +=  \
+	--with-arch=$(BR2_ARCH) \
 	--disable-alsa \
 	--disable-crystalhd \
 	--disable-debug \
-- 
1.8.3.2
