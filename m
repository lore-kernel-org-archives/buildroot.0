From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Jul 2021 06:43:29 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/network-manager: bump to version
 1.32.2
Message-ID: <20210717124329.3383315-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - use stable 1.32.2 instead of 1.33.1
---
 package/network-manager/network-manager.hash | 6 +++---
 package/network-manager/network-manager.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index aef06dde2c..6efd697af4 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,6 +1,6 @@
-# From https://download.gnome.org/sources/NetworkManager/1.22/NetworkManager-1.22.16.sha256sum
-sha256  377aa053752eaa304b72c9906f9efcd9fbd5f7f6cb4cd4ad72425a68982cffc6  NetworkManager-1.22.16.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.32/NetworkManager-1.32.2.sha256sum
+sha256  701d511067f757d0f92f412c98cdb49a74a6ba69448aabb1beadacbc171e3873  NetworkManager-1.32.2.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  f0543c137bc0eece552d42642d1bab31707ca3b3663d9c7a81ac3b270a4780e7  CONTRIBUTING
+sha256  65fd94885d3a5f468755e7cbe1334e56ef3a32b8a73980967fa9839c10514aa9  CONTRIBUTING.md
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 607c2b402b..fbd5b1c85c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.22
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).16
+NETWORK_MANAGER_VERSION_MAJOR = 1.32
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
-NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING
+NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
 NETWORK_MANAGER_CPE_ID_VENDOR = gnome
 NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
 NETWORK_MANAGER_SELINUX_MODULES = networkmanager
-- 
2.25.1
