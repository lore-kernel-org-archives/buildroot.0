From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 20 Jul 2012 10:20:03 +0100
Subject: [Buildroot] [PATCH] sound-theme-borealis: new package
Message-ID: <1342776003-29430-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                                  |    1 +
 package/sound-theme-borealis/Config.in             |    6 ++++++
 .../sound-theme-borealis/sound-theme-borealis.mk   |   21 ++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/sound-theme-borealis/Config.in
 create mode 100644 package/sound-theme-borealis/sound-theme-borealis.mk

diff --git a/package/Config.in b/package/Config.in
index d0daa18..ee523d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -498,6 +498,7 @@ source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
+source "package/sound-theme-borealis/Config.in"
 source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
diff --git a/package/sound-theme-borealis/Config.in b/package/sound-theme-borealis/Config.in
new file mode 100644
index 0000000..fcc109f
--- /dev/null
+++ b/package/sound-theme-borealis/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SOUND_THEME_BOREALIS
+	bool "sound-theme-borealis"
+	help
+	  Borealis sound theme.
+
+	  http://kde-look.org/content/show.php?content=12584
diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
new file mode 100644
index 0000000..c6db344
--- /dev/null
+++ b/package/sound-theme-borealis/sound-theme-borealis.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# sound-theme-borealis
+#
+#############################################################
+SOUND_THEME_BOREALIS_VERSION = 0.9a
+SOUND_THEME_BOREALIS_SITE = http://ico.bukvic.net/Linux/Borealis_soundtheme
+SOUND_THEME_BOREALIS_SOURCE = \
+	Borealis_sound_theme_ogg-$(SOUND_THEME_BOREALIS_VERSION).tar.bz2
+
+define SOUND_THEME_BOREALIS_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/sounds/borealis/stereo
+	cp -a $(@D)/*.ogg	$(TARGET_DIR)/usr/share/sounds/borealis/stereo
+	chmod 0644 $(TARGET_DIR)/usr/share/sounds/borealis/stereo/*.ogg
+endef
+
+define SOUND_THEME_BOREALIS_UNINSTALL_TARGET_CMDS
+	$(RM) -r $(TARGET_DIR)/usr/share/sounds/borealis
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
