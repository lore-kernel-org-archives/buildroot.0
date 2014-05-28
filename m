From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:25 +0200
Subject: [Buildroot] [PATCH 02/30] xbmc: add host-gettext dependency
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <5272d9f2b0b762d0cc2d23438248b778b68249e6.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

AUTOPOINT=/bin/true does not work anymore since
https://github.com/xbmc/xbmc/commit/42017cba7a62a0cf16896b061a25a25d392e1e46

config.status: error: cannot find input file: `Makefile.in'
configure: error: Submodule lib/cpluff failed to configure

This will be needed for 13.0 Gotham.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/xbmc/xbmc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index c7a4607..d8b9508 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -12,7 +12,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 # called TexturePacker. It is responsible to take all the images used in the
 # GUI and pack them in a blob.
 # http://wiki.xbmc.org/index.php?title=TexturePacker
-XBMC_DEPENDENCIES = host-gawk host-gperf host-infozip host-lzo host-sdl_image host-swig
+XBMC_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
@@ -133,7 +133,7 @@ endif
 
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define XBMC_BOOTSTRAP
-	cd $(@D) && PATH=$(BR_PATH) AUTOPOINT=/bin/true ./bootstrap
+	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
 endef
 XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
 
-- 
1.8.3.2
