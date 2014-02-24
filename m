From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:53 +0100
Subject: [Buildroot] [PATCH 17/24] lua-coat: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-18-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in            |    1 +
 package/lua-coat/Config.in   |    6 ++++++
 package/lua-coat/lua-coat.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/lua-coat/Config.in
 create mode 100644 package/lua-coat/lua-coat.mk

diff --git a/package/Config.in b/package/Config.in
index 7b6ace6..c494d64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -375,6 +375,7 @@ source "package/ljsyscall/Config.in"
 source "package/lpeg/Config.in"
 source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
+source "package/lua-coat/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-iconv/Config.in"
 source "package/lua-msgpack-native/Config.in"
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
-- 
1.7.9.5
