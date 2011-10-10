From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon, 10 Oct 2011 15:31:36 +0200
Subject: [Buildroot] [PATCH] add package tango-icon-theme and dependency
	icon-naming-utils
Message-ID: <1318253496-23729-1-git-send-email-schwarzkopf@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 package/Config.in                              |    1 +
 package/icon-naming-utils/icon-naming-utils.mk |   11 +++++++++++
 package/tango-icon-theme/Config.in             |    6 ++++++
 package/tango-icon-theme/tango-icon-theme.mk   |   15 +++++++++++++++
 4 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 package/icon-naming-utils/icon-naming-utils.mk
 create mode 100644 package/tango-icon-theme/Config.in
 create mode 100644 package/tango-icon-theme/tango-icon-theme.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..4516fb9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -114,6 +114,7 @@ source "package/sdl_sound/Config.in"
 source "package/sdl_net/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/sdl_gfx/Config.in"
+source "package/tango-icon-theme/Config.in"
 
 comment "other GUIs"
 source "package/qt/Config.in"
diff --git a/package/icon-naming-utils/icon-naming-utils.mk b/package/icon-naming-utils/icon-naming-utils.mk
new file mode 100644
index 0000000..556b826
--- /dev/null
+++ b/package/icon-naming-utils/icon-naming-utils.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# icon-naming-utils
+#
+#############################################################
+ICON_NAMING_UTILS_VERSION = 0.8.90
+ICON_NAMING_UTILS_SOURCE = icon-naming-utils-$(ICON_NAMING_UTILS_VERSION).tar.gz
+ICON_NAMING_UTILS_SITE = http://tango.freedesktop.org/releases/
+HOST_ICON_NAMING_UTILS_CONF_OPT = --datarootdir=$(HOST_DIR)/usr/lib
+
+$(eval $(call AUTOTARGETS,package,icon-naming-utils,host))
diff --git a/package/tango-icon-theme/Config.in b/package/tango-icon-theme/Config.in
new file mode 100644
index 0000000..cf20e9b
--- /dev/null
+++ b/package/tango-icon-theme/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TANGO_ICON_THEME
+	bool "tango icon theme"
+	help
+	  Icons from the tango desktop project.
+
+	  http://tango.freedesktop.org/Tango_Desktop_Project
diff --git a/package/tango-icon-theme/tango-icon-theme.mk b/package/tango-icon-theme/tango-icon-theme.mk
new file mode 100644
index 0000000..ed5a8b2
--- /dev/null
+++ b/package/tango-icon-theme/tango-icon-theme.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# tango-icon-theme
+#
+#############################################################
+TANGO_ICON_THEME_VERSION = 0.8.90
+TANGO_ICON_THEME_SOURCE = tango-icon-theme-$(TANGO_ICON_THEME_VERSION).tar.gz
+TANGO_ICON_THEME_SITE = http://tango.freedesktop.org/releases/
+
+TANGO_ICON_THEME_CONF_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/usr/lib/pkgconfig
+TANGO_ICON_THEME_CONF_OPT = --disable-icon-framing
+
+TANGO_ICON_THEME_DEPENDENCIES = host-icon-naming-utils host-pkg-config
+
+$(eval $(call AUTOTARGETS,package,tango-icon-theme))
-- 
1.7.0.4
