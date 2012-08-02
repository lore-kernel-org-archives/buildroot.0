From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:47 -0000
Subject: [Buildroot] [git commit branch/next] sound-theme-freedesktop: new
	package
Message-ID: <20120802195243.340298E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f86391fc07731c26d96acec5f1d082378f9e494d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/sound-theme-freedesktop/Config.in          |    6 ++++++
 .../sound-theme-freedesktop.mk                     |   12 ++++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c9b5e1a..b257c0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -493,6 +493,7 @@ source "package/collectd/Config.in"
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
