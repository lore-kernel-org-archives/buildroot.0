From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 18:54:59 +0100
Subject: [Buildroot] [git commit] package/lua-binaryheap: new package
Message-ID: <20190328180054.458F0886DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=782ce96aaaeb1eff3183bae2118c8f905c300622
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/lua-binaryheap/Config.in           |  6 ++++++
 package/lua-binaryheap/lua-binaryheap.hash |  2 ++
 package/lua-binaryheap/lua-binaryheap.mk   | 12 ++++++++++++
 4 files changed, 21 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f73c8cbffc..512eed7eaa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -603,6 +603,7 @@ menu "Lua libraries/modules"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
 	source "package/lua-basexx/Config.in"
+	source "package/lua-binaryheap/Config.in"
 	source "package/lua-bit32/Config.in"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
diff --git a/package/lua-binaryheap/Config.in b/package/lua-binaryheap/Config.in
new file mode 100644
index 0000000000..fa0b304a58
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
index 0000000000..3713ea331e
--- /dev/null
+++ b/package/lua-binaryheap/lua-binaryheap.hash
@@ -0,0 +1,2 @@
+# computed by luarocks/buildroot
+sha256 ecce14dedfa7a1938aa2383c83036b98461876934f169384a2cec6bb46462d87  binaryheap-0.4-1.src.rock
diff --git a/package/lua-binaryheap/lua-binaryheap.mk b/package/lua-binaryheap/lua-binaryheap.mk
new file mode 100644
index 0000000000..56958e6ff9
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
