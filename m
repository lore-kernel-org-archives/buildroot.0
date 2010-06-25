From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Jun 2010 12:31:51 +0200
Subject: [Buildroot] [git commit master 1/1] sdl: fix build without directfb
	after autotools conversion
Message-ID: <20100625103243.9ACC981DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bb7593dfdb7f07ca0d282a7dcbae689d26a67a57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure --enable-video-directfb=no gets passed to configure
if directfb isn't enabled, so sdl doesn't try to link with the
host version instead (if available).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/sdl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 44981ea..87c7533 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -20,7 +20,7 @@ ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
 SDL_DEPENDENCIES += directfb
 SDL_CONF_OPT+=--enable-video-directfb=yes
 else
-SDL_DIRECTFB=--enable-video-directfb=no
+SDL_CONF_OPT=--enable-video-directfb=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_QTOPIA),y)
-- 
1.7.1
