From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:21 +0200
Subject: [Buildroot] [PATCH 70/83 v2] package/sdl_*: remove redundant
	dependency
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <44b7ba1a8de10ece7a705858c29e50c8ecd09091.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that those packages are directly included in an if-SDL clause, there
is no need to expressly depend on SDL.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sdl_gfx/Config.in   | 1 -
 package/sdl_image/Config.in | 1 -
 package/sdl_mixer/Config.in | 1 -
 package/sdl_net/Config.in   | 1 -
 package/sdl_sound/Config.in | 1 -
 package/sdl_ttf/Config.in   | 1 -
 6 files changed, 6 deletions(-)

diff --git a/package/sdl_gfx/Config.in b/package/sdl_gfx/Config.in
index b5d5cac..0f4518b 100644
--- a/package/sdl_gfx/Config.in
+++ b/package/sdl_gfx/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SDL_GFX
 	bool "SDL_gfx"
-	depends on BR2_PACKAGE_SDL
 	help
 	  The SDL_gfx library is an extension to the SDL library which
 	  provides basic antialiased drawing routines such as lines,
diff --git a/package/sdl_image/Config.in b/package/sdl_image/Config.in
index 0c4a018..d9278d7 100644
--- a/package/sdl_image/Config.in
+++ b/package/sdl_image/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_SDL_IMAGE
 	bool "SDL_image"
-	depends on BR2_PACKAGE_SDL
 	help
 	  SDL_image is an image file loading library. It loads images
 	  as SDL surfaces, and supports the following formats:
diff --git a/package/sdl_mixer/Config.in b/package/sdl_mixer/Config.in
index 42dfe63..8d558ed 100644
--- a/package/sdl_mixer/Config.in
+++ b/package/sdl_mixer/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SDL_MIXER
 	bool "SDL_mixer"
-	depends on BR2_PACKAGE_SDL
 	help
 	  SDL_mixer is a sample multi-channel audio mixer library.
 	  It supports any number of simultaneously playing channels of
diff --git a/package/sdl_net/Config.in b/package/sdl_net/Config.in
index 2001d23..6fddba5 100644
--- a/package/sdl_net/Config.in
+++ b/package/sdl_net/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SDL_NET
 	bool "SDL_net"
-	depends on BR2_PACKAGE_SDL
 	help
 	  SDL_net is a small, low-level, cross-platform network library, that
 	  can be used with the Simple DirectMedia Layer library (SDL).
diff --git a/package/sdl_sound/Config.in b/package/sdl_sound/Config.in
index 6da1985..723f9ac 100644
--- a/package/sdl_sound/Config.in
+++ b/package/sdl_sound/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SDL_SOUND
 	bool "SDL_sound"
-	depends on BR2_PACKAGE_SDL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  SDL_sound is a library that handles the decoding of several
diff --git a/package/sdl_ttf/Config.in b/package/sdl_ttf/Config.in
index efc92e5..be56139 100644
--- a/package/sdl_ttf/Config.in
+++ b/package/sdl_ttf/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SDL_TTF
 	bool "SDL_TTF"
-	depends on BR2_PACKAGE_SDL
 	select BR2_PACKAGE_FREETYPE
 	help
 	  SDL_ttf is a sample TrueType font library. It allows you to
-- 
2.7.4
