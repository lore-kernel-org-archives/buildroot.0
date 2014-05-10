From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 May 2014 12:02:33 +0200
Subject: [Buildroot] [PATCH v6 21/32] xbmc: Add host-gettext dependency
In-Reply-To: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399716164-6452-22-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AUTOPOINT=/bin/true does not work anymore since
https://github.com/xbmc/xbmc/commit/42017cba7a62a0cf16896b061a25a25d392e1e46

config.status: error: cannot find input file: `Makefile.in'
configure: error: Submodule lib/cpluff failed to configure

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 926f050..c081609 100644
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
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
@@ -129,7 +129,7 @@ endif
 
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define XBMC_BOOTSTRAP
-	cd $(@D) && PATH=$(BR_PATH) AUTOPOINT=/bin/true ./bootstrap
+	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
 endef
 XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
 
-- 
1.7.10.4
