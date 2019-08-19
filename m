From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Aug 2019 00:05:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/autofs: fix fsck program paths
Message-ID: <20190819220520.24833-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following Arnout review of "autofs: fix mount, umount and fsck program
paths" in https://patchwork.ozlabs.org/patch/1148086, set
ac_cv_path_E2FSCK to /sbin/fsck and ac_cv_path_E{3,4}FSCK to no so that
the fsck wrapper will always gets used (if the e3 and e4 versions don't
exist, the e2 version is used regardless of fs type).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/autofs/autofs.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 1a5cb3ce8f..14e78a7e88 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -15,9 +15,9 @@ AUTOFS_DEPENDENCIES = host-flex host-bison host-pkgconf host-nfs-utils
 # umount and fsck programs so tell it explicitly where they will be
 # located on the target.
 AUTOFS_CONF_ENV = \
-	ac_cv_path_E2FSCK=/usr/sbin/fsck.ext2 \
-	ac_cv_path_E3FSCK=/usr/sbin/fsck.ext3 \
-	ac_cv_path_E4FSCK=/usr/sbin/fsck.ext4 \
+	ac_cv_path_E2FSCK=/sbin/fsck \
+	ac_cv_path_E3FSCK=no \
+	ac_cv_path_E4FSCK=no \
 	ac_cv_path_KRB5_CONFIG=no \
 	ac_cv_path_MODPROBE=/sbin/modprobe \
 	ac_cv_path_MOUNT=/bin/mount \
-- 
2.20.1
