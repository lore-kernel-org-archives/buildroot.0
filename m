From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 16 Nov 2020 10:44:39 +0100
Subject: [Buildroot] [PATCH] package/modem-manager: bump to version 1.14.8
Message-ID: <20201116094439.137637-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There should be no longer any need for the ac_cv_prog_XSLTPROC_CHECK
hack, this release already removes xsltproc from being a build
dependency when building from dist tarballs.

https://lists.freedesktop.org/archives/modemmanager-devel/2020-November/008279.html

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 30c4c6988d..81a08295f7 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  783d5da925b2ca69f6233fcead691dd0f5cba06aa479d71495efdc07053fc0fd  ModemManager-1.14.6.tar.xz
+sha256  fe1a26ba51b4bda7abd09ad4dadedd87d8b8154809fc9d88e94f75fdfff19295  ModemManager-1.14.8.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 372e7da1e4..47d4eed823 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.14.6
+MODEM_MANAGER_VERSION = 1.14.8
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
@@ -12,7 +12,6 @@ MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
-MODEM_MANAGER_CONF_ENV = ac_cv_prog_XSLTPROC_CHECK=yes
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
-- 
2.28.0
