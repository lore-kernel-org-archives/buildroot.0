From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Jun 2013 20:33:46 +0200
Subject: [Buildroot] [git commit] gvfs: bump to 1.16.2
Message-ID: <20130609190558.6110D9AA3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d0f68f4767df9bc79c206ec03314e60ffa4e7eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the libglib2 bump, gvfs must be updated. We don't bump to
the latest 1.17.1, because it requires libglib2 2.37, and we have only
libglib2 2.36.x at this point.

Fixes:

   http://autobuild.buildroot.net/results/d02/d026f3e697d60a3730f89acab18515eb568c4d0e/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gvfs/gvfs.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
