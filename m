From: Lubomir Rintel <lkundrak@v3.sk>
Date: Mon,  4 Nov 2019 14:03:44 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/network-manager: bump to
 version 1.21.2"
Message-ID: <20191104130345.3799456-1-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "1.21.2" is not a NetworkManager release, it's a development
snapshot. Bring the package back to 1.20.x stable series.

This reverts commit 9cf61746a28178cff8e700257ecddf950e958ec5.
It should eventually be brought back, but just not yet.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 package/network-manager/network-manager.hash | 7 +++----
 package/network-manager/network-manager.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 4e568260b7..d65b933887 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,6 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.21/NetworkManager-1.21.2.sha256sum
-sha256 99813d98a236a0b8198429cd59235cfdb14321f5ea8b16e4dee90bd4d186f412  NetworkManager-1.21.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.20.2.sha256sum
+sha256 514e373f2c46536cacca644af859fb535c7a9ac4988a54d861d76f44c87fac84  NetworkManager-1.20.2.tar.xz
 # Locally computed
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
+sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
 sha256 64a6d38d1b551a1bfd8509e732cdc9202d2681b61f5b39298f488674d3466fc9  CONTRIBUTING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 6412d3a241..529176da9c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.21
+NETWORK_MANAGER_VERSION_MAJOR = 1.20
 NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
@@ -15,7 +15,7 @@ NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls \
 # parts of network-manager are under LGPL-2.0. See the "Legal" section
 # of the CONTRIBUTING file for details.
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.0+ (libnm)
-NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING
+NETWORK_MANAGER_LICENSE_FILES = COPYING CONTRIBUTING
 
 NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
-- 
2.23.0
