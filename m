From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  9 Dec 2017 10:17:10 +0100
Subject: [Buildroot] [PATCH 1/2] luadbi: new package
Message-ID: <20171209091711.20226-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in          |  1 +
 package/luadbi/Config.in   | 11 +++++++++++
 package/luadbi/luadbi.hash |  2 ++
 package/luadbi/luadbi.mk   | 12 ++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/luadbi/Config.in
 create mode 100644 package/luadbi/luadbi.hash
 create mode 100644 package/luadbi/luadbi.mk

diff --git a/package/Config.in b/package/Config.in
index fe5ccc434..bd261126e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -602,6 +602,7 @@ menu "Lua libraries/modules"
 	source "package/lua-testmore/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
+	source "package/luadbi/Config.in"
 	source "package/luaexpat/Config.in"
 	source "package/luaexpatutils/Config.in"
 	source "package/luafilesystem/Config.in"
diff --git a/package/luadbi/Config.in b/package/luadbi/Config.in
new file mode 100644
index 000000000..663c6f9fb
--- /dev/null
+++ b/package/luadbi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LUADBI
+	bool "luadbi"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  LuaDBI is a database interface library for Lua.
+	  It is designed to provide a RDBMS agnostic API for handling
+	  database operations. LuaDBI also provides support for
+	  prepared statement handles, placeholders and bind parameters
+	  for all database operations.
+
+	  https://github.com/mwild1/luadbi
diff --git a/package/luadbi/luadbi.hash b/package/luadbi/luadbi.hash
new file mode 100644
index 000000000..e5c022bdf
--- /dev/null
+++ b/package/luadbi/luadbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 723f63b744b7367ddfd6bbf7a7e6f6867aa1eaabbbc2bab5dc8a90e80b0c34c2  luadbi-0.6-2.src.rock
diff --git a/package/luadbi/luadbi.mk b/package/luadbi/luadbi.mk
new file mode 100644
index 000000000..268e0e628
--- /dev/null
+++ b/package/luadbi/luadbi.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# luadbi
+#
+################################################################################
+
+LUADBI_VERSION = 0.6-2
+LUADBI_LICENSE = MIT
+LUADBI_SUBDIR = luadbi
+LUADBI_LICENSE_FILES = $(LUADBI_SUBDIR)/COPYING
+
+$(eval $(luarocks-package))
-- 
2.11.0
