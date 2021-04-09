From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Apr 2021 23:29:05 +0200
Subject: [Buildroot] [git commit] package/network-manager: bump to version
 1.22.16
Message-ID: <20210409210633.A46D9817AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6db751e1e129e62fde0b9c3d7de69f21f639e8b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Notice: This fixes a security issue, but in code not used in Buildroot:

ifcfg-rh: handle "802-1x.{,phase2-}ca-path". Otherwise setting this
property silently fails and a profile might accidentally not perform
any authentication (CVE-2020-10754).

Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.22.16/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: Clarify that security issue isn't applicable to Buildroot]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/network-manager.hash | 10 +++++-----
 package/network-manager/network-manager.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 93a9b5017e..aef06dde2c 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,6 +1,6 @@
-# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.22.10.sha256sum
-sha256 2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77  NetworkManager-1.22.10.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.22/NetworkManager-1.22.16.sha256sum
+sha256  377aa053752eaa304b72c9906f9efcd9fbd5f7f6cb4cd4ad72425a68982cffc6  NetworkManager-1.22.16.tar.xz
 # Locally computed
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256 f0543c137bc0eece552d42642d1bab31707ca3b3663d9c7a81ac3b270a4780e7  CONTRIBUTING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
+sha256  f0543c137bc0eece552d42642d1bab31707ca3b3663d9c7a81ac3b270a4780e7  CONTRIBUTING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 9402564cb4..607c2b402b 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.22
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).10
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).16
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
