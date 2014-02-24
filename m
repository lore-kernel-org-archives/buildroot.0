From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:55 +0100
Subject: [Buildroot] [PATCH 19/24] lua-messagepack: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-20-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                          |    1 +
 package/lua-messagepack/Config.in          |    7 +++++++
 package/lua-messagepack/lua-messagepack.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/lua-messagepack/Config.in
 create mode 100644 package/lua-messagepack/lua-messagepack.mk

diff --git a/package/Config.in b/package/Config.in
index 3ed5f34..4e32d25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -379,6 +379,7 @@ source "package/lua-coat/Config.in"
 source "package/lua-coatpersistent/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-iconv/Config.in"
+source "package/lua-messagepack/Config.in"
 source "package/lua-msgpack-native/Config.in"
 source "package/lua-testmore/Config.in"
 source "package/luasql-sqlite3/Config.in"
diff --git a/package/lua-messagepack/Config.in b/package/lua-messagepack/Config.in
new file mode 100644
index 0000000..f44fa3b
--- /dev/null
+++ b/package/lua-messagepack/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_MESSAGEPACK
+	bool "lua-messagepack"
+	help
+	  a pure Lua implementation of the MessagePack serialization format
+
+	  http://fperrad.github.io/lua-MessagePack/
+
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
new file mode 100644
index 0000000..9a680ee
--- /dev/null
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-messagepack
+#
+################################################################################
+
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.0
+LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
+LUA_MESSAGEPACK_SUBDIR  = lua-MessagePack-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)
+LUA_MESSAGEPACK_LICENSE = MIT
+LUA_MESSAGEPACK_LICENSE_FILES = $(LUA_MESSAGEPACK_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
-- 
1.7.9.5
