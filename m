From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Feb 2012 23:21:53 +0100
Subject: [Buildroot] [git commit] sdl: ensure mesa3d gets built before if
	enabled for opengl support
Message-ID: <20120207223219.C205E90A10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5aeca1f6692755154d339233bd4e2578593bbdcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/sdl.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index b5d9152..1b9bb9b 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -44,6 +44,10 @@ ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 SDL_DEPENDENCIES += alsa-lib
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+SDL_DEPENDENCIES += mesa3d
+endif
+
 SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-arts \
 		--disable-esd \
