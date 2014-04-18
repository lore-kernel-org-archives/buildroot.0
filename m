From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Apr 2014 21:53:35 +0200
Subject: [Buildroot] [git commit] sdl: disable x11 in host-sdl
Message-ID: <20140418195403.4F5DB9C8F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd6121311408d1e7bba3942dd91ef7e6155a0ac9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We do not need an X11-capable host SDL, so just disable X11 support.

This currently works if the build machine has the X11 development
packages installed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl/sdl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index d36f3ff..8d0e5bd 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -72,6 +72,7 @@ SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-video-ps3
 
 HOST_SDL_CONF_OPT += --enable-pulseaudio=no \
+		--enable-video-x11=no \
 		--disable-arts \
 		--disable-esd \
 		--disable-nasm \
