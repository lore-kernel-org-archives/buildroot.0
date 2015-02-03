From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 17:04:54 +0100
Subject: [Buildroot] [git commit] ghostscript-fonts: new package
Message-ID: <20150203160753.5617680841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20cfc871fba4d447e46ec8092f58b8888cf5a73c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |    1 +
 package/ghostscript-fonts/Config.in            |    8 ++++++++
 package/ghostscript-fonts/ghostscript-fonts.mk |   21 +++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d19b37f..fe3d3d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -261,6 +261,7 @@ comment "X applications"
 
 comment "X libraries and helper libraries"
 	source "package/dejavu/Config.in"
+	source "package/ghostscript-fonts/Config.in"
 	source "package/liberation/Config.in"
 	source "package/libsexy/Config.in"
 	source "package/x11r7/xkeyboard-config/Config.in"
diff --git a/package/ghostscript-fonts/Config.in b/package/ghostscript-fonts/Config.in
new file mode 100644
index 0000000..80bfbd0
--- /dev/null
+++ b/package/ghostscript-fonts/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GHOSTSCRIPT_FONTS
+	bool "ghostscript-fonts"
+	help
+	  Fonts and font metrics customarily distributed with Ghostscript.
+	  Currently includes the 35 standard PostScript fonts and a
+	  grab-bag of others.
+
+	  http://sourceforge.net/projects/gs-fonts
diff --git a/package/ghostscript-fonts/ghostscript-fonts.mk b/package/ghostscript-fonts/ghostscript-fonts.mk
new file mode 100644
index 0000000..fa5c4b7
--- /dev/null
+++ b/package/ghostscript-fonts/ghostscript-fonts.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# ghostscript-fonts
+#
+################################################################################
+
+GHOSTSCRIPT_FONTS_VERSION = 8.11
+GHOSTSCRIPT_FONTS_SITE = http://downloads.sourceforge.net/project/gs-fonts/gs-fonts/8.11%20%28base%2035%2C%20GPL%29
+GHOSTSCRIPT_FONTS_SOURCE = ghostscript-fonts-std-$(GHOSTSCRIPT_FONTS_VERSION).tar.gz
+GHOSTSCRIPT_FONTS_LICENSE = GPLv2
+GHOSTSCRIPT_FONTS_LICENSE_FILES = COPYING
+
+GHOSTSCRIPT_FONTS_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/gs
+
+define GHOSTSCRIPT_FONTS_INSTALL_TARGET_CMDS
+	mkdir -p $(GHOSTSCRIPT_FONTS_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/*.afm $(GHOSTSCRIPT_FONTS_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/*.pfb $(GHOSTSCRIPT_FONTS_TARGET_DIR)
+endef
+
+$(eval $(generic-package))
