From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:22:41 +0100
Subject: [Buildroot] [git commit] lua-messagepack: new package
Message-ID: <20140301152304.8D0E8903EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d56e04ae6e9ebd769c0720c68564dbb3b88456e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/lua-messagepack/Config.in          |    7 +++++++
 package/lua-messagepack/lua-messagepack.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3b143c5..cc407e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -381,6 +381,7 @@ source "package/lua-cjson/Config.in"
 source "package/lua-coat/Config.in"
 source "package/lua-coatpersistent/Config.in"
 source "package/lua-ev/Config.in"
+source "package/lua-messagepack/Config.in"
 source "package/lua-msgpack-native/Config.in"
 source "package/lua-testmore/Config.in"
 source "package/luasql-sqlite3/Config.in"
diff --git a/package/lua-messagepack/Config.in b/package/lua-messagepack/Config.in
new file mode 100644
index 0000000..2dab316
--- /dev/null
+++ b/package/lua-messagepack/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_MESSAGEPACK
+	bool "lua-messagepack"
+	help
+	  A pure Lua implementation of the MessagePack serialization
+	  format.
+
+	  http://fperrad.github.io/lua-MessagePack/
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
