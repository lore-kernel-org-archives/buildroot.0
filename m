From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:52 +0100
Subject: [Buildroot] [PATCH 16/24] lua-testmore: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-17-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                    |    1 +
 package/lua-testmore/Config.in       |    6 ++++++
 package/lua-testmore/lua-testmore.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/lua-testmore/Config.in
 create mode 100644 package/lua-testmore/lua-testmore.mk

diff --git a/package/Config.in b/package/Config.in
index 32fd6f6..7b6ace6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -378,6 +378,7 @@ source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-iconv/Config.in"
 source "package/lua-msgpack-native/Config.in"
+source "package/lua-testmore/Config.in"
 source "package/luasql-sqlite3/Config.in"
 source "package/luabitop/Config.in"
 source "package/luacrypto/Config.in"
diff --git a/package/lua-testmore/Config.in b/package/lua-testmore/Config.in
new file mode 100644
index 0000000..61dea3a
--- /dev/null
+++ b/package/lua-testmore/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_TESTMORE
+	bool "lua-testmore"
+	help
+	  an Unit Testing Framework.
+
+	  http://fperrad.github.io/lua-TestMore/
diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
new file mode 100644
index 0000000..fcbb170
--- /dev/null
+++ b/package/lua-testmore/lua-testmore.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-testmore
+#
+################################################################################
+
+LUA_TESTMORE_VERSION_UPSTREAM = 0.3.1
+LUA_TESTMORE_VERSION = $(LUA_TESTMORE_VERSION_UPSTREAM)-1
+LUA_TESTMORE_SUBDIR  = lua-TestMore-$(LUA_TESTMORE_VERSION_UPSTREAM)
+LUA_TESTMORE_LICENSE = MIT
+LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
-- 
1.7.9.5
