From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:51:08 +0100
Subject: [Buildroot] [git commit] package/lua-rotas: new package
Message-ID: <20200112214502.B12487F9F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afbe86c976cce19c46db905a19f87f96f8b80b50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                |  1 +
 package/lua-rotas/Config.in      |  6 ++++++
 package/lua-rotas/lua-rotas.hash |  3 +++
 package/lua-rotas/lua-rotas.mk   | 12 ++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 43fcc20d47..fce134224e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -655,6 +655,7 @@ menu "Lua libraries/modules"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
 	source "package/lua-resty-http/Config.in"
+	source "package/lua-rotas/Config.in"
 	source "package/lua-sailor/Config.in"
 	source "package/lua-sdl2/Config.in"
 	source "package/lua-std-debug/Config.in"
diff --git a/package/lua-rotas/Config.in b/package/lua-rotas/Config.in
new file mode 100644
index 0000000000..565efce93c
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
index 0000000000..6f8d0df41e
--- /dev/null
+++ b/package/lua-rotas/lua-rotas.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 be47e72ec703ffc319fe4fd539b531bbe8a8c0c52e0cc9774273028f1599a0cf  lua-rotas-0.2.0-1.src.rock
+sha256 4a7fdc0e44509d79c9bf18560cfb98368f70bb3832abe07e3cdba5c06466b0bb  lua-Rotas-0.2.0/COPYRIGHT
diff --git a/package/lua-rotas/lua-rotas.mk b/package/lua-rotas/lua-rotas.mk
new file mode 100644
index 0000000000..6ace963a4b
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
