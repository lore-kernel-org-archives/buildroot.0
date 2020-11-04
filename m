From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Nov 2020 20:27:40 +0100
Subject: [Buildroot] [git commit] package/modem-manager: bump to version
 1.14.6
Message-ID: <20201104192313.0D03B86C6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8efb52c1a17210dc79cfb61f56a71ffb760ccbe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NOTE: this version requires mbim: >= 1.24.0, qmi: >= 1.26.0.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modem-manager/Config.in          | 1 +
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index c4c723776d..062826fd0a 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MODEM_MANAGER
 	select BR2_PACKAGE_DBUS # runtime dependency
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBXSLT
 	help
 	  ModemManager is a DBus-activated daemon which controls mobile
 	  broadband (2G/3G/4G) devices and connections.
diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index bf8f965812..30c4c6988d 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b2b3058bbb72adf98b24707fdbebe58e590644a38145e30d574f685f154bf8aa  ModemManager-1.12.10.tar.xz
+sha256  783d5da925b2ca69f6233fcead691dd0f5cba06aa479d71495efdc07053fc0fd  ModemManager-1.14.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index e69f6f0f3d..53cd0aff9a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.12.10
+MODEM_MANAGER_VERSION = 1.14.6
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 libxslt $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
 
