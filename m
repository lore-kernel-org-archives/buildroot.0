From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 21 Jun 2013 11:20:11 +0100
Subject: [Buildroot] [PATCH] gvfs: Select and depend on libgcrypt
Message-ID: <1371810011-13339-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Fixes the following build problem when building gvfs
without having libgcrypt installed.

gvfsbackendafpbrowse.c:31:20: fatal error: gcrypt.h: No such file or directory

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/gvfs/Config.in | 1 +
 package/gvfs/gvfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index e0a945e..3791830 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GVFS
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SHARED_MIME_INFO
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index d99c784..0a2eece 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -10,7 +10,7 @@ GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
-GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info
+GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libgcrypt libglib2 dbus shared-mime-info
 
 GVFS_CONF_OPT = \
 	--disable-gconf			\
-- 
1.8.2.1
