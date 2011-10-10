From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon, 10 Oct 2011 20:07:53 +0200
Subject: [Buildroot] [PATCH 1/2 v2] add package tango-icon-theme
In-Reply-To: <1318253496-23729-1-git-send-email-schwarzkopf@sensortherm.de>
References: <1318253496-23729-1-git-send-email-schwarzkopf@sensortherm.de>
Message-ID: <1318270073-32193-1-git-send-email-schwarzkopf@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package need icon-naming-utils.

Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 package/Config.in                            |    1 +
 package/tango-icon-theme/Config.in           |    6 ++++++
 package/tango-icon-theme/tango-icon-theme.mk |   15 +++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/tango-icon-theme/Config.in
 create mode 100644 package/tango-icon-theme/tango-icon-theme.mk

diff --git a/package/Config.in b/package/Config.in
index 7dc8887..1cc953c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -115,6 +115,7 @@ source "package/sdl_sound/Config.in"
 source "package/sdl_net/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/sdl_gfx/Config.in"
+source "package/tango-icon-theme/Config.in"
 
 comment "other GUIs"
 source "package/qt/Config.in"
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
index 0000000..2c1a5a5
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
+$(eval $(call AUTOTARGETS))
-- 
1.7.0.4
