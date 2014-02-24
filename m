From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:47 +0100
Subject: [Buildroot] [PATCH 11/24] lua-iconv: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-12-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |    1 +
 package/lua-iconv/Config.in    |    9 +++++++++
 package/lua-iconv/lua-iconv.mk |   13 +++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/lua-iconv/Config.in
 create mode 100644 package/lua-iconv/lua-iconv.mk

diff --git a/package/Config.in b/package/Config.in
index 29a0245..5f3ef17 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -374,6 +374,7 @@ source "package/ljsyscall/Config.in"
 source "package/lpeg/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
+source "package/lua-iconv/Config.in"
 source "package/lua-msgpack-native/Config.in"
 source "package/luasql-sqlite3/Config.in"
 source "package/luabitop/Config.in"
diff --git a/package/lua-iconv/Config.in b/package/lua-iconv/Config.in
new file mode 100644
index 0000000..2d9248c
--- /dev/null
+++ b/package/lua-iconv/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUA_ICONV
+	bool "lua-iconv"
+	select BR2_PACKAGE_LIBICONV
+	depends on !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	help
+	  Lua binding to the POSIX 'iconv' library
+
+	  http://ittner.github.io/lua-iconv/
diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
new file mode 100644
index 0000000..edb901e
--- /dev/null
+++ b/package/lua-iconv/lua-iconv.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-iconv
+#
+################################################################################
+
+LUA_ICONV_VERSION_UPSTREAM = 7
+LUA_ICONV_VERSION = $(LUA_ICONV_VERSION_UPSTREAM)-1
+LUA_ICONV_SUBDIR  = lua-iconv-$(LUA_ICONV_VERSION_UPSTREAM)
+LUA_ICONV_LICENSE = MIT
+LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING
+
+$(eval $(luarocks-package))
-- 
1.7.9.5
