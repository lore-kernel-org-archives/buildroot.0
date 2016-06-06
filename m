From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon,  6 Jun 2016 15:04:09 +0200
Subject: [Buildroot] [PATCH] package/middleclass: new package
Message-ID: <20160606130409.19533-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/Config.in                    |  1 +
 package/middleclass/Config.in        |  9 +++++++++
 package/middleclass/middleclass.hash |  2 ++
 package/middleclass/middleclass.mk   | 18 ++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/middleclass/Config.in
 create mode 100644 package/middleclass/middleclass.hash
 create mode 100644 package/middleclass/middleclass.mk

diff --git a/package/Config.in b/package/Config.in
index 9f6e0d9..b48948e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -544,6 +544,7 @@ menu "Lua libraries/modules"
 	source "package/luv/Config.in"
 	source "package/luvi/Config.in"
 	source "package/lzlib/Config.in"
+	source "package/middleclass/Config.in"
 	source "package/orbit/Config.in"
 	source "package/rings/Config.in"
 	source "package/turbolua/Config.in"
diff --git a/package/middleclass/Config.in b/package/middleclass/Config.in
new file mode 100644
index 0000000..712064a
--- /dev/null
+++ b/package/middleclass/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MIDDLECLASS
+	bool "middleclass"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  middleclass is a simple OOP library for Lua. It has
+	  inheritance, metamethods (operators), class variables
+	  and weak mixin support.
+
+	  https://github.com/kikito/middleclass
diff --git a/package/middleclass/middleclass.hash b/package/middleclass/middleclass.hash
new file mode 100644
index 0000000..3fc794a
--- /dev/null
+++ b/package/middleclass/middleclass.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	fc7f3e79a77d4733fd80b2e310f7f34092bdb5888549f304a24efd624c56482e  middleclass-v4.0.0.tar.gz
diff --git a/package/middleclass/middleclass.mk b/package/middleclass/middleclass.mk
new file mode 100644
index 0000000..3e21452
--- /dev/null
+++ b/package/middleclass/middleclass.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# middleclass
+#
+################################################################################
+
+MIDDLECLASS_VERSION = v4.0.0
+MIDDLECLASS_SITE = $(call github,kikito,middleclass,$(MIDDLECLASS_VERSION))
+MIDDLECLASS_DEPENDENCIES = luainterpreter
+MIDDLECLASS_LICENSE = MIT
+MIDDLECLASS_LICENSE_FILES = MIT-LICENSE.txt
+
+define MIDDLECLASS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/middleclass.lua \
+		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/middleclass.lua
+endef
+
+$(eval $(generic-package))
-- 
2.8.3
