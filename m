From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 23:48:47 +0200
Subject: [Buildroot] [git commit] lua-lpeg-patterns: new package
Message-ID: <20171011214239.A31E680284@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2b7ed122abd9a311ac6a6467818557ab008e0b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |  1 +
 package/lua-lpeg-patterns/Config.in              |  8 ++++++++
 package/lua-lpeg-patterns/lua-lpeg-patterns.hash |  2 ++
 package/lua-lpeg-patterns/lua-lpeg-patterns.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6f85643..2b05351 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -589,6 +589,7 @@ menu "Lua libraries/modules"
 	source "package/lua-fifo/Config.in"
 	source "package/lua-flu/Config.in"
 	source "package/lua-iconv/Config.in"
+	source "package/lua-lpeg-patterns/Config.in"
 	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
diff --git a/package/lua-lpeg-patterns/Config.in b/package/lua-lpeg-patterns/Config.in
new file mode 100644
index 0000000..9c701d3
--- /dev/null
+++ b/package/lua-lpeg-patterns/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_LPEG_PATTERNS
+	bool "lua-lpeg-patterns"
+	# These are runtime dependencies
+	select BR2_PACKAGE_LPEG
+	help
+	  a collection of LPEG patterns.
+
+	  https://github.com/daurnimator/lpeg_patterns
diff --git a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
new file mode 100644
index 0000000..f779466
--- /dev/null
+++ b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 82c8eddee52069e5ae821b68cb9e295ab5767a47d07545a4ca36ac1e81066086  lpeg_patterns-0.4-0.src.rock
diff --git a/package/lua-lpeg-patterns/lua-lpeg-patterns.mk b/package/lua-lpeg-patterns/lua-lpeg-patterns.mk
new file mode 100644
index 0000000..8f40c99
--- /dev/null
+++ b/package/lua-lpeg-patterns/lua-lpeg-patterns.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-lpeg-patterns
+#
+################################################################################
+
+LUA_LPEG_PATTERNS_VERSION = 0.4-0
+LUA_LPEG_PATTERNS_NAME_UPSTREAM = lpeg_patterns
+LUA_LPEG_PATTERNS_ROCKSPEC = $(LUA_LPEG_PATTERNS_NAME_UPSTREAM)-$(LUA_LPEG_PATTERNS_VERSION).rockspec
+LUA_LPEG_PATTERNS_SOURCE = $(LUA_LPEG_PATTERNS_NAME_UPSTREAM)-$(LUA_LPEG_PATTERNS_VERSION).src.rock
+LUA_LPEG_PATTERNS_LICENSE = MIT
+LUA_LPEG_PATTERNS_LICENSE_FILES = $(LUA_LPEG_PATTERNS_SUBDIR)/LICENSE.md
+
+$(eval $(luarocks-package))
