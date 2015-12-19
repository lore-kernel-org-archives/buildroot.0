From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:32:29 +0100
Subject: [Buildroot] [git commit] obsidian-cursors: new package
Message-ID: <20151219143241.CC3A781E4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae2faeffb17d0df02508cc37788139ba506ede2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - rename from obsidian_cursors to obsidian-cursors
 - change prompt from obsidian to obsidian-cursors in order to match
   with the package name.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |  5 ++++-
 package/obsidian-cursors/Config.in             |  6 ++++++
 package/obsidian-cursors/obsidian-cursors.hash |  2 ++
 package/obsidian-cursors/obsidian-cursors.mk   | 18 ++++++++++++++++++
 4 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index ca05881..8e49c46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -186,7 +186,10 @@ menu "Filesystem and flash utilities"
 	source "package/xfsprogs/Config.in"
 endmenu
 
-menu "Fonts, icons, sounds and themes"
+menu "Fonts, cursors, icons, sounds and themes"
+
+comment "Cursors"
+	source "package/obsidian-cursors/Config.in"
 
 comment "Fonts"
 	source "package/bitstream-vera/Config.in"
diff --git a/package/obsidian-cursors/Config.in b/package/obsidian-cursors/Config.in
new file mode 100644
index 0000000..49ec310
--- /dev/null
+++ b/package/obsidian-cursors/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_OBSIDIAN_CURSORS
+	bool "obsidian-cursors"
+	help
+	  Obsidian Cursors is a shiny and clean cursor set.
+
+	  http://kde-look.org/content/show.php/Obsidian+Cursors?content=73135
diff --git a/package/obsidian-cursors/obsidian-cursors.hash b/package/obsidian-cursors/obsidian-cursors.hash
new file mode 100644
index 0000000..8f1775e
--- /dev/null
+++ b/package/obsidian-cursors/obsidian-cursors.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	3d38fe875f6feae8b7772e02cfda530fcf669479807915cd2c12c149da17cfb9	73135-Obsidian.tar.bz2
diff --git a/package/obsidian-cursors/obsidian-cursors.mk b/package/obsidian-cursors/obsidian-cursors.mk
new file mode 100644
index 0000000..87a8d62
--- /dev/null
+++ b/package/obsidian-cursors/obsidian-cursors.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# obsidian-cursors
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
