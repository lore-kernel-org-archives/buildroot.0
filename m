From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 21:45:53 +0200
Subject: [Buildroot] [git commit] matchbox: adjust style
Message-ID: <20150401194607.5F2FF7FED0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c82a7a80883feb2ff9d1e891bd36ebe61a4038c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove stray comments, adjust indentation, kill empty defines.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../matchbox/matchbox-common/matchbox-common.mk    |    4 +---
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    4 ----
 .../matchbox/matchbox-fakekey/matchbox-fakekey.mk  |    2 --
 .../matchbox-keyboard/matchbox-keyboard.mk         |    4 ----
 package/matchbox/matchbox-lib/matchbox-lib.mk      |    4 ----
 .../matchbox-startup-monitor.mk                    |    3 ---
 package/matchbox/matchbox-wm/matchbox-wm.mk        |    4 ----
 7 files changed, 1 insertions(+), 24 deletions(-)

diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 74bbebb..da6bec7 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -13,9 +13,7 @@ MATCHBOX_COMMON_LICENSE_FILES = COPYING
 MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
 
 ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
-	MATCHBOX_COMMON_CONF_OPTS += --enable-pda-folders
+MATCHBOX_COMMON_CONF_OPTS += --enable-pda-folders
 endif
 
-################################################################################
-
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index 2ea8866..a703a18 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -18,8 +18,6 @@ MATCHBOX_DESKTOP_CONF_OPTS = --enable-expat
 # configure.ac/Makefile.am.
 MATCHBOX_DESKTOP_AUTORECONF = YES
 
-################################################################################
-
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
 MATCHBOX_DESKTOP_CONF_OPTS += --enable-startup-notification
 MATCHBOX_DESKTOP_DEPENDENCIES += startup-notification
@@ -27,6 +25,4 @@ else
 MATCHBOX_DESKTOP_CONF_OPTS += --disable-startup-notification
 endif
 
-################################################################################
-
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index f687ca0..ea8e6dc 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -20,6 +20,4 @@ endef
 
 MATCHBOX_FAKEKEY_POST_CONFIGURE_HOOKS += MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
 
-################################################################################
-
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index bdcc32f..2017730 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -20,8 +20,6 @@ endef
 
 MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
 
-################################################################################
-
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 MATCHBOX_KEYBOARD_CONF_OPTS += --enable-cairo
 MATCHBOX_KEYBOARD_DEPENDENCIES += cairo
@@ -29,6 +27,4 @@ else
 MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 endif
 
-################################################################################
-
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 3149bbb..3b697bb 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -20,8 +20,6 @@ endef
 
 MATCHBOX_LIB_POST_INSTALL_STAGING_HOOKS += MATCHBOX_LIB_POST_INSTALL_FIXES
 
-################################################################################
-
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
 ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
 MATCHBOX_LIB_DEPENDENCIES += xlib_libXpm
@@ -56,6 +54,4 @@ else
 MATCHBOX_LIB_CONF_OPTS += --disable-xft
 endif
 
-################################################################################
-
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
index c6298d8..be57239 100644
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -10,8 +10,5 @@ MATCHBOX_STARTUP_MONITOR_SITE = http://downloads.yoctoproject.org/releases/match
 MATCHBOX_STARTUP_MONITOR_LICENSE = GPLv2+
 MATCHBOX_STARTUP_MONITOR_LICENSE_FILES = COPYING
 MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
-MATCHBOX_STARTUP_MONITOR_CONF_OPTS =
-
-################################################################################
 
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index 2ccb16e..16f1417 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -16,8 +16,6 @@ MATCHBOX_WM_CONF_OPTS = --enable-expat
 # Workaround bug in configure script
 MATCHBOX_WM_CONF_ENV = expat=yes
 
-################################################################################
-
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
 ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
 MATCHBOX_WM_CONF_OPTS += --enable-composite
@@ -40,6 +38,4 @@ else
 MATCHBOX_WM_CONF_OPTS += --disable-startup-notification
 endif
 
-################################################################################
-
 $(eval $(autotools-package))
