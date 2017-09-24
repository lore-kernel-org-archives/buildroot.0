From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 17:23:52 +0200
Subject: [Buildroot] [git commit] lua-sailor: new package
Message-ID: <20170924151731.BAA098014B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa902fc508961e50c71852a5ca8865a2eb4f1e09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Arnout: rewrap help text]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                  |  1 +
 package/lua-sailor/Config.in       | 15 +++++++++++++++
 package/lua-sailor/lua-sailor.hash |  2 ++
 package/lua-sailor/lua-sailor.mk   | 13 +++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ddfcd28..762d3e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -599,6 +599,7 @@ menu "Lua libraries/modules"
 	source "package/luaossl/Config.in"
 	source "package/luaposix/Config.in"
 	source "package/lua-resty-http/Config.in"
+	source "package/lua-sailor/Config.in"
 	source "package/luasec/Config.in"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
diff --git a/package/lua-sailor/Config.in b/package/lua-sailor/Config.in
new file mode 100644
index 0000000..2600d46
--- /dev/null
+++ b/package/lua-sailor/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LUA_SAILOR
+	bool "lua-sailor"
+	# These are runtime dependencies
+	select BR2_PACKAGE_CGILUA
+	select BR2_PACKAGE_LBASE64
+	select BR2_PACKAGE_LUAFILESYSTEM
+	select BR2_PACKAGE_LUA_DATAFILE
+	select BR2_PACKAGE_LUA_VALUA
+	select BR2_PACKAGE_XAVANTE
+	select BR2_PACKAGE_WSAPI_XAVANTE
+	help
+	  Sailor is a web framework written in Lua that follows the MVC
+	  design pattern.
+
+	  http://sailorproject.org/
diff --git a/package/lua-sailor/lua-sailor.hash b/package/lua-sailor/lua-sailor.hash
new file mode 100644
index 0000000..f4c42cc
--- /dev/null
+++ b/package/lua-sailor/lua-sailor.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4f7f43a7cf6c62712a521ebaf5f53aaf230039c7fb06480ae168c3aa036120bf  sailor-0.5-4.src.rock
diff --git a/package/lua-sailor/lua-sailor.mk b/package/lua-sailor/lua-sailor.mk
new file mode 100644
index 0000000..17fbd7c
--- /dev/null
+++ b/package/lua-sailor/lua-sailor.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-sailor
+#
+################################################################################
+
+LUA_SAILOR_VERSION = 0.5-4
+LUA_SAILOR_NAME_UPSTREAM = sailor
+LUA_SAILOR_SUBDIR = sailor
+LUA_SAILOR_LICENSE = MIT
+LUA_SAILOR_LICENSE_FILES = $(LUA_SAILOR_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
