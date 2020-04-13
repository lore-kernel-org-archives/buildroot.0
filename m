From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2020 22:06:33 +0200
Subject: [Buildroot] [git commit] package/libva: switch back to
 upstream-provided tarball
Message-ID: <20200413195324.7C99A8EAD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a12dfc3ef6ef521428a7bcb13c112bfe8b18fec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libva/libva.hash | 2 +-
 package/libva/libva.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 53a9f3cceb..ad9f9003a9 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0952ee21069c560f48ebafcba91e1ffb72e5a8736dbab3559af959221b51598f  libva-2.7.0.tar.gz
+sha256 b75be416615dea75c74314fae8919dd72ca46d06b4e009e029661c2c51d87d70  libva-2.7.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index f430847b2f..84819ae2ef 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -5,12 +5,11 @@
 ################################################################################
 
 LIBVA_VERSION = 2.7.0
-LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
+LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
+LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
 LIBVA_INSTALL_STAGING = YES
-# github tarball does not include configure
-LIBVA_AUTORECONF = YES
 LIBVA_DEPENDENCIES = host-pkgconf libdrm
 
 # libdrm is a hard-dependency
