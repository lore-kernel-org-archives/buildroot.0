From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  9 Jan 2020 19:02:22 +0100
Subject: [Buildroot] [PATCH 1/2] lua-rotas: new package
Message-ID: <20200109180223.21214-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                |  1 +
 package/lua-rotas/Config.in      |  6 ++++++
 package/lua-rotas/lua-rotas.hash |  3 +++
 package/lua-rotas/lua-rotas.mk   | 12 ++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/lua-rotas/Config.in
 create mode 100644 package/lua-rotas/lua-rotas.hash
 create mode 100644 package/lua-rotas/lua-rotas.mk

diff --git a/package/Config.in b/package/Config.in
index fc97e6eb4..67a49f0ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -641,6 +641,7 @@ menu "Lua libraries/modules"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
 	source "package/lua-resty-http/Config.in"
+	source "package/lua-rotas/Config.in"
 	source "package/lua-sailor/Config.in"
 	source "package/lua-sdl2/Config.in"
 	source "package/lua-std-debug/Config.in"
diff --git a/package/lua-rotas/Config.in b/package/lua-rotas/Config.in
new file mode 100644
index 000000000..565efce93
--- /dev/null
+++ b/package/lua-rotas/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_ROTAS
+	bool "lua-rotas"
+	help
+	  a web server router.
+
+	  https://fperrad.frama.io/lua-Rotas
diff --git a/package/lua-rotas/lua-rotas.hash b/package/lua-rotas/lua-rotas.hash
new file mode 100644
index 000000000..6f8d0df41
--- /dev/null
+++ b/package/lua-rotas/lua-rotas.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 be47e72ec703ffc319fe4fd539b531bbe8a8c0c52e0cc9774273028f1599a0cf  lua-rotas-0.2.0-1.src.rock
+sha256 4a7fdc0e44509d79c9bf18560cfb98368f70bb3832abe07e3cdba5c06466b0bb  lua-Rotas-0.2.0/COPYRIGHT
diff --git a/package/lua-rotas/lua-rotas.mk b/package/lua-rotas/lua-rotas.mk
new file mode 100644
index 000000000..6ace963a4
--- /dev/null
+++ b/package/lua-rotas/lua-rotas.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-rotas
+#
+################################################################################
+
+LUA_ROTAS_VERSION = 0.2.0-1
+LUA_ROTAS_NAME_UPSTREAM = lua-Rotas
+LUA_ROTAS_LICENSE = MIT
+LUA_ROTAS_LICENSE_FILES = $(LUA_ROTAS_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
-- 
2.20.1
