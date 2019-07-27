From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jul 2019 22:22:40 +0200
Subject: [Buildroot] [git commit] package/netsurf: fix build of host tool
 convert_image
Message-ID: <20190727202026.0B27D8379E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56d39c901430081c0c60932b6928ca0eb1821471
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream commit
http://source.netsurf-browser.org/netsurf.git/commit/frontends/framebuffer/Makefile?id=40cdf498b9153685b4cefe576e59f6b41090912b

renamed the variable HOST_*FLAGS to BUILD_*FLAGS.

This breaks the build of the host tool convert_image when png.h is not
provided by the host system itself.

Fixes:
http://autobuild.buildroot.net/results/6ac/6ac71c7a41dd92a5fb924af9da7cedc40e745cfa/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsurf/netsurf.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 30e8dc8b4f..b510a69649 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -36,8 +36,8 @@ ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
 NETSURF_DEPENDENCIES += sdl host-libpng
 NETSURF_FRONTEND = framebuffer
 NETSURF_CONFIG = \
-	HOST_CFLAGS='$(HOST_CFLAGS)' \
-	HOST_LDFLAGS='$(HOST_LDFLAGS) -lpng'
+	BUILD_CFLAGS='$(HOST_CFLAGS)' \
+	BUILD_LDFLAGS='$(HOST_LDFLAGS) -lpng'
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 NETSURF_DEPENDENCIES += freetype
 define NETSURF_FONTLIB_CONFIGURE_CMDS
