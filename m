From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 06:49:57 +0100
Subject: [Buildroot] [git commit] luadbi: new package
Message-ID: <20171214055534.4FEB682DC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26937e1f7d43d98fb0778257c7893d0e3befad17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/luadbi/Config.in   | 10 ++++++++++
 package/luadbi/luadbi.hash |  2 ++
 package/luadbi/luadbi.mk   | 12 ++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c3ebbfc..91760ef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -606,6 +606,7 @@ menu "Lua libraries/modules"
 	source "package/lua-testmore/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
+	source "package/luadbi/Config.in"
 	source "package/luaexpat/Config.in"
 	source "package/luaexpatutils/Config.in"
 	source "package/luafilesystem/Config.in"
diff --git a/package/luadbi/Config.in b/package/luadbi/Config.in
new file mode 100644
index 0000000..2e29058
--- /dev/null
+++ b/package/luadbi/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LUADBI
+	bool "luadbi"
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
index 0000000..e5c022b
--- /dev/null
+++ b/package/luadbi/luadbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 723f63b744b7367ddfd6bbf7a7e6f6867aa1eaabbbc2bab5dc8a90e80b0c34c2  luadbi-0.6-2.src.rock
diff --git a/package/luadbi/luadbi.mk b/package/luadbi/luadbi.mk
new file mode 100644
index 0000000..268e0e6
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
