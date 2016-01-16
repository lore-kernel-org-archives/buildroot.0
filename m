From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:00 +0100
Subject: [Buildroot] [PATCH 68/80 v1] package/sdl: include SDL external
	libraries from sdl's Config.in
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <c7b105c64a5996695cd389a545d0f12909568b26.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in     | 6 ------
 package/sdl/Config.in | 9 +++++++++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 73f69ef..ccf6d3c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -264,12 +264,6 @@ endif
 	source "package/ocrad/Config.in"
 	source "package/psplash/Config.in"
 	source "package/sdl/Config.in"
-	source "package/sdl_gfx/Config.in"
-	source "package/sdl_image/Config.in"
-	source "package/sdl_mixer/Config.in"
-	source "package/sdl_net/Config.in"
-	source "package/sdl_sound/Config.in"
-	source "package/sdl_ttf/Config.in"
 	source "package/sdl2/Config.in"
 
 comment "Other GUIs"
diff --git a/package/sdl/Config.in b/package/sdl/Config.in
index e0a4437..bba089c 100644
--- a/package/sdl/Config.in
+++ b/package/sdl/Config.in
@@ -27,4 +27,13 @@ config BR2_PACKAGE_SDL_X11
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 
+comment "External libraries"
+
+source "package/sdl_gfx/Config.in"
+source "package/sdl_image/Config.in"
+source "package/sdl_mixer/Config.in"
+source "package/sdl_net/Config.in"
+source "package/sdl_sound/Config.in"
+source "package/sdl_ttf/Config.in"
+
 endif
-- 
1.9.1
