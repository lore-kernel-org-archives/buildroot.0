From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 12 Mar 2020 11:29:38 -0700
Subject: [Buildroot] [PATCH 1/3] fs/cramfs: add depends on
 !BR2_PACKAGE_LIBSELINUX
Message-ID: <20200312182941.3322627-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

cramfs does not support extended attributes (xattrs) needed for SELinux to
function.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 fs/cramfs/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/cramfs/Config.in b/fs/cramfs/Config.in
index 89f8ad52b8..891efade3b 100644
--- a/fs/cramfs/Config.in
+++ b/fs/cramfs/Config.in
@@ -1,5 +1,6 @@
 config BR2_TARGET_ROOTFS_CRAMFS
 	bool "cramfs root filesystem"
+	depends on !BR2_PACKAGE_LIBSELINUX
 	help
 	  Build a cramfs root filesystem
 
@@ -24,3 +25,6 @@ config BR2_TARGET_ROOTFS_CRAMFS_XIP
 	  4.15+ kernel.
 
 endif # BR2_TARGET_ROOTFS_CRAMFS
+
+comment "cramfs does not support SELinux"
+	depends on BR2_PACKAGE_LIBSELINUX
-- 
2.24.1
