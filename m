From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Mar 2014 23:48:56 +0100
Subject: [Buildroot] [git commit] xbmc: Add comment for host-sdl_images
	dependency
Message-ID: <20140327224928.1F9DD9C0CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cfd429c1c3d6c7b793f58210f39bb041e680bac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A few people have already asked why XBMC depends on host-sdl_image and
host-sdl.

Since this is not obvious, this patch add a comments explaining why it's
needed.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xbmc/xbmc.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
