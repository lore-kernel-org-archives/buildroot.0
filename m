From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 15:25:39 +0200
Subject: [Buildroot] [git commit] package/network-manager: drop obsolete
 dependencies
Message-ID: <20190907132130.D7D9E8C006@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7643ab05de860011e749aa720c92d5de150bee0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove dependencies on libraries NetworkManager no longer uses.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index f1e632328a..529176da9c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -9,8 +9,8 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
-	libgcrypt wireless_tools util-linux host-intltool readline libndp libgudev
+NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls \
+	libgcrypt wireless_tools util-linux host-intltool readline libndp
 # Even though the COPYING file only contains the GPL-2.0 text, many
 # parts of network-manager are under LGPL-2.0. See the "Legal" section
 # of the CONTRIBUTING file for details.
