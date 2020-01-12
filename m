From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:51:57 +0100
Subject: [Buildroot] [git commit] package/lua-silva: new package
Message-ID: <20200112214502.BA7ED7F9F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af8bf0b2ce90394943fbcd62427e7d6cd6b866e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                |  1 +
 package/lua-silva/Config.in      |  6 ++++++
 package/lua-silva/lua-silva.hash |  3 +++
 package/lua-silva/lua-silva.mk   | 12 ++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fce134224e..1049e3735f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -658,6 +658,7 @@ menu "Lua libraries/modules"
 	source "package/lua-rotas/Config.in"
 	source "package/lua-sailor/Config.in"
 	source "package/lua-sdl2/Config.in"
+	source "package/lua-silva/Config.in"
 	source "package/lua-std-debug/Config.in"
 	source "package/lua-std-normalize/Config.in"
 	source "package/lua-stdlib/Config.in"
diff --git a/package/lua-silva/Config.in b/package/lua-silva/Config.in
new file mode 100644
index 0000000000..1ddc3fad97
--- /dev/null
+++ b/package/lua-silva/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_SILVA
+	bool "lua-silva"
+	help
+	  your string matcher expert.
+
+	  https://fperrad.frama.io/lua-Silva
diff --git a/package/lua-silva/lua-silva.hash b/package/lua-silva/lua-silva.hash
new file mode 100644
index 0000000000..7bb04da95c
--- /dev/null
+++ b/package/lua-silva/lua-silva.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 89cfdf6c67b69ff5e18591fb79cfe10c7e5f4923494ed92f426f44e475a9b522  lua-silva-0.1.6-1.src.rock
+sha256 166beeb47e49a35b3ff8c6af91a399046a9cc5e29a8072618b4ca90f5b7a6c95  lua-Silva-0.1.6/COPYRIGHT
diff --git a/package/lua-silva/lua-silva.mk b/package/lua-silva/lua-silva.mk
new file mode 100644
index 0000000000..949e2d36de
--- /dev/null
+++ b/package/lua-silva/lua-silva.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-silva
+#
+################################################################################
+
+LUA_SILVA_VERSION = 0.1.6-1
+LUA_SILVA_NAME_UPSTREAM = lua-Silva
+LUA_SILVA_LICENSE = MIT
+LUA_SILVA_LICENSE_FILES = $(LUA_SILVA_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
