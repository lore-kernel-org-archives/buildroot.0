From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 09:59:32 +0200
Subject: [Buildroot] [PATCH 9/9] lua-markdown: new package
In-Reply-To: <20170924075932.5990-1-francois.perrad@gadz.org>
References: <20170924075932.5990-1-francois.perrad@gadz.org>
Message-ID: <20170924075932.5990-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                     |  1 +
 package/lua-markdown/Config.in        |  7 +++++++
 package/lua-markdown/lua-mardown.hash |  2 ++
 package/lua-markdown/lua-mardown.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/lua-markdown/Config.in
 create mode 100644 package/lua-markdown/lua-mardown.hash
 create mode 100644 package/lua-markdown/lua-mardown.mk

diff --git a/package/Config.in b/package/Config.in
index f9a9d476f..c8392eb69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -579,6 +579,7 @@ menu "Lua libraries/modules"
 	source "package/lua-ev/Config.in"
 	source "package/lua-flu/Config.in"
 	source "package/lua-iconv/Config.in"
+	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
diff --git a/package/lua-markdown/Config.in b/package/lua-markdown/Config.in
new file mode 100644
index 000000000..c53dc4606
--- /dev/null
+++ b/package/lua-markdown/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_MARKDOWN
+	bool "lua-markdown"
+	help
+	  A pure-lua implementation of the Markdown text-to-html
+	  markup system.
+
+	  https://github.com/mpeterv/markdown
diff --git a/package/lua-markdown/lua-mardown.hash b/package/lua-markdown/lua-mardown.hash
new file mode 100644
index 000000000..9bfbf6007
--- /dev/null
+++ b/package/lua-markdown/lua-mardown.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bed84231bb48322f8e614b4392181c52c36bc71340f9273e0c3bd72dc922bc07  markdown-0.33-1.src.rock
diff --git a/package/lua-markdown/lua-mardown.mk b/package/lua-markdown/lua-mardown.mk
new file mode 100644
index 000000000..a98f3125a
--- /dev/null
+++ b/package/lua-markdown/lua-mardown.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-markdown
+#
+################################################################################
+
+LUA_MARKDOWN_VERSION = 0.33-1
+LUA_MARKDOWN_NAME_UPSTREAM = markdown
+LUA_MARKDOWN_SUBDIR = markdown
+LUA_MARKDOWN_LICENSE = MIT
+LUA_MARKDOWN_LICENSE_FILES = $(LUA_MARKDOWN_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
-- 
2.11.0
