From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:35:00 +0100
Subject: [Buildroot] [PATCH 24/24] lsqlite3: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-25-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in            |    1 +
 package/lsqlite3/Config.in   |    8 ++++++++
 package/lsqlite3/lsqlite3.mk |   12 ++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/lsqlite3/Config.in
 create mode 100644 package/lsqlite3/lsqlite3.mk

diff --git a/package/Config.in b/package/Config.in
index 2bc3cc9..3ea8b08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -375,6 +375,7 @@ source "package/ljsyscall/Config.in"
 source "package/lpeg/Config.in"
 source "package/lpty/Config.in"
 source "package/lrandom/Config.in"
+source "package/lsqlite3/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-coat/Config.in"
 source "package/lua-coatpersistent/Config.in"
diff --git a/package/lsqlite3/Config.in b/package/lsqlite3/Config.in
new file mode 100644
index 0000000..e19c789
--- /dev/null
+++ b/package/lsqlite3/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LSQLITE3
+	bool "lsqlite3"
+	select BR2_PACKAGE_SQLITE
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	help
+	  a thin Lua wrapper for the SQLite3 library.
+
+	  http://lua.sqlite.org/
diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
new file mode 100644
index 0000000..f02aa4c
--- /dev/null
+++ b/package/lsqlite3/lsqlite3.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lsqlite3
+#
+################################################################################
+
+LSQLITE3_VERSION = 0.9.1-2
+LSQLITE3_SUBDIR  = lsqlite3_fsl09t
+LSQLITE3_DEPENDENCIES = sqlite
+LSQLITE3_LICENSE = MIT
+
+$(eval $(luarocks-package))
-- 
1.7.9.5
