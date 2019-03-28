From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 28 Mar 2019 18:20:45 +0100
Subject: [Buildroot] [PATCH 1/4] package/lua-binaryheap: new package
Message-ID: <20190328172048.30238-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                          |  1 +
 package/lua-binaryheap/Config.in           |  6 ++++++
 package/lua-binaryheap/lua-binaryheap.hash |  2 ++
 package/lua-binaryheap/lua-binaryheap.mk   | 12 ++++++++++++
 4 files changed, 21 insertions(+)
 create mode 100644 package/lua-binaryheap/Config.in
 create mode 100644 package/lua-binaryheap/lua-binaryheap.hash
 create mode 100644 package/lua-binaryheap/lua-binaryheap.mk

diff --git a/package/Config.in b/package/Config.in
index af1fcff27..7414f36f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -602,6 +602,7 @@ menu "Lua libraries/modules"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
 	source "package/lua-basexx/Config.in"
+	source "package/lua-binaryheap/Config.in"
 	source "package/lua-bit32/Config.in"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
diff --git a/package/lua-binaryheap/Config.in b/package/lua-binaryheap/Config.in
new file mode 100644
index 000000000..fa0b304a5
--- /dev/null
+++ b/package/lua-binaryheap/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_BINARYHEAP
+	bool "lua-binaryheap"
+	help
+	  Binary heap implementation in pure Lua.
+
+	  https://github.com/Tieske/binaryheap.lua
diff --git a/package/lua-binaryheap/lua-binaryheap.hash b/package/lua-binaryheap/lua-binaryheap.hash
new file mode 100644
index 000000000..3713ea331
--- /dev/null
+++ b/package/lua-binaryheap/lua-binaryheap.hash
@@ -0,0 +1,2 @@
+# computed by luarocks/buildroot
+sha256 ecce14dedfa7a1938aa2383c83036b98461876934f169384a2cec6bb46462d87  binaryheap-0.4-1.src.rock
diff --git a/package/lua-binaryheap/lua-binaryheap.mk b/package/lua-binaryheap/lua-binaryheap.mk
new file mode 100644
index 000000000..56958e6ff
--- /dev/null
+++ b/package/lua-binaryheap/lua-binaryheap.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-binaryheap
+#
+################################################################################
+
+LUA_BINARYHEAP_VERSION = 0.4-1
+LUA_BINARYHEAP_NAME_UPSTREAM = binaryheap
+LUA_BINARYHEAP_SUBDIR = binaryheap.lua-version_0v4
+LUA_BINARYHEAP_LICENSE = MIT
+
+$(eval $(luarocks-package))
-- 
2.17.1
