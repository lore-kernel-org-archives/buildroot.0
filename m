From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 27 Mar 2014 23:40:46 +0100
Subject: [Buildroot] [PATCH] xbmc: Add comment for host-sdl_images dependency
Message-ID: <1395960046-26648-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A few people have already asked why XBMC depends on host-sdl_image and
host-sdl.

Since this is not obvious, this patch add a comments explaining why it's
needed.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/xbmc/xbmc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index a43b41d..6dbbb7d 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -8,6 +8,10 @@ XBMC_VERSION = 12.3-Frodo
 XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
 XBMC_LICENSE = GPLv2
 XBMC_LICENSE_FILES = LICENSE.GPL
+# XBMC needs host-sdl_image (and therefore host-sdl) for a host tools it builds
+# called TexturePacker. It is responsible to take all the images used in the
+# GUI and pack them in a blob.
+# http://wiki.xbmc.org/index.php?title=TexturePacker
 XBMC_DEPENDENCIES = host-gperf host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
-- 
1.9.0
