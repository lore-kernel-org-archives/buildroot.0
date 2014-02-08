From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 22:09:19 +0100
Subject: [Buildroot] [git commit] vlc: fix sdl support
Message-ID: <20140208212129.E19FA9C5AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35667caad8630212da6c0b8457a6e3628c9f8bb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sdl video output module includes xlib headers, so it requires
xlib_libx11 to be available.

Fixes:
  http://autobuild.buildroot.org/results/d41/d41d2f36a4384289e300a3cf91d51960df9fab00/build-end.log

[Peter: check for SDL X11 backend instead]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 65aab36..b184de3 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -224,7 +224,7 @@ else
 VLC_CONF_OPT += --disable-qt
 endif
 
-ifeq ($(BR2_PACKAGE_SDL),y)
+ifeq ($(BR2_PACKAGE_SDL_X11),y)
 VLC_CONF_OPT += --enable-sdl
 VLC_DEPENDENCIES += sdl
 else
