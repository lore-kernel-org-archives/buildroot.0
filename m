From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 14:58:05 +0100
Subject: [Buildroot] [git commit] system: Fix warning when selecting systemd
Message-ID: <20151108140055.174E08042A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4718c3a28fc3b178253b24bd6fbb8540a724c7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With systemd and a custom skeleton, you end up with the following
warning:
warning: (BR2_INIT_SYSTEMD) selects BR2_ROOTFS_MERGED_USR which has
unmet direct dependencies (BR2_ROOTFS_SKELETON_DEFAULT)

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 4d07010..92712a8 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -92,7 +92,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-	select BR2_ROOTFS_MERGED_USR
+	select BR2_ROOTFS_MERGED_USR if BR2_ROOTFS_SKELETON_DEFAULT
 	select BR2_PACKAGE_SYSTEMD
 
 comment "systemd needs (e)glibc toolchain, headers >= 3.10"
