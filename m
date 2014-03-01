From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:07:09 +0100
Subject: [Buildroot] [git commit] lualogging: new package
Message-ID: <20140301151038.5E3C6903EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b21b576af9a071a5bc91957dfda7c8072ac1aff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: simplify version specification in the .mk file.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/lualogging/Config.in     |    9 +++++++++
 package/lualogging/lualogging.mk |   12 ++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cc44228..c4cdcc4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -385,6 +385,7 @@ source "package/luaexpat/Config.in"
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
index 0000000..d17353c
--- /dev/null
+++ b/package/lualogging/lualogging.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lualogging
+#
+################################################################################
+
+LUALOGGING_VERSION = 1.3.0-1
+LUALOGGING_SUBDIR  = lualogging
+LUALOGGING_LICENSE = MIT
+LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
