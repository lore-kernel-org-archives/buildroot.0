From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Jun 2013 12:36:39 +0200
Subject: [Buildroot] [PATCH] gvfs: bump to 1.16.2
Message-ID: <1370774199-14550-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the libglib2 bump, gvfs must be updated. We don't bump to
the latest 1.17.1, because it requires libglib2 2.37, and we have only
libglib2 2.36.x at this point.

Fixes:

   http://autobuild.buildroot.net/results/d02/d026f3e697d60a3730f89acab18515eb568c4d0e/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gvfs/gvfs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 32d8b49..d99c784 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GVFS_VERSION_MAJOR = 1.8
+GVFS_VERSION_MAJOR = 1.16
 GVFS_VERSION_MINOR = 2
 GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
-GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
+GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
 GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info
-- 
1.8.1.2
