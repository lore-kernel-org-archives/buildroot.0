From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jun 2014 10:38:24 +0200
Subject: [Buildroot] [git commit] fltk: drop custom install options
Message-ID: <20140616084710.807799CC76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=815ab23c21599cef6128496b0d559646f223a301
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fltk buildsystem no longer tries to strip binaries during installation,
so these can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fltk/fltk.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index cbcec7b..a8ff807 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -8,8 +8,6 @@ FLTK_VERSION = 1.3.2
 FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.gz
 FLTK_SITE = http://fltk.org/pub/fltk/$(FLTK_VERSION)
 FLTK_INSTALL_STAGING = YES
-FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
-FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_CONF_OPT = --enable-threads --with-x --disable-gl \
 	--disable-localjpeg --disable-localpng --disable-localzlib
 FLTK_DEPENDENCIES = jpeg libpng xlib_libX11 xlib_libXext xlib_libXt
