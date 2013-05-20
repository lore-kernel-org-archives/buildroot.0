From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 15:56:37 +0300
Subject: [Buildroot] [PATCH 05/12] lua-ev: New package
In-Reply-To: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1369054604-26139-5-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lua bindings for libev

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/Config.in        |  1 +
 package/lua-ev/Config.in |  7 +++++++
 package/lua-ev/lua-ev.mk | 16 ++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/lua-ev/Config.in
 create mode 100644 package/lua-ev/lua-ev.mk

diff --git a/package/Config.in b/package/Config.in
index 0845881..e94cb39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -312,6 +312,7 @@ source "package/luacjson/Config.in"
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
index 0000000..208a1ba
--- /dev/null
+++ b/package/lua-ev/lua-ev.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# lua-ev
+#
+#############################################################
+
+LUA_EV_VERSION = master
+LUA_EV_SITE = git://github.com/brimworks/lua-ev.git
+LUA_EV_SITE_METHOD = git
+LUA_EV_DEPENDENCIES = lua libev
+LUA_EV_LICENSE = MIT
+LUA_EV_LICENSE_FILES = README
+LUA_EV_CONF_OPT = -DINSTALL_CMOD="/usr/lib/lua"
+
+$(eval $(cmake-package))
+
-- 
1.8.1.2
