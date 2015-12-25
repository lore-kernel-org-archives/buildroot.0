From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:18 +0100
Subject: [Buildroot] [PATCH 49/84 RFC] package/sdl: include SDL external
	libraries from sdl's Config.in
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <950599acca042e023a7545ccc2bc89dbe54ba605.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in     | 6 ------
 package/sdl/Config.in | 9 +++++++++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a191f43..3edbf49 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,12 +263,6 @@ endif
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
