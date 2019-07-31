From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jul 2019 21:45:55 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/gvfs: fix build
 with NLS
Message-ID: <20190731212528.36781813E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6234c9d7a575e911c3d91f614afd1c184447ff62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - http://autobuild.buildroot.org/results/8b061756ae6081d21d6ede8b27844f8fc3131953

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1a82e952370724d58002ec60bc09542f550f316f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 47fbe0e858..9bfe9e60fb 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -9,13 +9,16 @@ GVFS_VERSION = $(GVFS_VERSION_MAJOR).4
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
-GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info
+GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info \
+	$(TARGET_NLS_DEPENDENCIES)
 GVFS_LICENSE = LGPL-2.0+
 GVFS_LICENSE_FILES = COPYING
 
 # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
 # build system from searching the host paths.
-GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+GVFS_CONF_ENV = \
+	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
+	LIBS=$(TARGET_NLS_LIBS)
 
 # Most of these are missing library support
 GVFS_CONF_OPTS = \
