From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  9 Dec 2017 10:17:11 +0100
Subject: [Buildroot] [PATCH 2/2] luadbi-sqlite3: new package
In-Reply-To: <20171209091711.20226-1-francois.perrad@gadz.org>
References: <20171209091711.20226-1-francois.perrad@gadz.org>
Message-ID: <20171209091711.20226-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                          |  1 +
 package/luadbi-sqlite3/Config.in           | 10 ++++++++++
 package/luadbi-sqlite3/luadbi-sqlite3.hash |  2 ++
 package/luadbi-sqlite3/luadbi-sqlite3.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/luadbi-sqlite3/Config.in
 create mode 100644 package/luadbi-sqlite3/luadbi-sqlite3.hash
 create mode 100644 package/luadbi-sqlite3/luadbi-sqlite3.mk

diff --git a/package/Config.in b/package/Config.in
index bd261126e..88664d561 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -603,6 +603,7 @@ menu "Lua libraries/modules"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
 	source "package/luadbi/Config.in"
+	source "package/luadbi-sqlite3/Config.in"
 	source "package/luaexpat/Config.in"
 	source "package/luaexpatutils/Config.in"
 	source "package/luafilesystem/Config.in"
diff --git a/package/luadbi-sqlite3/Config.in b/package/luadbi-sqlite3/Config.in
new file mode 100644
index 000000000..7e21b95d5
--- /dev/null
+++ b/package/luadbi-sqlite3/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LUADBI_SQLITE3
+	bool "luadbi-sqlite3"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_LUADBI       # runtime dependency
+	help
+	  LuaDBI is a database interface library for Lua.
+	  And this is the SQLite3 backend.
+
+	  https://github.com/mwild1/luadbi
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.hash b/package/luadbi-sqlite3/luadbi-sqlite3.hash
new file mode 100644
index 000000000..bd8b927fa
--- /dev/null
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2868dad4d189368fcf5cddd191965c8cb2efaa3a3ba83d50e6a88c30353f74ce  luadbi-sqlite3-0.6-2.src.rock
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.mk b/package/luadbi-sqlite3/luadbi-sqlite3.mk
new file mode 100644
index 000000000..422fa1e31
--- /dev/null
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# luadbi-sqlite3
+#
+################################################################################
+
+LUADBI_SQLITE3_VERSION = 0.6-2
+LUADBI_SQLITE3_LICENSE = MIT
+LUADBI_SQLITE3_SUBDIR = luadbi
+LUADBI_SQLITE3_LICENSE_FILES = $(LUADBI_SQLITE3_SUBDIR)/COPYING
+LUADBI_SQLITE3_DEPENDENCIES = sqlite
+
+$(eval $(luarocks-package))
-- 
2.11.0
