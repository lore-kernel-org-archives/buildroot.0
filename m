From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  6 Nov 2015 19:23:45 +0100
Subject: [Buildroot] [PATCH] system: Fix warning when selecting systemd
Message-ID: <1446834225-19878-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With systemd and a custom skeleton, you end up with the following
warning:
warning: (BR2_INIT_SYSTEMD) selects BR2_ROOTFS_MERGED_USR which has
unmet direct dependencies (BR2_ROOTFS_SKELETON_DEFAULT)

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.6.1
