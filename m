From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:06:04 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/autofs: fix mount,
 umount and fsck program paths
Message-ID: <20190902150200.87DB28A28E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55cbaea691f5636b3ec39dc370609f436069262c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11876

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8c89a3a9a1d591d151daed2c081376dbd512083b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autofs/autofs.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index e7c65ef4b0..0af00fa936 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -11,11 +11,18 @@ AUTOFS_LICENSE = GPL-2.0+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
 AUTOFS_DEPENDENCIES = host-flex host-bison host-pkgconf host-nfs-utils
 
-# autofs looks on the build machine for the path of modprobe, so tell
-# it explicitly where it will be located on the target.
+# autofs looks on the build machine for the path of modprobe, mount,
+# umount and fsck programs so tell it explicitly where they will be
+# located on the target.
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
