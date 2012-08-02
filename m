From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:38 -0000
Subject: [Buildroot] [git commit branch/next] mediastreamer: fix configure
	error with ffmpeg and no libx11/libxv
Message-ID: <20120802195236.C0A7996EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86f649a00eadc090aa00fbc33c3b5dc41787b8ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/319f525d50eebbb84b2d2cb77294cc6f61246792

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mediastreamer/mediastreamer.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index a503490..65e4ec7 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -50,6 +50,9 @@ endif
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 MEDIASTREAMER_CONF_OPT += --enable-x11
 MEDIASTREAMER_DEPENDENCIES += xlib_libX11
+else
+MEDIASTREAMER_CONF_OPT += --disable-x11
+endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
 MEDIASTREAMER_CONF_OPT += --enable-xv
@@ -58,10 +61,6 @@ else
 MEDIASTREAMER_CONF_OPT += --disable-xv
 endif
 
-else
-MEDIASTREAMER_CONF_OPT += --disable-x11
-endif
-
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
 MEDIASTREAMER_CONF_OPT += --enable-theora
 MEDIASTREAMER_DEPENDENCIES += libtheora
