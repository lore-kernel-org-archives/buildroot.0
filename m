From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 16:47:22 -0300
Subject: [Buildroot] [PATCH 6/7] network-manager: needs libgcrypt
In-Reply-To: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356724043-8879-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we moved to gnutls 3.x series which doesn't use libgcrypt we need
to pull it in as a dependency to avoid build breakage.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.8.6
