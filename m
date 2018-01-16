From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:15:54 +0100
Subject: [Buildroot] [git commit] lua-utf8: new package
Message-ID: <20180116222013.9C671839DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e1e04802f3cd59e4c4e4539d0ceee622b0c0060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/lua-utf8/Config.in     |  7 +++++++
 package/lua-utf8/lua-utf8.hash |  2 ++
 package/lua-utf8/lua-utf8.mk   | 12 ++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8e8e758..713d701 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -606,6 +606,7 @@ menu "Lua libraries/modules"
 	source "package/lua-sdl2/Config.in"
 	source "package/lua-stdlib/Config.in"
 	source "package/lua-testmore/Config.in"
+	source "package/lua-utf8/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
 	source "package/luadbi/Config.in"
diff --git a/package/lua-utf8/Config.in b/package/lua-utf8/Config.in
new file mode 100644
index 0000000..313fa4e
--- /dev/null
+++ b/package/lua-utf8/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_UTF8
+	bool "lua-utf8"
+	help
+	  This module adds UTF-8 support to Lua.
+	  It's compatible with Lua "string" module.
+
+	  http://github.com/starwing/luautf8
diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
new file mode 100644
index 0000000..51fa243
--- /dev/null
+++ b/package/lua-utf8/lua-utf8.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c9ceb3a9f327b3215cdf959eebf616970b5b0427ca3fde05b19f8236defa4b91  utf8-1.2-0.src.rock
diff --git a/package/lua-utf8/lua-utf8.mk b/package/lua-utf8/lua-utf8.mk
new file mode 100644
index 0000000..7ed4f3f
--- /dev/null
+++ b/package/lua-utf8/lua-utf8.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-utf8
+#
+################################################################################
+
+LUA_UTF8_VERSION = 1.2-0
+LUA_UTF8_NAME_UPSTREAM = utf8
+LUA_UTF8_SUBDIR = luautf8
+LUA_UTF8_LICENSE = MIT
+
+$(eval $(luarocks-package))
