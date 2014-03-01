From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:19:24 +0100
Subject: [Buildroot] [git commit] lua-coat: new package
Message-ID: <20140301151934.EFEF7903EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a07d3d7a6413bebf6e70a04efe3e8162473e927a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/lua-coat/Config.in   |    6 ++++++
 package/lua-coat/lua-coat.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0085e85..2470313 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -378,6 +378,7 @@ source "package/ljsyscall/Config.in"
 source "package/lpeg/Config.in"
 source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
+source "package/lua-coat/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
 source "package/lua-testmore/Config.in"
diff --git a/package/lua-coat/Config.in b/package/lua-coat/Config.in
new file mode 100644
index 0000000..f6ba6cf
--- /dev/null
+++ b/package/lua-coat/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_COAT
+	bool "lua-coat"
+	help
+	  Yet Another Lua Object-Oriented Model
+
+	  http://fperrad.github.io/lua-Coat/
diff --git a/package/lua-coat/lua-coat.mk b/package/lua-coat/lua-coat.mk
new file mode 100644
index 0000000..a9d9143
--- /dev/null
+++ b/package/lua-coat/lua-coat.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-coat
+#
+################################################################################
+
+LUA_COAT_VERSION_UPSTREAM = 0.9.0
+LUA_COAT_VERSION = $(LUA_COAT_VERSION_UPSTREAM)-1
+LUA_COAT_SUBDIR  = lua-Coat-$(LUA_COAT_VERSION_UPSTREAM)
+LUA_COAT_LICENSE = MIT
+LUA_COAT_LICENSE_FILES = $(LUA_COAT_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
