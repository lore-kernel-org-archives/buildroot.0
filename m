From: Lubomir Rintel <lkundrak@v3.sk>
Date: Fri,  6 Sep 2019 11:26:13 +0200
Subject: [Buildroot] [PATCH] package/network-manager: drop obsolete
 dependencies
Message-ID: <20190906092613.2610613-1-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove dependencies on libraries NetworkManager no longer uses.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 package/network-manager/Config.in          | 3 ---
 package/network-manager/network-manager.mk | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 2d854fe003..1257e08e6f 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -8,11 +8,8 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_LIBNL
-	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_WIRELESS_TOOLS
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 1b2321f9d2..6cadc830ab 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -9,8 +9,8 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
-	libgcrypt wireless_tools util-linux host-intltool readline libndp libgudev
+NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls \
+	libgcrypt wireless_tools util-linux host-intltool readline libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.0+ (libnm-util)
 NETWORK_MANAGER_LICENSE_FILES = COPYING libnm-util/COPYING
 
-- 
2.21.0
