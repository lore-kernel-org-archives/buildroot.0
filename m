From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:32:29 +0100
Subject: [Buildroot] [git commit] comix-cursors: new package
Message-ID: <20151219143241.DE7E381E45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47e0779792f078f0790ac75ec6e54915bdbff5c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - rename from comix_cursors to comix-cursors
 - change prompt from comix to comix-cursors in order to match the
   package name
 - use <pkg>_STRIP_COMPONENTS instead of overriding the extract
   commands.
 - the license is GPLv3 according to the project website.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/comix-cursors/Config.in          |  6 ++++++
 package/comix-cursors/comix-cursors.hash |  2 ++
 package/comix-cursors/comix-cursors.mk   | 19 +++++++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8e49c46..94898a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -189,6 +189,7 @@ endmenu
 menu "Fonts, cursors, icons, sounds and themes"
 
 comment "Cursors"
+	source "package/comix-cursors/Config.in"
 	source "package/obsidian-cursors/Config.in"
 
 comment "Fonts"
diff --git a/package/comix-cursors/Config.in b/package/comix-cursors/Config.in
new file mode 100644
index 0000000..ac7a089
--- /dev/null
+++ b/package/comix-cursors/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_COMIX_CURSORS
+	bool "comix-cursors"
+	help
+	  X11 mouse theme with a comics feeling.
+
+	  http://kde-look.org/content/show.php/ComixCursors?content=32627
diff --git a/package/comix-cursors/comix-cursors.hash b/package/comix-cursors/comix-cursors.hash
new file mode 100644
index 0000000..d7f33ca
--- /dev/null
+++ b/package/comix-cursors/comix-cursors.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	3109e4d19d930a6a2a5c3422ebaaa2002640169118f9b12c042bb64995f3ec31	ComixCursors-0.8.2.tar.bz2
diff --git a/package/comix-cursors/comix-cursors.mk b/package/comix-cursors/comix-cursors.mk
new file mode 100644
index 0000000..f8e8284
--- /dev/null
+++ b/package/comix-cursors/comix-cursors.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# comix-cursors
+#
+################################################################################
+
+COMIX_CURSORS_VERSION = 0.8.2
+COMIX_CURSORS_SITE = http://limitland.de/downloads/comixcursors
+COMIX_CURSORS_SOURCE = ComixCursors-$(COMIX_CURSORS_VERSION).tar.bz2
+COMIX_CURSORS_LICENSE = GPLv3
+COMIX_CURSORS_STRIP_COMPONENTS = 0
+
+define COMIX_CURSORS_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/cursors/xorg-x11
+	cp -a $(@D)/* \
+		$(TARGET_DIR)/usr/share/cursors/xorg-x11
+endef
+
+$(eval $(generic-package))
