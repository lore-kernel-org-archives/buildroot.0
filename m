From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 22:26:29 +0100
Subject: [Buildroot] [git commit] network-manager: needs libgcrypt
Message-ID: <20121228213151.9C4379A4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ecb73fbe0ced07034dc637eff4653f732e7487b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we moved to gnutls 3.x series which doesn't use libgcrypt we need
to pull it in as a dependency to avoid build breakage.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/network-manager/Config.in          |    1 +
 package/network-manager/network-manager.mk |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index f2544da..9b84083 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index d14c98d..2a68c96 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -7,7 +7,8 @@ NETWORK_MANAGER_VERSION = 0.9.2.0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.bz2
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/0.9/
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl wireless_tools gnutls util-linux
+NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
+	libgcrypt wireless_tools util-linux
 
 NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
