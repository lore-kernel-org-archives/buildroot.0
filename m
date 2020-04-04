From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Apr 2020 17:26:59 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 2.7.0
Message-ID: <20200404151744.185AF8B4D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=226bbae9d13e9fd46f81e75e60c8623085b4a0cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched to github helper, upstream does not provide a tarball for this
release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva/libva.hash | 4 +---
 package/libva/libva.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 8edacf1289..53a9f3cceb 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,3 @@
-# From https://github.com/intel/libva/releases/download/2.6.1/libva-2.6.1.tar.bz2.sha1sum
-sha1 6b218e5622174a37fd0cfd8777b10717c95bd20e  libva-2.6.1.tar.bz2
 # Locally computed
-sha256 6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5  libva-2.6.1.tar.bz2
+sha256 0952ee21069c560f48ebafcba91e1ffb72e5a8736dbab3559af959221b51598f  libva-2.7.0.tar.gz
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 5e9bedbbd5..f430847b2f 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.6.1
-LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
-LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
+LIBVA_VERSION = 2.7.0
+LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
 LIBVA_INSTALL_STAGING = YES
+# github tarball does not include configure
+LIBVA_AUTORECONF = YES
 LIBVA_DEPENDENCIES = host-pkgconf libdrm
 
 # libdrm is a hard-dependency
