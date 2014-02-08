From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Feb 2014 15:34:54 +0100
Subject: [Buildroot] [PATCH v1 5/6] vlc: fix sdl support
In-Reply-To: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
References: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391870095-3738-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sdl video output module includes xlib headers, so it requires
xlib_libx11 to be available.

Fixes:
  http://autobuild.buildroot.org/results/d41/d41d2f36a4384289e300a3cf91d51960df9fab00/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/vlc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 65aab36..871373e 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -224,9 +224,9 @@ else
 VLC_CONF_OPT += --disable-qt
 endif
 
-ifeq ($(BR2_PACKAGE_SDL),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_SDL),yy)
 VLC_CONF_OPT += --enable-sdl
-VLC_DEPENDENCIES += sdl
+VLC_DEPENDENCIES += sdl xlib_libX11
 else
 VLC_CONF_OPT += --disable-sdl
 endif
-- 
1.8.5.4
