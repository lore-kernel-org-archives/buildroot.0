From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jun 2017 23:29:08 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 1.8.3
Message-ID: <20170628212845.E4B477FD82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d5c6d0bfca5721adc082f588b5dfd1243243018
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configure option dummy-driver was removed:
https://github.com/01org/libva/commit/8cd60bb59ffac21560d1c424d456cc25e917371f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva/libva.hash | 4 ++--
 package/libva/libva.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 875a4d1..232adee 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,4 +1,4 @@
 # From https://github.com/01org/libva/releases
-sha1 7c4253c97f5e1e76500ff75321287131941494bc  libva-1.8.2.tar.bz2
+sha1 8eee9e28b0ae3bfbe8cd44a91396207714967204  libva-1.8.3.tar.bz2
 # Locally computed
-sha256 9ed3e3ddc8f47a715d4c6ec366beb21c83fc4e8a3d4d39a811baff76f0a0cede  libva-1.8.2.tar.bz2
+sha256 56ee129deba99b06eb4a8d4f746b117c5d1dc2ec5b7a0bfc06971fca1598ab9b  libva-1.8.3.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index b89d5fa..61e3180 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.8.2
+LIBVA_VERSION = 1.8.3
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/01org/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
@@ -15,7 +15,6 @@ LIBVA_DEPENDENCIES = host-pkgconf libdrm
 # libdrm is a hard-dependency
 LIBVA_CONF_OPTS = \
 	--enable-drm \
-	--disable-dummy-driver \
 	--with-drivers-path="/usr/lib/va"
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
