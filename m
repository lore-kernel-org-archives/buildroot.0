From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 09:22:49 +0100
Subject: [Buildroot] [git commit] luadbi-sqlite3: new package
Message-ID: <20171215082308.839CE80FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=569ef2e889c9d85d95c6bf3d4ea90a36a7b2f2d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/luadbi-sqlite3/Config.in           |  9 +++++++++
 package/luadbi-sqlite3/luadbi-sqlite3.hash |  2 ++
 package/luadbi-sqlite3/luadbi-sqlite3.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 91760ef..a81408d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -607,6 +607,7 @@ menu "Lua libraries/modules"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
 	source "package/luadbi/Config.in"
+	source "package/luadbi-sqlite3/Config.in"
 	source "package/luaexpat/Config.in"
 	source "package/luaexpatutils/Config.in"
 	source "package/luafilesystem/Config.in"
diff --git a/package/luadbi-sqlite3/Config.in b/package/luadbi-sqlite3/Config.in
new file mode 100644
index 0000000..6ed32a2
--- /dev/null
+++ b/package/luadbi-sqlite3/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUADBI_SQLITE3
+	bool "luadbi-sqlite3"
+	select BR2_PACKAGE_LUADBI # runtime dependency
+	select BR2_PACKAGE_SQLITE
+	help
+	  LuaDBI is a database interface library for Lua.
+	  And this is the SQLite3 backend.
+
+	  https://github.com/mwild1/luadbi
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.hash b/package/luadbi-sqlite3/luadbi-sqlite3.hash
new file mode 100644
index 0000000..bd8b927
--- /dev/null
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2868dad4d189368fcf5cddd191965c8cb2efaa3a3ba83d50e6a88c30353f74ce  luadbi-sqlite3-0.6-2.src.rock
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.mk b/package/luadbi-sqlite3/luadbi-sqlite3.mk
new file mode 100644
index 0000000..422fa1e
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
