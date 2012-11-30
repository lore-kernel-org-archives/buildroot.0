From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 13:07:43 -0800
Subject: [Buildroot] [git commit] matchbox packages: fix broken urls
Message-ID: <20121130211218.1B8E699340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b0b177b26f3d3cf785e5c46a3ec963bbfd9cebc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../matchbox/matchbox-common/matchbox-common.mk    |    6 +++---
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    5 +++--
 .../matchbox/matchbox-fakekey/matchbox-fakekey.mk  |    2 +-
 .../matchbox-keyboard/matchbox-keyboard.mk         |    2 +-
 package/matchbox/matchbox-lib/matchbox-lib.mk      |    2 +-
 package/matchbox/matchbox-panel/matchbox-panel.mk  |    6 +++---
 .../matchbox-startup-monitor.mk                    |    2 +-
 package/matchbox/matchbox-wm/matchbox-wm.mk        |    2 +-
 8 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 2e3cdff..3248e74 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -3,10 +3,10 @@
 # MatchBox Common
 #
 #############################################################
-
-MATCHBOX_COMMON_VERSION = 0.9.1
+MATCHBOX_COMMON_VERSION_MAJOR = 0.9
+MATCHBOX_COMMON_VERSION = $(MATCHBOX_COMMON_VERSION_MAJOR).1
 MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
-MATCHBOX_COMMON_SITE = http://matchbox-project.org/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION)
+MATCHBOX_COMMON_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-common/$(MATCHBOX_COMMON_VERSION_MAJOR)
 MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
 
 ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index 5c518e5..2ef29c6 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -4,9 +4,10 @@
 #
 #############################################################
 
-MATCHBOX_DESKTOP_VERSION = 0.9.1
+MATCHBOX_DESKTOP_VERSION_MAJOR = 0.9
+MATCHBOX_DESKTOP_VERSION = $(MATCHBOX_DESKTOP_VERSION_MAJOR).1
 MATCHBOX_DESKTOP_SOURCE = matchbox-desktop-$(MATCHBOX_DESKTOP_VERSION).tar.bz2
-MATCHBOX_DESKTOP_SITE = http://matchbox-project.org/sources/matchbox-desktop/$(MATCHBOX_DESKTOP_VERSION)
+MATCHBOX_DESKTOP_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-desktop/$(MATCHBOX_DESKTOP_VERSION_MAJOR)
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib
 MATCHBOX_DESKTOP_CONF_OPT = --enable-expat
 
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index 255f3c1..7a6ac00 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -6,7 +6,7 @@
 
 MATCHBOX_FAKEKEY_VERSION = 0.1
 MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
-MATCHBOX_FAKEKEY_SITE = http://matchbox-project.org/sources/libfakekey/$(MATCHBOX_FAKEKEY_VERSION)
+MATCHBOX_FAKEKEY_SITE = http://downloads.yoctoproject.org/releases/matchbox/libfakekey/$(MATCHBOX_FAKEKEY_VERSION)
 MATCHBOX_FAKEKEY_INSTALL_STAGING = YES
 MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
 MATCHBOX_FAKEKEY_CONF_OPT = --enable-expat
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index c6e9496..44aab5c 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -6,7 +6,7 @@
 
 MATCHBOX_KEYBOARD_VERSION = 0.1
 MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
-MATCHBOX_KEYBOARD_SITE = http://matchbox-project.org/sources/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
+MATCHBOX_KEYBOARD_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
 MATCHBOX_KEYBOARD_DEPENDENCIES = matchbox-lib matchbox-fakekey
 
 # Workaround bug in configure script
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 339f512..6b6025a 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -6,7 +6,7 @@
 
 MATCHBOX_LIB_VERSION = 1.9
 MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
-MATCHBOX_LIB_SITE = http://matchbox-project.org/sources/libmatchbox/$(MATCHBOX_LIB_VERSION)
+MATCHBOX_LIB_SITE = http://downloads.yoctoproject.org/releases/matchbox/libmatchbox/$(MATCHBOX_LIB_VERSION)
 MATCHBOX_LIB_INSTALL_STAGING = YES
 MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
 MATCHBOX_LIB_CONF_OPT = --enable-expat --disable-doxygen-docs
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index db9d1a8..0e980ef 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -3,10 +3,10 @@
 # MatchBox Panel
 #
 #############################################################
-
-MATCHBOX_PANEL_VERSION = 0.9.3
+MATCHBOX_PANEL_VERSION_MAJOR = 0.9
+MATCHBOX_PANEL_VERSION = $(MATCHBOX_PANEL_VERSION_MAJOR).3
 MATCHBOX_PANEL_SOURCE = matchbox-panel-$(MATCHBOX_PANEL_VERSION).tar.bz2
-MATCHBOX_PANEL_SITE = http://matchbox-project.org/sources/matchbox-panel/$(MATCHBOX_PANEL_VERSION)
+MATCHBOX_PANEL_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-panel/$(MATCHBOX_PANEL_VERSION_MAJOR)
 MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
 MATCHBOX_PANEL_CONF_OPT = --enable-expat
 
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
index 6f37bf4..6b30e80 100644
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -6,7 +6,7 @@
 
 MATCHBOX_STARTUP_MONITOR_VERSION = 0.1
 MATCHBOX_STARTUP_MONITOR_SOURCE = mb-applet-startup-monitor-$(MATCHBOX_STARTUP_MONITOR_VERSION).tar.bz2
-MATCHBOX_STARTUP_MONITOR_SITE = http://matchbox-project.org/sources/mb-applet-startup-monitor/$(MATCHBOX_STARTUP_MONITOR_VERSION)
+MATCHBOX_STARTUP_MONITOR_SITE = http://downloads.yoctoproject.org/releases/matchbox/mb-applet-startup-monitor/$(MATCHBOX_STARTUP_MONITOR_VERSION)
 MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
 MATCHBOX_STARTUP_MONITOR_CONF_OPT =
 
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index ece8866..b04cf76 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -6,7 +6,7 @@
 
 MATCHBOX_WM_VERSION = 1.2
 MATCHBOX_WM_SOURCE = matchbox-window-manager-$(MATCHBOX_WM_VERSION).tar.bz2
-MATCHBOX_WM_SITE = http://matchbox-project.org/sources/matchbox-window-manager/$(MATCHBOX_WM_VERSION)
+MATCHBOX_WM_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/$(MATCHBOX_WM_VERSION)
 MATCHBOX_WM_DEPENDENCIES = matchbox-lib
 MATCHBOX_WM_CONF_OPT = --enable-expat
 
