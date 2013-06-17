From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jun 2013 23:13:41 +0200
Subject: [Buildroot] [git commit] lua-ev: New package
Message-ID: <20130617212030.88B6C9AEE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1286135afce5aa02e5794d7f036462d8396a8e42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lua bindings for libev

[Peter: fix file header]
Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/lua-ev/Config.in |    7 +++++++
 package/lua-ev/lua-ev.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2d32a9f..92927e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -320,6 +320,7 @@ source "package/luacjson/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
+source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
new file mode 100644
index 0000000..1e89c27
--- /dev/null
+++ b/package/lua-ev/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_EV
+	bool "lua-ev"
+	select BR2_PACKAGE_LIBEV
+	help
+	  Get access to the libev library from Lua.
+
+	  https://github.com/brimworks/lua-ev
diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
new file mode 100644
index 0000000..2b03936
--- /dev/null
+++ b/package/lua-ev/lua-ev.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-ev
+#
+################################################################################
+
+LUA_EV_VERSION = 458165b
+LUA_EV_SITE = http://github.com/brimworks/lua-ev/tarball/$(LUA_EV_VERSION)
+LUA_EV_DEPENDENCIES = lua libev
+LUA_EV_LICENSE = MIT
+LUA_EV_LICENSE_FILES = README
+LUA_EV_CONF_OPT = -DINSTALL_CMOD="/usr/lib/lua"
+
+$(eval $(cmake-package))
