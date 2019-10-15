From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 09:18:23 +0200
Subject: [Buildroot] [git commit] package/network-manager: bump to version
 1.21.2
Message-ID: <20191015071505.A1B818E152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cf61746a28178cff8e700257ecddf950e958ec5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

per upstream commit: e9f2ea6c22f36cb7986d2228763629ed44b9e76b
https://github.com/NetworkManager/NetworkManager/commit/e9f2ea6c22f36cb7986d2228763629ed44b9e76b

The update to the GPL text in COPYRIGHT is purely cosmetic.

Added COPYING.LGPL to licenses for libnm.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.hash | 7 ++++---
 package/network-manager/network-manager.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index d65b933887..4e568260b7 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,6 @@
-# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.20.2.sha256sum
-sha256 514e373f2c46536cacca644af859fb535c7a9ac4988a54d861d76f44c87fac84  NetworkManager-1.20.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.21/NetworkManager-1.21.2.sha256sum
+sha256 99813d98a236a0b8198429cd59235cfdb14321f5ea8b16e4dee90bd4d186f412  NetworkManager-1.21.2.tar.xz
 # Locally computed
-sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 64a6d38d1b551a1bfd8509e732cdc9202d2681b61f5b39298f488674d3466fc9  CONTRIBUTING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 529176da9c..6412d3a241 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.20
+NETWORK_MANAGER_VERSION_MAJOR = 1.21
 NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
@@ -15,7 +15,7 @@ NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls \
 # parts of network-manager are under LGPL-2.0. See the "Legal" section
 # of the CONTRIBUTING file for details.
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.0+ (libnm)
-NETWORK_MANAGER_LICENSE_FILES = COPYING CONTRIBUTING
+NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING
 
 NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
