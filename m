From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Nov 2012 22:46:35 +0100
Subject: [Buildroot] [PATCH v2] matchbox packages: add license info
In-Reply-To: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
References: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1354311995-21598-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
v2: fix license according to Arnout's comments
---
 package/matchbox/matchbox-common/matchbox-common.mk                   | 2 ++
 package/matchbox/matchbox-desktop/matchbox-desktop.mk                 | 2 ++
 package/matchbox/matchbox-fakekey/matchbox-fakekey.mk                 | 2 ++
 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk               | 2 ++
 package/matchbox/matchbox-lib/matchbox-lib.mk                         | 2 ++
 package/matchbox/matchbox-panel/matchbox-panel.mk                     | 2 ++
 package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk | 2 ++
 package/matchbox/matchbox-wm/matchbox-wm.mk                           | 3 +++
 8 files changed, 17 insertions(+)

diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 3248e74..89c00c2 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -7,6 +7,8 @@ MATCHBOX_COMMON_VERSION_MAJOR = 0.9
 MATCHBOX_COMMON_VERSION = $(MATCHBOX_COMMON_VERSION_MAJOR).1
 MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
 MATCHBOX_COMMON_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-common/$(MATCHBOX_COMMON_VERSION_MAJOR)
+MATCHBOX_COMMON_LICENSE = GPLv2+
+MATCHBOX_COMMON_LICENSE_FILES = COPYING
 MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
 
 ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index 2ef29c6..d180d1d 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -8,6 +8,8 @@ MATCHBOX_DESKTOP_VERSION_MAJOR = 0.9
 MATCHBOX_DESKTOP_VERSION = $(MATCHBOX_DESKTOP_VERSION_MAJOR).1
 MATCHBOX_DESKTOP_SOURCE = matchbox-desktop-$(MATCHBOX_DESKTOP_VERSION).tar.bz2
 MATCHBOX_DESKTOP_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-desktop/$(MATCHBOX_DESKTOP_VERSION_MAJOR)
+MATCHBOX_DESKTOP_LICENSE = GPLv2+
+MATCHBOX_DESKTOP_LICENSE_FILES = COPYING
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib
 MATCHBOX_DESKTOP_CONF_OPT = --enable-expat
 
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index 7a6ac00..c3165e0 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -7,6 +7,8 @@
 MATCHBOX_FAKEKEY_VERSION = 0.1
 MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
 MATCHBOX_FAKEKEY_SITE = http://downloads.yoctoproject.org/releases/matchbox/libfakekey/$(MATCHBOX_FAKEKEY_VERSION)
+MATCHBOX_FAKEKEY_LICENSE = GPLv2+
+MATCHBOX_FAKEKEY_LICENSE_FILES = COPYING
 MATCHBOX_FAKEKEY_INSTALL_STAGING = YES
 MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
 MATCHBOX_FAKEKEY_CONF_OPT = --enable-expat
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 44aab5c..97e3a36 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -7,6 +7,8 @@
 MATCHBOX_KEYBOARD_VERSION = 0.1
 MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
 MATCHBOX_KEYBOARD_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
+MATCHBOX_KEYBOARD_LICENSE = GPLv2+
+MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING
 MATCHBOX_KEYBOARD_DEPENDENCIES = matchbox-lib matchbox-fakekey
 
 # Workaround bug in configure script
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 6b6025a..7730d94 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -7,6 +7,8 @@
 MATCHBOX_LIB_VERSION = 1.9
 MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
 MATCHBOX_LIB_SITE = http://downloads.yoctoproject.org/releases/matchbox/libmatchbox/$(MATCHBOX_LIB_VERSION)
+MATCHBOX_LIB_LICENSE = LGPLv2.1
+MATCHBOX_LIB_LICENSE_FILES = COPYING
 MATCHBOX_LIB_INSTALL_STAGING = YES
 MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
 MATCHBOX_LIB_CONF_OPT = --enable-expat --disable-doxygen-docs
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index 0e980ef..c9ef3f4 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -7,6 +7,8 @@ MATCHBOX_PANEL_VERSION_MAJOR = 0.9
 MATCHBOX_PANEL_VERSION = $(MATCHBOX_PANEL_VERSION_MAJOR).3
 MATCHBOX_PANEL_SOURCE = matchbox-panel-$(MATCHBOX_PANEL_VERSION).tar.bz2
 MATCHBOX_PANEL_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-panel/$(MATCHBOX_PANEL_VERSION_MAJOR)
+MATCHBOX_PANEL_LICENSE = GPLv2+
+MATCHBOX_PANEL_LICENSE_FILES = COPYING
 MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
 MATCHBOX_PANEL_CONF_OPT = --enable-expat
 
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
index 6b30e80..18c3b13 100644
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -7,6 +7,8 @@
 MATCHBOX_STARTUP_MONITOR_VERSION = 0.1
 MATCHBOX_STARTUP_MONITOR_SOURCE = mb-applet-startup-monitor-$(MATCHBOX_STARTUP_MONITOR_VERSION).tar.bz2
 MATCHBOX_STARTUP_MONITOR_SITE = http://downloads.yoctoproject.org/releases/matchbox/mb-applet-startup-monitor/$(MATCHBOX_STARTUP_MONITOR_VERSION)
+MATCHBOX_STARTUP_MONITOR_LICENSE = GPLv2+
+MATCHBOX_STARTUP_MONITOR_LICENSE_FILES = COPYING
 MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
 MATCHBOX_STARTUP_MONITOR_CONF_OPT =
 
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index b04cf76..4c556e5 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -7,6 +7,9 @@
 MATCHBOX_WM_VERSION = 1.2
 MATCHBOX_WM_SOURCE = matchbox-window-manager-$(MATCHBOX_WM_VERSION).tar.bz2
 MATCHBOX_WM_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/$(MATCHBOX_WM_VERSION)
+MATCHBOX_WM_LICENSE = GPLv2+
+MATCHBOX_WM_LICENSE_FILES = COPYING
+
 MATCHBOX_WM_DEPENDENCIES = matchbox-lib
 MATCHBOX_WM_CONF_OPT = --enable-expat
 
-- 
1.8.0.1
