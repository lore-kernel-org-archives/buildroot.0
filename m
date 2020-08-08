From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:29:16 +0200
Subject: [Buildroot] [git commit branch/next] package/lua-sdl2: disable
 temporarily with Lua 5.4
Message-ID: <20200808162412.57E808404C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=567a8a7f1f29b826d64a4f985e8643b343f0b69c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-sdl2/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lua-sdl2/Config.in b/package/lua-sdl2/Config.in
index 65f9e7ff41..d0c1b91eb1 100644
--- a/package/lua-sdl2/Config.in
+++ b/package/lua-sdl2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUA_SDL2
 	bool "lua-sdl2"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_SDL2
 	help
 	  Lua-SDL2 is a pure C binding of SDL2 to Lua 5.1, Lua 5.2,
@@ -8,5 +9,5 @@ config BR2_PACKAGE_LUA_SDL2
 
 	  https://github.com/Tangent128/luasdl2
 
-comment "lua-sdl2 needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "lua-sdl2 needs a toolchain w/ dynamic library, Lua <= 5.3"
+	depends on BR2_STATIC_LIBS || BR2_PACKAGE_LUA_5_4
