From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:45:24 +0200
Subject: [Buildroot] [git commit] system: fix unmet dependencies
Message-ID: <20160911134931.6434D8210A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9ea19e8fb4952db6748023f613ebb19f78fc036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't force remounting / read/write when using a customskeleton and
systemd as init system, to fix the following unmet dependencies:

    warning: (BR2_INIT_SYSTEMD) selects BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
    which has unmet direct dependencies (BR2_ROOTFS_SKELETON_DEFAULT)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 353421a..77c665b 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -127,7 +127,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
-	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
+	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW if BR2_ROOTFS_SKELETON_DEFAULT
 
 comment "systemd needs a glibc toolchain, headers >= 3.10"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
