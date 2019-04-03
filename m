From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:35:35 +0200
Subject: [Buildroot] [git commit] package/lua-lunitx: new package
Message-ID: <20190403193440.AF1858D385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07e852abf974f91ae5122048fa15c6c1a51d41ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                  |  1 +
 package/lua-lunitx/Config.in       |  6 ++++++
 package/lua-lunitx/lua-lunitx.hash |  3 +++
 package/lua-lunitx/lua-lunitx.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index db79b61971..287f3493be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -622,6 +622,7 @@ menu "Lua libraries/modules"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
+	source "package/lua-lunitx/Config.in"
 	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
diff --git a/package/lua-lunitx/Config.in b/package/lua-lunitx/Config.in
new file mode 100644
index 0000000000..ea900e6328
--- /dev/null
+++ b/package/lua-lunitx/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_LUNITX
+	bool "lua-lunitx"
+	help
+	  Lunitx is a unit testing framework for lua, written in lua.
+
+	  https://github.com/dcurrie/lunit
diff --git a/package/lua-lunitx/lua-lunitx.hash b/package/lua-lunitx/lua-lunitx.hash
new file mode 100644
index 0000000000..b97b93f090
--- /dev/null
+++ b/package/lua-lunitx/lua-lunitx.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 2299facf4977f9b663e1ad402098139116a87a693c3df66e1f6b89e2cf47646f  lunitx-0.8-1.src.rock
+sha256 3fcfcd6010d73bc2b22505b6a91779022a82661809a3e4e0a0bdd7b3463def8f  lunit/LICENSE
diff --git a/package/lua-lunitx/lua-lunitx.mk b/package/lua-lunitx/lua-lunitx.mk
new file mode 100644
index 0000000000..e12cf07249
--- /dev/null
+++ b/package/lua-lunitx/lua-lunitx.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-lunitx
+#
+################################################################################
+
+LUA_LUNITX_VERSION = 0.8-1
+LUA_LUNITX_NAME_UPSTREAM = lunitx
+LUA_LUNITX_SUBDIR = lunit
+LUA_LUNITX_LICENSE = MIT
+LUA_LUNITX_LICENSE_FILES = $(LUA_LUNITX_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
