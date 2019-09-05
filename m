From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  5 Sep 2019 10:08:39 +0200
Subject: [Buildroot] [PATCH] lua-codegen: new package
Message-ID: <20190905080839.11940-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                    |  1 +
 package/lua-codegen/Config.in        |  6 ++++++
 package/lua-codegen/lua-codegen.hash |  3 +++
 package/lua-codegen/lua-codegen.mk   | 12 ++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/lua-codegen/Config.in
 create mode 100644 package/lua-codegen/lua-codegen.hash
 create mode 100644 package/lua-codegen/lua-codegen.mk

diff --git a/package/Config.in b/package/Config.in
index 710ed12be..8b5719d46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -617,6 +617,7 @@ menu "Lua libraries/modules"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
 	source "package/lua-coatpersistent/Config.in"
+	source "package/lua-codegen/Config.in"
 	source "package/lua-compat53/Config.in"
 	source "package/lua-cqueues/Config.in"
 	source "package/lua-csnappy/Config.in"
diff --git a/package/lua-codegen/Config.in b/package/lua-codegen/Config.in
new file mode 100644
index 000000000..bc0ca3d14
--- /dev/null
+++ b/package/lua-codegen/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_CODEGEN
+	bool "lua-codegen"
+	help
+	  a template engine.
+
+	  https://fperrad.frama.io/lua-CodeGen
diff --git a/package/lua-codegen/lua-codegen.hash b/package/lua-codegen/lua-codegen.hash
new file mode 100644
index 000000000..0b49a5a78
--- /dev/null
+++ b/package/lua-codegen/lua-codegen.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 c09126d7f5d0fa9c867ee9108eb5961dab111320ee35e5f842317f6058e922ec  lua-codegen-0.3.3-1.src.rock
+sha256 f09265c450c3a59558ecc552ea4ba61e5a74dec995738eec545d121718833a80  lua-CodeGen-0.3.3/COPYRIGHT
diff --git a/package/lua-codegen/lua-codegen.mk b/package/lua-codegen/lua-codegen.mk
new file mode 100644
index 000000000..caa9008e5
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
-- 
2.20.1
