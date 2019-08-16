From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Aug 2019 11:09:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/autofs: fix mount,
 umount and fsck program paths
Message-ID: <20190816090913.16141-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11876

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/autofs/autofs.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index e7c65ef4b0..5de399edf2 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -11,11 +11,17 @@ AUTOFS_LICENSE = GPL-2.0+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
 AUTOFS_DEPENDENCIES = host-flex host-bison host-pkgconf host-nfs-utils
 
-# autofs looks on the build machine for the path of modprobe, so tell
-# it explicitly where it will be located on the target.
+# autofs looks on the build machine for the path of modprobe, mount, umount and
+# fsck programs so tell it explicitly where it will be located on the target.
 AUTOFS_CONF_ENV = \
+	ac_cv_path_E2FSCK=/usr/sbin/fsck.ext2 \
+	ac_cv_path_E3FSCK=/usr/sbin/fsck.ext3 \
+	ac_cv_path_E4FSCK=/usr/sbin/fsck.ext4 \
 	ac_cv_path_KRB5_CONFIG=no \
 	ac_cv_path_MODPROBE=/sbin/modprobe \
+	ac_cv_path_MOUNT=/bin/mount \
+	ac_cv_path_MOUNT_NFS=/usr/sbin/mount.nfs \
+	ac_cv_path_UMOUNT=/bin/umount \
 	ac_cv_linux_procfs=yes
 
 # instead of looking in the PATH like any reasonable package, autofs
-- 
2.20.1
