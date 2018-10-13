From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Oct 2018 15:28:43 +0200
Subject: [Buildroot] [PATCH 2/2] gvfs: bump to version 1.31.4
In-Reply-To: <20181013132843.21702-1-fontaine.fabrice@gmail.com>
References: <20181013132843.21702-1-fontaine.fabrice@gmail.com>
Message-ID: <20181013132843.21702-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.31.4 which is the first version including the fix for
glibc 2.28 issue with major/minor:
https://gitlab.gnome.org/GNOME/gvfs/commit/3424bef7ef71dc3a8c2c71310671cd6d39e7b3e7

Do not bump to latest version of gvfs as:
- this is a major rework: autotools has been dropped in favor of meson
- it requires libglib in version 2.57.1 and we have currently 2.56.1

Also:
- add hash for license file
- Remove --disable-bash-completion, no more option since 1.31.1:
  https://gitlab.gnome.org/GNOME/gvfs/commit/2f28fa49cfeb1c82927a1c7c0021b15e2742149f
- Remove --disable-hal, dropped since 1.31.1:
  https://gitlab.gnome.org/GNOME/gvfs/commit/ec9c45d7c7671266193a93500c7477990e390fc7

Fixes:
 - http://autobuild.buildroot.net/results/07fa7b0ad9ae0fa9c2e59d54e4d4c76ae4f26166

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gvfs/gvfs.hash | 7 +++++--
 package/gvfs/gvfs.mk   | 6 ++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index 63ad77de83..6b7403ffa4 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.30/gvfs-1.30.3.sha256sum
-sha256	b824a29489cae7f39e1a0fc0d154ac7b7bf43d8edd98ba83ffcad2f766d0f175	gvfs-1.30.3.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.31/gvfs-1.31.4.sha256sum
+sha256	55244d447d040884dfb335fde638274cb6f2794285ada7fa84bcbbd34f06be04	gvfs-1.31.4.tar.xz
+
+# Hash for license file
+sha256	45cf336e2e48176993babc5aabf44437390f40e6a86a472c6abfc7ce9c035db4	COPYING
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 6b20fd9b9a..bb9b9d0f77 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GVFS_VERSION_MAJOR = 1.30
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).3
+GVFS_VERSION_MAJOR = 1.31
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).4
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
@@ -21,14 +21,12 @@ GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-con
 GVFS_CONF_OPTS = \
 	--disable-afc \
 	--disable-admin \
-	--disable-bash-completion \
 	--disable-cdda \
 	--disable-gcr \
 	--disable-gdu \
 	--disable-goa \
 	--disable-google \
 	--disable-gphoto2 \
-	--disable-hal \
 	--disable-keyring \
 	--disable-libmtp \
 	--disable-udisks2
-- 
2.17.1
