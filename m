From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Jul 2010 21:30:15 +0200
Subject: [Buildroot] [git commit master 1/1] dsl: disable ps3 video driver
Message-ID: <20100718200735.AF6F482BA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=869b11c8b59753ec476a571c8fea8d9574f9b319
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ps3 driver is enabled by default on ps3, but depends on spu support,
which most ppc toolchains don't have, so disable it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/sdl.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 3834137..4fd3ad4 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -44,7 +44,8 @@ endif
 SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-arts \
 		--disable-esd \
-		--disable-nasm
+		--disable-nasm \
+		--disable-video-ps3
 
 # Fixup prefix= and exec_prefix= in sdl-config, and remove the
 # -Wl,-rpath option.
-- 
1.7.1
