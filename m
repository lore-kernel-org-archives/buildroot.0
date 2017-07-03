From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 00:47:05 +0200
Subject: [Buildroot] [git commit] package/lua-stdlib: new package
Message-ID: <20170703224558.AE99381EE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0111ced7705f4038eb91a66e7f055a4994246751
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/lua-stdlib/Config.in       |  9 +++++++++
 package/lua-stdlib/lua-stdlib.hash |  2 ++
 package/lua-stdlib/lua-stdlib.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 22016a5..b8757fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1085,6 +1085,7 @@ F:	package/argparse/
 F:	package/dt-utils/
 F:	package/easydbus/
 F:	package/lua-flu/
+F:	package/lua-stdlib/
 F:	package/luaossl/
 F:	package/rs485conf/
 F:	package/turbolua/
diff --git a/package/Config.in b/package/Config.in
index 4c7852d..bc5ad0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -574,6 +574,7 @@ menu "Lua libraries/modules"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
 	source "package/lua-sdl2/Config.in"
+	source "package/lua-stdlib/Config.in"
 	source "package/lua-testmore/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
diff --git a/package/lua-stdlib/Config.in b/package/lua-stdlib/Config.in
new file mode 100644
index 0000000..1843826
--- /dev/null
+++ b/package/lua-stdlib/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUA_STDLIB
+	bool "lua-stdlib"
+	help
+	  lua-stdlib is a library of modules for common programming
+	  tasks, including list, table and functional operations,
+	  objects, pickling, pretty-printing and command-line option
+	  parsing.
+
+	  https://github.com/lua-stdlib/lua-stdlib/
diff --git a/package/lua-stdlib/lua-stdlib.hash b/package/lua-stdlib/lua-stdlib.hash
new file mode 100644
index 0000000..56f585d
--- /dev/null
+++ b/package/lua-stdlib/lua-stdlib.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5eff1af3a16470297fa5a92c9525ae593644ae9dc0e6215158298711f5d829ee  stdlib-41.2.0-1.src.rock
diff --git a/package/lua-stdlib/lua-stdlib.mk b/package/lua-stdlib/lua-stdlib.mk
new file mode 100644
index 0000000..f7fb0ff
--- /dev/null
+++ b/package/lua-stdlib/lua-stdlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-stdlib
+#
+################################################################################
+
+LUA_STDLIB_VERSION_UPSTREAM = 41.2.0
+LUA_STDLIB_VERSION = $(LUA_STDLIB_VERSION_UPSTREAM)-1
+LUA_STDLIB_NAME_UPSTREAM = stdlib
+LUA_STDLIB_SUBDIR = lua-stdlib-release-v$(LUA_STDLIB_VERSION_UPSTREAM)
+LUA_STDLIB_LICENSE = MIT
+LUA_STDLIB_LICENSE_FILES = $(LUA_STDLIB_SUBDIR)/COPYING
+
+$(eval $(luarocks-package))
