From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  6 Dec 2016 14:27:39 +0100
Subject: [Buildroot] [PATCH] package/easydbus: new package
Message-ID: <20161206132739.27239-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/Config.in              |  1 +
 package/easydbus/Config.in     |  7 +++++++
 package/easydbus/easydbus.hash |  2 ++
 package/easydbus/easydbus.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/easydbus/Config.in
 create mode 100644 package/easydbus/easydbus.hash
 create mode 100644 package/easydbus/easydbus.mk

diff --git a/package/Config.in b/package/Config.in
index 664d0d9..c14575c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -521,6 +521,7 @@ menu "Lua libraries/modules"
 	source "package/cosmo/Config.in"
 	source "package/coxpcall/Config.in"
 	source "package/dado/Config.in"
+	source "package/easydbus/Config.in"
 	source "package/lbase64/Config.in"
 	source "package/ljlinenoise/Config.in"
 	source "package/ljsyscall/Config.in"
diff --git a/package/easydbus/Config.in b/package/easydbus/Config.in
new file mode 100644
index 0000000..43abeae
--- /dev/null
+++ b/package/easydbus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_EASYDBUS
+	bool "easydbus"
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Easy to use DBus library for Lua.
+
+	  https://github.com/mniestroj/easydbus
diff --git a/package/easydbus/easydbus.hash b/package/easydbus/easydbus.hash
new file mode 100644
index 0000000..0ef73f2
--- /dev/null
+++ b/package/easydbus/easydbus.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3e5907664f5dfebbc0e652faf87564fd58dbd639742f442c100ef2db8be46e52 easydbus-59c340f2cd2c92ded82f9d4436866847f295faab.tar.gz
diff --git a/package/easydbus/easydbus.mk b/package/easydbus/easydbus.mk
new file mode 100644
index 0000000..376b09b
--- /dev/null
+++ b/package/easydbus/easydbus.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# easydbus
+#
+################################################################################
+
+EASYDBUS_VERSION = 59c340f2cd2c92ded82f9d4436866847f295faab
+EASYDBUS_SITE = $(call github,mniestroj,easydbus,$(EASYDBUS_VERSION))
+EASYDBUS_DEPENDENCIES = luainterpreter libglib2
+EASYDBUS_LICENSE = MIT
+EASYDBUS_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
-- 
2.10.2
