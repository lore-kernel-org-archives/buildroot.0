From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 16:37:03 -0300
Subject: [Buildroot] [PATCH 1/3] obsidian_cursors: new package
Message-ID: <1447443425-2530-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                              |  5 ++++-
 package/obsidian_cursors/Config.in             |  6 ++++++
 package/obsidian_cursors/obsidian_cursors.hash |  2 ++
 package/obsidian_cursors/obsidian_cursors.mk   | 18 ++++++++++++++++++
 4 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 package/obsidian_cursors/Config.in
 create mode 100644 package/obsidian_cursors/obsidian_cursors.hash
 create mode 100644 package/obsidian_cursors/obsidian_cursors.mk

diff --git a/package/Config.in b/package/Config.in
index 5d3c2c7..f48d114 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -180,7 +180,10 @@ menu "Filesystem and flash utilities"
 	source "package/xfsprogs/Config.in"
 endmenu
 
-menu "Fonts, icons, sounds and themes"
+menu "Fonts, cursors, icons, sounds and themes"
+
+comment "Cursors"
+	source "package/obsidian_cursors/Config.in"
 
 comment "Fonts"
 	source "package/bitstream-vera/Config.in"
diff --git a/package/obsidian_cursors/Config.in b/package/obsidian_cursors/Config.in
new file mode 100644
index 0000000..3f5ddcd
--- /dev/null
+++ b/package/obsidian_cursors/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_OBSIDIAN_CURSORS
+	bool "obsidian"
+	help
+	  Obsidian Cursors is a shiny and clean cursor set.
+
+	  http://kde-look.org/content/show.php/Obsidian+Cursors?content=73135
diff --git a/package/obsidian_cursors/obsidian_cursors.hash b/package/obsidian_cursors/obsidian_cursors.hash
new file mode 100644
index 0000000..8f1775e
--- /dev/null
+++ b/package/obsidian_cursors/obsidian_cursors.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	3d38fe875f6feae8b7772e02cfda530fcf669479807915cd2c12c149da17cfb9	73135-Obsidian.tar.bz2
diff --git a/package/obsidian_cursors/obsidian_cursors.mk b/package/obsidian_cursors/obsidian_cursors.mk
new file mode 100644
index 0000000..75a9a79
--- /dev/null
+++ b/package/obsidian_cursors/obsidian_cursors.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# obsidian_cursors
+#
+################################################################################
+
+OBSIDIAN_CURSORS_VERSION = 1.0
+OBSIDIAN_CURSORS_SITE = http://kde-look.org/CONTENT/content-files
+OBSIDIAN_CURSORS_SOURCE = 73135-Obsidian.tar.bz2
+OBSIDIAN_CURSORS_LICENSE = GPL
+
+define OBSIDIAN_CURSORS_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/cursors/xorg-x11/Obsidian
+	cp -a $(@D)/cursors \
+		$(TARGET_DIR)/usr/share/cursors/xorg-x11/Obsidian
+endef
+
+$(eval $(generic-package))
-- 
2.4.10
