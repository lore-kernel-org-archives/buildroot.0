From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 18:18:58 +0200
Subject: [Buildroot] [PATCH 5/6] lua-basexx: new package
In-Reply-To: <20170924161859.10994-1-francois.perrad@gadz.org>
References: <20170924161859.10994-1-francois.perrad@gadz.org>
Message-ID: <20170924161859.10994-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |  1 +
 package/lua-basexx/Config.in       |  8 ++++++++
 package/lua-basexx/lua-basexx.hash |  2 ++
 package/lua-basexx/lua-basexx.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/lua-basexx/Config.in
 create mode 100644 package/lua-basexx/lua-basexx.hash
 create mode 100644 package/lua-basexx/lua-basexx.mk

diff --git a/package/Config.in b/package/Config.in
index b4dc699a9..2e3339a91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -570,6 +570,7 @@ menu "Lua libraries/modules"
 	source "package/lpty/Config.in"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
+	source "package/lua-basexx/Config.in"
 	source "package/lua-bit32/Config.in"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
diff --git a/package/lua-basexx/Config.in b/package/lua-basexx/Config.in
new file mode 100644
index 000000000..2f3bb1dec
--- /dev/null
+++ b/package/lua-basexx/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_BASEXX
+	bool "lua-basexx"
+	help
+	  A Lua library which provides base2(bitfield), base16(hex),
+	  base32(crockford/rfc), base64(rfc/url), base85(z85) decoding
+	  and encoding.
+
+	  https://github.com/aiq/basexx
diff --git a/package/lua-basexx/lua-basexx.hash b/package/lua-basexx/lua-basexx.hash
new file mode 100644
index 000000000..91c428c14
--- /dev/null
+++ b/package/lua-basexx/lua-basexx.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ff5379b1f5b396103b8bb589ab3dd94d0a727c8e7a48dcfe1c73e2f07af6a8df  basexx-0.4.0-1.src.rock
diff --git a/package/lua-basexx/lua-basexx.mk b/package/lua-basexx/lua-basexx.mk
new file mode 100644
index 000000000..bfdc1e27b
--- /dev/null
+++ b/package/lua-basexx/lua-basexx.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-basexx
+#
+################################################################################
+
+LUA_BASEXX_VERSION_UPSTREAM =0.4.0
+LUA_BASEXX_VERSION = $(LUA_BASEXX_VERSION_UPSTREAM)-1
+LUA_BASEXX_NAME_UPSTREAM = basexx
+LUA_BASEXX_SUBDIR = basexx-$(LUA_BASEXX_VERSION_UPSTREAM)
+LUA_BASEXX_LICENSE = MIT
+LUA_BASEXX_LICENSE_FILES = $(LUA_BASEXX_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
-- 
2.11.0
