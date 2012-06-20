From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 20 Jun 2012 12:50:04 +0100
Subject: [Buildroot] [PATCH] sound-theme-freedesktop: new package
Message-ID: <1340193004-11192-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                                  |    1 +
 package/sound-theme-freedesktop/Config.in          |    6 ++++++
 .../sound-theme-freedesktop.mk                     |   12 ++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/sound-theme-freedesktop/Config.in
 create mode 100644 package/sound-theme-freedesktop/sound-theme-freedesktop.mk

diff --git a/package/Config.in b/package/Config.in
index 1044e9f..c79c6a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -492,6 +492,7 @@ source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
+source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
 menu "Networking applications"
diff --git a/package/sound-theme-freedesktop/Config.in b/package/sound-theme-freedesktop/Config.in
new file mode 100644
index 0000000..8b48015
--- /dev/null
+++ b/package/sound-theme-freedesktop/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SOUND_THEME_FREEDESKTOP
+	bool "sound-theme-freedesktop"
+	help
+	  Default theme for the XDG Sound Theme Specification.
+
+	  http://freedesktop.org/wiki/Specifications/sound-theme-spec
diff --git a/package/sound-theme-freedesktop/sound-theme-freedesktop.mk b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
new file mode 100644
index 0000000..d81c207
--- /dev/null
+++ b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# sound-theme-freedesktop
+#
+#############################################################
+SOUND_THEME_FREEDESKTOP_VERSION = 0.7
+SOUND_THEME_FREEDESKTOP_SITE = \
+	http://people.freedesktop.org/~mccann/dist
+SOUND_THEME_FREEDESKTOP_SOURCE = \
+	sound-theme-freedesktop-$(SOUND_THEME_FREEDESKTOP_VERSION).tar.bz2
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.5
