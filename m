From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Dec 2015 10:28:53 +0100
Subject: [Buildroot] [PATCH] package/kodi: fix fallout after infozip rename
Message-ID: <1449394133-4017-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit f0c9470 (infozip: rename to zip) forgot to propagate the rename
down to the only user of the host variant of infozip.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/kodi/kodi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 46d8650..bf3aa7a 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -10,7 +10,7 @@ KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
 # needed for binary addons
 KODI_INSTALL_STAGING = YES
-KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-giflib \
+KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-zip host-giflib \
 	host-libjpeg host-lzo host-nasm host-libpng host-swig
 KODI_DEPENDENCIES += boost bzip2 expat ffmpeg fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libfribidi libgcrypt libmpeg2 \
-- 
1.9.1
