From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:20 +0100
Subject: [Buildroot] [PATCH 30/33] matchbox packages: add license info
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-31-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/matchbox/matchbox-common/matchbox-common.mk                   | 3 +++
 package/matchbox/matchbox-desktop/matchbox-desktop.mk                 | 3 +++
 package/matchbox/matchbox-fakekey/matchbox-fakekey.mk                 | 3 +++
 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk               | 3 +++
 package/matchbox/matchbox-lib/matchbox-lib.mk                         | 3 +++
 package/matchbox/matchbox-panel/matchbox-panel.mk                     | 3 +++
 package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk | 3 +++
 package/matchbox/matchbox-wm/matchbox-wm.mk                           | 3 +++
 8 files changed, 24 insertions(+)

diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 993590c..2909f27 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -7,6 +7,9 @@ MATCHBOX_COMMON_VERSION_MAJOR = 0.9
 MATCHBOX_COMMON_VERSION = $(MATCHBOX_COMMON_VERSION_MAJOR).1
 MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
 MATCHBOX_COMMON_SITE = http://projects.o-hand.com/matchbox/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION_MAJOR)
+MATCHBOX_COMMON_LICENSE = GPLv2
+MATCHBOX_COMMON_LICENSE_FILES = COPYING
+
 MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
 
 ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index c5f5b0d..b1d0976 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -8,6 +8,9 @@ MATCHBOX_DESKTOP_VERSION_MAJOR = 0.9
 MATCHBOX_DESKTOP_VERSION = $(MATCHBOX_DESKTOP_VERSION_MAJOR).1
 MATCHBOX_DESKTOP_SOURCE = matchbox-desktop-$(MATCHBOX_DESKTOP_VERSION).tar.bz2
 MATCHBOX_DESKTOP_SITE = http://projects.o-hand.com/matchbox/sources/matchbox-desktop/$(MATCHBOX_DESKTOP_VERSION_MAJOR)
+MATCHBOX_DESKTOP_LICENSE = GPLv2
+MATCHBOX_DESKTOP_LICENSE_FILES = COPYING
+
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib
 MATCHBOX_DESKTOP_CONF_OPT = --enable-expat
 
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index 255f3c1..763ea6f 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -7,6 +7,9 @@
 MATCHBOX_FAKEKEY_VERSION = 0.1
 MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
 MATCHBOX_FAKEKEY_SITE = http://matchbox-project.org/sources/libfakekey/$(MATCHBOX_FAKEKEY_VERSION)
+MATCHBOX_FAKEKEY_LICENSE = GPLv2
+MATCHBOX_FAKEKEY_LICENSE_FILES = COPYING
+
 MATCHBOX_FAKEKEY_INSTALL_STAGING = YES
 MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
 MATCHBOX_FAKEKEY_CONF_OPT = --enable-expat
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 2da8dfa..5eb2cf3 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -7,6 +7,9 @@
 MATCHBOX_KEYBOARD_VERSION = 0.1
 MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
 MATCHBOX_KEYBOARD_SITE = http://projects.o-hand.com/matchbox/sources/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
+MATCHBOX_KEYBOARD_LICENSE = GPLv2
+MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING
+
 MATCHBOX_KEYBOARD_DEPENDENCIES = matchbox-lib matchbox-fakekey
 
 # Workaround bug in configure script
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index c9d7600..3b1b2e1 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -7,6 +7,9 @@
 MATCHBOX_LIB_VERSION = 1.9
 MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
 MATCHBOX_LIB_SITE = http://projects.o-hand.com/matchbox/sources/libmatchbox/$(MATCHBOX_LIB_VERSION)
+MATCHBOX_LIB_LICENSE = LGPLv2.1
+MATCHBOX_LIB_LICENSE_FILES = COPYING
+
 MATCHBOX_LIB_INSTALL_STAGING = YES
 MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
 MATCHBOX_LIB_CONF_OPT = --enable-expat --disable-doxygen-docs
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index e216fed..8cb59db 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -7,6 +7,9 @@ MATCHBOX_PANEL_VERSION_MAJOR = 0.9
 MATCHBOX_PANEL_VERSION = $(MATCHBOX_PANEL_VERSION_MAJOR).3
 MATCHBOX_PANEL_SOURCE = matchbox-panel-$(MATCHBOX_PANEL_VERSION).tar.bz2
 MATCHBOX_PANEL_SITE = http://projects.o-hand.com/matchbox/sources/matchbox-panel/$(MATCHBOX_PANEL_VERSION_MAJOR)
+MATCHBOX_PANEL_LICENSE = GPLv2
+MATCHBOX_PANEL_LICENSE_FILES = COPYING
+
 MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
 MATCHBOX_PANEL_CONF_OPT = --enable-expat
 
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
index 6f37bf4..2d8287b 100644
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -7,6 +7,9 @@
 MATCHBOX_STARTUP_MONITOR_VERSION = 0.1
 MATCHBOX_STARTUP_MONITOR_SOURCE = mb-applet-startup-monitor-$(MATCHBOX_STARTUP_MONITOR_VERSION).tar.bz2
 MATCHBOX_STARTUP_MONITOR_SITE = http://matchbox-project.org/sources/mb-applet-startup-monitor/$(MATCHBOX_STARTUP_MONITOR_VERSION)
+MATCHBOX_STARTUP_MONITOR_LICENSE = GPLv2
+MATCHBOX_STARTUP_MONITOR_LICENSE_FILES = COPYING
+
 MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
 MATCHBOX_STARTUP_MONITOR_CONF_OPT =
 
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index 1a07a58..3d4da78 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -7,6 +7,9 @@
 MATCHBOX_WM_VERSION = 1.2
 MATCHBOX_WM_SOURCE = matchbox-window-manager-$(MATCHBOX_WM_VERSION).tar.bz2
 MATCHBOX_WM_SITE = http://projects.o-hand.com/matchbox/sources/matchbox-window-manager/$(MATCHBOX_WM_VERSION)
+MATCHBOX_WM_LICENSE = GPLv2
+MATCHBOX_WM_LICENSE_FILES = COPYING
+
 MATCHBOX_WM_DEPENDENCIES = matchbox-lib
 MATCHBOX_WM_CONF_OPT = --enable-expat
 
-- 
1.8.0
