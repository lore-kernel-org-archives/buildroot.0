From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 17:23:38 +0200
Subject: [Buildroot] [git commit] lua-valua: new package
Message-ID: <20170924151731.AAA36801BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25e8edcc7f85c71dd5b58751fa8bf3399ba74e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Arnout: rewrap help text]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                |  1 +
 package/lua-valua/Config.in      |  9 +++++++++
 package/lua-valua/lua-valua.hash |  2 ++
 package/lua-valua/lua-valua.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f7b3ad5..ddfcd28 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -602,6 +602,7 @@ menu "Lua libraries/modules"
 	source "package/luasec/Config.in"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
+	source "package/lua-valua/Config.in"
 	source "package/lunit/Config.in"
 	source "package/lutok/Config.in"
 	source "package/luv/Config.in"
diff --git a/package/lua-valua/Config.in b/package/lua-valua/Config.in
new file mode 100644
index 0000000..96b3796
--- /dev/null
+++ b/package/lua-valua/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUA_VALUA
+	bool "lua-valua"
+	help
+	  This module provides tools for validating values, very useful
+	  in forms, but also usable elsewhere. It works in appended
+	  chains. Create a new validation object and start chaining
+	  your test functions.
+
+	  https://github.com/sailorproject/valua
diff --git a/package/lua-valua/lua-valua.hash b/package/lua-valua/lua-valua.hash
new file mode 100644
index 0000000..92ea613
--- /dev/null
+++ b/package/lua-valua/lua-valua.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bff39692fd2ac3590fd814aa1b1ca33e5d5971092955309aa8424b02b88ce1a3  valua-0.3-1.src.rock
diff --git a/package/lua-valua/lua-valua.mk b/package/lua-valua/lua-valua.mk
new file mode 100644
index 0000000..8cb0bf5
--- /dev/null
+++ b/package/lua-valua/lua-valua.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-valua
+#
+################################################################################
+
+LUA_VALUA_VERSION = 0.3-1
+LUA_VALUA_NAME_UPSTREAM = valua
+LUA_VALUA_SUBDIR = valua
+LUA_VALUA_LICENSE = MIT
+LUA_VALUA_LICENSE_FILES = $(LUA_VALUA_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
