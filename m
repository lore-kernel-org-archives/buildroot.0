From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Mar 2014 18:23:09 +0100
Subject: [Buildroot] [lua V3 8/8] lua-iconv: new package
In-Reply-To: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393694590-29945-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |    1 +
 package/lua-iconv/Config.in    |    8 ++++++++
 package/lua-iconv/lua-iconv.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/lua-iconv/Config.in
 create mode 100644 package/lua-iconv/lua-iconv.mk

diff --git a/package/Config.in b/package/Config.in
index 4a91f48..3558106 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -373,6 +373,7 @@ source "package/ljlinenoise/Config.in"
 source "package/ljsyscall/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
+source "package/lua-iconv/Config.in"
 source "package/lua-msgpack-native/Config.in"
 source "package/luasql-sqlite3/Config.in"
 source "package/luabitop/Config.in"
diff --git a/package/lua-iconv/Config.in b/package/lua-iconv/Config.in
new file mode 100644
index 0000000..cad7c7c
--- /dev/null
+++ b/package/lua-iconv/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_ICONV
+	bool "lua-iconv"
+	select BR2_PACKAGE_LIBICONV
+	depends on !BR2_ENABLE_LOCALE
+	help
+	  Lua binding to the POSIX 'iconv' library
+
+	  http://ittner.github.io/lua-iconv/
diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
new file mode 100644
index 0000000..22f66de
--- /dev/null
+++ b/package/lua-iconv/lua-iconv.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-iconv
+#
+################################################################################
+
+LUA_ICONV_VERSION_UPSTREAM = 7
+LUA_ICONV_VERSION = $(LUA_ICONV_VERSION_UPSTREAM)-1
+LUA_ICONV_SUBDIR  = lua-iconv-$(LUA_ICONV_VERSION_UPSTREAM)
+LUA_ICONV_DEPENDENCIES = luainterpreter libiconv
+LUA_ICONV_LICENSE = MIT
+LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING
+
+$(eval $(luarocks-package))
-- 
1.7.9.5
