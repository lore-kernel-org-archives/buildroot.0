From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 22 May 2017 15:13:07 +0200
Subject: [Buildroot] [PATCH 3/3] lua-sdl2: new package
In-Reply-To: <20170522131307.27529-1-francois.perrad@gadz.org>
References: <20170522131307.27529-1-francois.perrad@gadz.org>
Message-ID: <20170522131307.27529-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |  1 +
 package/lua-sdl2/Config.in     | 12 ++++++++++++
 package/lua-sdl2/lua-sdl2.hash |  2 ++
 package/lua-sdl2/lua-sdl2.mk   | 13 +++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/lua-sdl2/Config.in
 create mode 100644 package/lua-sdl2/lua-sdl2.hash
 create mode 100644 package/lua-sdl2/lua-sdl2.mk

diff --git a/package/Config.in b/package/Config.in
index 5fa21afc60..be9e6fa666 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -565,6 +565,7 @@ menu "Lua libraries/modules"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
+	source "package/lua-sdl2/Config.in"
 	source "package/lua-testmore/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
diff --git a/package/lua-sdl2/Config.in b/package/lua-sdl2/Config.in
new file mode 100644
index 0000000000..83b84acaa2
--- /dev/null
+++ b/package/lua-sdl2/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUA_SDL2
+	bool "lua-sdl2"
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_SDL2_IMAGE
+	select BR2_PACKAGE_SDL2_MIXER
+	select BR2_PACKAGE_SDL2_NET
+	select BR2_PACKAGE_SDL2_TTF
+	help
+	  Lua-SDL2 is a pure C binding of SDL2 to Lua 5.1, Lua 5.2, Lua 5.3,
+	  and LuaJIT.
+
+	  https://github.com/Tangent128/luasdl2
diff --git a/package/lua-sdl2/lua-sdl2.hash b/package/lua-sdl2/lua-sdl2.hash
new file mode 100644
index 0000000000..56a2eeda6c
--- /dev/null
+++ b/package/lua-sdl2/lua-sdl2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	36b626485529f318f284e0cc0c806d5a425fbde4e1e6329d4d5ee9f495ecff62  lua-sdl2-2.0.5.6.0-1.src.rock
diff --git a/package/lua-sdl2/lua-sdl2.mk b/package/lua-sdl2/lua-sdl2.mk
new file mode 100644
index 0000000000..adb3723c84
--- /dev/null
+++ b/package/lua-sdl2/lua-sdl2.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-sdl2
+#
+################################################################################
+
+LUA_SDL2_VERSION = 2.0.5.6.0-1
+LUA_SDL2_LICENSE = ISC
+LUA_SDL2_SUBDIR = luasdl2-2.0.5-6.0
+LUA_SDL2_LICENSE_FILES = $(LUA_SDL2_SUBDIR)/LICENSE
+LUA_SDL2_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf
+
+$(eval $(luarocks-package))
-- 
2.11.0
