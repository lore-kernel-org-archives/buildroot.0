From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 16:12:29 +0200
Subject: [Buildroot] [git commit] libass: bump to version 0.14.0
Message-ID: <20180429142028.536328821B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1c1f1592ead39fd0c475c40b67cbf91b4fa166b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch from yasm to nasm: see
  https://github.com/libass/libass/commit/0ce4c19a5f273fa8200cd84a578a618634a5d507

- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libass/libass.hash | 3 ++-
 package/libass/libass.mk   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index d98b163f38..74ea5f921d 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 7065e5f5fb76e46f2042a62e7c68d81e5482dbeeda24644db1bd066e44da7e9d  libass-0.13.7.tar.xz
+sha256 881f2382af48aead75b7a0e02e65d88c5ebd369fe46bc77d9270a94aa8fd38a2  libass-0.14.0.tar.xz
+sha256 f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 41f027d4c7..50600963ed 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.13.7
+LIBASS_VERSION = 0.14.0
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
@@ -18,10 +18,10 @@ LIBASS_DEPENDENCIES = \
 	libfribidi \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-# configure: WARNING: Install yasm for a significantly faster libass build.
+# configure: WARNING: Install nasm for a significantly faster libass build.
 # only for Intel archs
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
-LIBASS_DEPENDENCIES += host-yasm
+LIBASS_DEPENDENCIES += host-nasm
 endif
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
