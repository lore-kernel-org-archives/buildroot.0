From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 May 2016 20:14:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: re-structure dependencies
Message-ID: <1464027246-25871-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use one package per line to ease review of Kodi 17 version bump, where
10+ packages will be removed. This patch contains no code changes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk | 55 +++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e163c24..be93b2e 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -10,13 +10,54 @@ KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
 # needed for binary addons
 KODI_INSTALL_STAGING = YES
-KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-zip host-giflib \
-	host-libjpeg host-lzo host-nasm host-libpng host-swig
-KODI_DEPENDENCIES += boost bzip2 expat ffmpeg fontconfig freetype giflib jasper jpeg \
-	libass libcdio libcrossguid libcurl libdcadec libfribidi libgcrypt libmpeg2 \
-	libogg libplist libpng libsamplerate libsquish libvorbis libxml2 \
-	libxslt lzo ncurses openssl pcre python readline sqlite taglib tiff \
-	tinyxml yajl zlib
+KODI_DEPENDENCIES = \
+	boost \
+	bzip2 \
+	expat \
+	ffmpeg \
+	fontconfig \
+	freetype \
+	giflib \
+	host-gawk \
+	host-gettext \
+	host-giflib \
+	host-gperf \
+	host-libjpeg \
+	host-libpng \
+	host-lzo \
+	host-nasm \
+	host-swig \
+	host-zip \
+	jasper \
+	jpeg \
+	libass \
+	libcdio \
+	libcrossguid \
+	libcurl \
+	libdcadec \
+	libfribidi \
+	libgcrypt \
+	libmpeg2 \
+	libogg \
+	libplist \
+	libpng \
+	libsamplerate \
+	libsquish \
+	libvorbis \
+	libxml2 \
+	libxslt \
+	lzo \
+	ncurses \
+	openssl \
+	pcre \
+	python \
+	readline \
+	sqlite \
+	taglib \
+	tiff \
+	tinyxml \
+	yajl \
+	zlib
 
 KODI_CONF_ENV = \
 	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
-- 
2.8.1
