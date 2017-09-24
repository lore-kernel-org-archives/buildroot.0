From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 17:23:56 +0200
Subject: [Buildroot] [git commit] lua-markdown: new package
Message-ID: <20170924151731.C85658014B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dce00b434fa2622a9bf9b0f17a7fa075e6fca63a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Arnout: name the files lua-markdown instead of lua-mardown]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                      |  1 +
 package/lua-markdown/Config.in         |  7 +++++++
 package/lua-markdown/lua-markdown.hash |  2 ++
 package/lua-markdown/lua-markdown.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 762d3e8..6acd0c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -583,6 +583,7 @@ menu "Lua libraries/modules"
 	source "package/lua-ev/Config.in"
 	source "package/lua-flu/Config.in"
 	source "package/lua-iconv/Config.in"
+	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
diff --git a/package/lua-markdown/Config.in b/package/lua-markdown/Config.in
new file mode 100644
index 0000000..c53dc46
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
diff --git a/package/lua-markdown/lua-markdown.hash b/package/lua-markdown/lua-markdown.hash
new file mode 100644
index 0000000..9bfbf60
--- /dev/null
+++ b/package/lua-markdown/lua-markdown.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bed84231bb48322f8e614b4392181c52c36bc71340f9273e0c3bd72dc922bc07  markdown-0.33-1.src.rock
diff --git a/package/lua-markdown/lua-markdown.mk b/package/lua-markdown/lua-markdown.mk
new file mode 100644
index 0000000..a98f312
--- /dev/null
+++ b/package/lua-markdown/lua-markdown.mk
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
