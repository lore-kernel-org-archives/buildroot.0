From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 25 Oct 2008 01:08:06 +0200
Subject: [Buildroot] [PATCH] package: remove/replace PKG_CONFIG_SYSROOT
Message-ID: <200810250108.06823.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PKG_CONFIG_SYSROOT is not recognized by pkg-config,
PKG_CONFIG_SYSROOT_DIR is the valid environment variable name.
---
 package/audio/libogg/libogg.mk       |    1 -
 package/audio/libvorbis/libvorbis.mk |    1 -
 package/docker/docker.mk             |    2 +-
 package/editors/vim/vim.mk           |    2 +-
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/audio/libogg/libogg.mk b/package/audio/libogg/libogg.mk
index 91deabe..27ecfd1 100644
--- a/package/audio/libogg/libogg.mk
+++ b/package/audio/libogg/libogg.mk
@@ -26,7 +26,6 @@ $(LIBOGG_DIR)/.configured: $(LIBOGG_DIR)/.source
 		CFLAGS="$(TARGET_CFLAGS)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
 		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
-		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
diff --git a/package/audio/libvorbis/libvorbis.mk b/package/audio/libvorbis/libvorbis.mk
index 6e72ad5..19ac354 100644
--- a/package/audio/libvorbis/libvorbis.mk
+++ b/package/audio/libvorbis/libvorbis.mk
@@ -25,7 +25,6 @@ $(LIBVORBIS_DIR)/.configured: $(LIBVORBIS_DIR)/.source
 		CFLAGS="$(TARGET_CFLAGS)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
 		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
-		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index f8f6360..78137cc 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -16,7 +16,7 @@ DOCKER_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) \
 						-I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
 					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
 					PKGCONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
-					PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
+					PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 					PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
diff --git a/package/editors/vim/vim.mk b/package/editors/vim/vim.mk
index cc15bf6..2979a42 100644
--- a/package/editors/vim/vim.mk
+++ b/package/editors/vim/vim.mk
@@ -41,7 +41,7 @@ $(VIM_DIR)/.configured: $(VIM_DIR)/.patched
 		CPP="$(TARGET_CPP)" \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		STRIP="$(TARGET_STRIP)" \
-		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
+		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-- 
1.5.6.4
