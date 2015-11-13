From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 16:37:04 -0300
Subject: [Buildroot] [PATCH 2/3] comix_cursors: new package
In-Reply-To: <1447443425-2530-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447443425-2530-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1447443425-2530-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                        |  1 +
 package/comix_cursors/Config.in          |  6 ++++++
 package/comix_cursors/comix_cursors.hash |  2 ++
 package/comix_cursors/comix_cursors.mk   | 23 +++++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/comix_cursors/Config.in
 create mode 100644 package/comix_cursors/comix_cursors.hash
 create mode 100644 package/comix_cursors/comix_cursors.mk

diff --git a/package/Config.in b/package/Config.in
index f48d114..be2a7a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -183,6 +183,7 @@ endmenu
 menu "Fonts, cursors, icons, sounds and themes"
 
 comment "Cursors"
+	source "package/comix_cursors/Config.in"
 	source "package/obsidian_cursors/Config.in"
 
 comment "Fonts"
diff --git a/package/comix_cursors/Config.in b/package/comix_cursors/Config.in
new file mode 100644
index 0000000..82da8e4
--- /dev/null
+++ b/package/comix_cursors/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_COMIX_CURSORS
+	bool "comix"
+	help
+	  X11 mouse theme with a comics feeling.
+
+	  http://kde-look.org/content/show.php/ComixCursors?content=32627
diff --git a/package/comix_cursors/comix_cursors.hash b/package/comix_cursors/comix_cursors.hash
new file mode 100644
index 0000000..d7f33ca
--- /dev/null
+++ b/package/comix_cursors/comix_cursors.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	3109e4d19d930a6a2a5c3422ebaaa2002640169118f9b12c042bb64995f3ec31	ComixCursors-0.8.2.tar.bz2
diff --git a/package/comix_cursors/comix_cursors.mk b/package/comix_cursors/comix_cursors.mk
new file mode 100644
index 0000000..2f8e0e1
--- /dev/null
+++ b/package/comix_cursors/comix_cursors.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# comix_cursors
+#
+################################################################################
+
+COMIX_CURSORS_VERSION = 0.8.2
+COMIX_CURSORS_SITE = http://limitland.de/downloads/comixcursors
+COMIX_CURSORS_SOURCE = ComixCursors-$(COMIX_CURSORS_VERSION).tar.bz2
+COMIX_CURSORS_LICENSE = GPL
+
+define COMIX_CURSORS_EXTRACT_CMDS
+	$(call suitable-extractor,$(COMIX_CURSORS_SOURCE)) $(DL_DIR)/$(COMIX_CURSORS_SOURCE) | \
+	$(TAR) --strip-components=0 -C $(@D) $(TAR_OPTIONS) -
+endef
+
+define COMIX_CURSORS_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/cursors/xorg-x11
+	cp -a $(@D)/* \
+		$(TARGET_DIR)/usr/share/cursors/xorg-x11
+endef
+
+$(eval $(generic-package))
-- 
2.4.10
