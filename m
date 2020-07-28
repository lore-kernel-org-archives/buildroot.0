From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 28 Jul 2020 15:21:45 +0200
Subject: [Buildroot] [PATCH v3 08/10] package/lua-sdl2: temporarily disabled
 with Lua 5.4
In-Reply-To: <20200728132147.3155274-1-francois.perrad@gadz.org>
References: <20200728132147.3155274-1-francois.perrad@gadz.org>
Message-ID: <20200728132147.3155274-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-sdl2/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lua-sdl2/Config.in b/package/lua-sdl2/Config.in
index 65f9e7ff4..d0c1b91eb 100644
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
-- 
2.25.1
