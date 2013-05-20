From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 15:56:40 +0300
Subject: [Buildroot] [PATCH 08/12] luaexpatutils: New package
In-Reply-To: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1369054604-26139-8-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lxp.doc is a module that provides useful features for working with XML formats
in LOM format as used by the LuaExpat project from Kepler.

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/Config.in                      |  1 +
 package/luaexpatutils/Config.in        |  8 ++++++++
 package/luaexpatutils/luaexpatutils.mk | 21 +++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/luaexpatutils/Config.in
 create mode 100644 package/luaexpatutils/luaexpatutils.mk

diff --git a/package/Config.in b/package/Config.in
index c11ff27..3351f21 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -312,6 +312,7 @@ source "package/luabitop/Config.in"
 source "package/luacjson/Config.in"
 source "package/luacrypto/Config.in"
 source "package/luaexpat/Config.in"
+source "package/luaexpatutils/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
 source "package/lua-ev/Config.in"
diff --git a/package/luaexpatutils/Config.in b/package/luaexpatutils/Config.in
new file mode 100644
index 0000000..cb2887a
--- /dev/null
+++ b/package/luaexpatutils/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUAEXPATUTILS
+	bool "luaexpatutils"
+	select BR2_PACKAGE_LUAEXPAT
+	help
+	  lxp.doc is a module that provides useful features for working with
+	  XML formats in LOM format as used by the LuaExpat project from Kepler.
+
+	  https://github.com/stevedonovan/LuaExpatUtils
diff --git a/package/luaexpatutils/luaexpatutils.mk b/package/luaexpatutils/luaexpatutils.mk
new file mode 100644
index 0000000..a9e3190
--- /dev/null
+++ b/package/luaexpatutils/luaexpatutils.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# luaexpatutils
+#
+#############################################################
+
+LUAEXPATUTILS_VERSION = master
+LUAEXPATUTILS_SITE = git://github.com/stevedonovan/LuaExpatUtils.git
+LUAEXPATUTILS_SITE_METHOD = git
+LUAEXPATUTILS_LICENSE = Public Domain
+LUAEXPATUTILS_DEPENDENCIES = luaexpat
+
+define LUAEXPATUTILS_INSTALL_TARGET_CMDS
+	cp $(@D)/lua/doc.lua $(TARGET_DIR)/usr/share/lua/lxp/
+endef
+
+define LUAEXPATUTILS_UNINSTALL_TARGET_CMDS
+	rm -f "$(TARGET_DIR)/usr/share/lua/lxp/doc.lua"
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
