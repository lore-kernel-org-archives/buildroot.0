From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:49:58 +0100
Subject: [Buildroot] [git commit] package/lua-codegen: new package
Message-ID: <20200106204016.52DF881488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a05c43a3e7bbea266c261e10bedba3c3a06fa05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                    |  1 +
 package/lua-codegen/Config.in        |  6 ++++++
 package/lua-codegen/lua-codegen.hash |  3 +++
 package/lua-codegen/lua-codegen.mk   | 12 ++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 296dbe49d5..3a75561151 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -636,6 +636,7 @@ menu "Lua libraries/modules"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
 	source "package/lua-coatpersistent/Config.in"
+	source "package/lua-codegen/Config.in"
 	source "package/lua-compat53/Config.in"
 	source "package/lua-cqueues/Config.in"
 	source "package/lua-csnappy/Config.in"
diff --git a/package/lua-codegen/Config.in b/package/lua-codegen/Config.in
new file mode 100644
index 0000000000..fbcf5ca487
--- /dev/null
+++ b/package/lua-codegen/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_CODEGEN
+	bool "lua-codegen"
+	help
+	  A template engine.
+
+	  https://fperrad.frama.io/lua-CodeGen
diff --git a/package/lua-codegen/lua-codegen.hash b/package/lua-codegen/lua-codegen.hash
new file mode 100644
index 0000000000..0b49a5a78c
--- /dev/null
+++ b/package/lua-codegen/lua-codegen.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 c09126d7f5d0fa9c867ee9108eb5961dab111320ee35e5f842317f6058e922ec  lua-codegen-0.3.3-1.src.rock
+sha256 f09265c450c3a59558ecc552ea4ba61e5a74dec995738eec545d121718833a80  lua-CodeGen-0.3.3/COPYRIGHT
diff --git a/package/lua-codegen/lua-codegen.mk b/package/lua-codegen/lua-codegen.mk
new file mode 100644
index 0000000000..caa9008e5f
--- /dev/null
+++ b/package/lua-codegen/lua-codegen.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-codegen
+#
+################################################################################
+
+LUA_CODEGEN_VERSION = 0.3.3-1
+LUA_CODEGEN_NAME_UPSTREAM = lua-CodeGen
+LUA_CODEGEN_LICENSE = MIT
+LUA_CODEGEN_LICENSE_FILES = $(LUA_CODEGEN_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
