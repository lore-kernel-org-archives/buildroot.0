From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:49 +0100
Subject: [Buildroot] [PATCH 13/24] lualogging: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-14-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                |    1 +
 package/lualogging/Config.in     |    9 +++++++++
 package/lualogging/lualogging.mk |   13 +++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/lualogging/Config.in
 create mode 100644 package/lualogging/lualogging.mk

diff --git a/package/Config.in b/package/Config.in
index e65d71d..0a1e891 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -383,6 +383,7 @@ source "package/luaexpat/Config.in"
 source "package/luaexpatutils/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luajson/Config.in"
+source "package/lualogging/Config.in"
 source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
diff --git a/package/lualogging/Config.in b/package/lualogging/Config.in
new file mode 100644
index 0000000..37d7015
--- /dev/null
+++ b/package/lualogging/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUALOGGING
+	bool "lualogging"
+	help
+	  LuaLogging provides a simple API to use logging features in Lua.
+	  Its design was based on log4j. LuaLogging currently supports,
+	  through the use of appenders, console, file, rolling file, email,
+	  socket and SQL outputs.
+
+	  http://www.keplerproject.org/lualogging/
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
new file mode 100644
index 0000000..91007f2
--- /dev/null
+++ b/package/lualogging/lualogging.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lualogging
+#
+################################################################################
+
+LUALOGGING_VERSION_UPSTREAM = 1.3.0
+LUALOGGING_VERSION = $(LUALOGGING_VERSION_UPSTREAM)-1
+LUALOGGING_SUBDIR  = lualogging
+LUALOGGING_LICENSE = MIT
+LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
-- 
1.7.9.5
