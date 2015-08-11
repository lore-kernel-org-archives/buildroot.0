From: Charles Manning <cdhmanning@gmail.com>
Date: Tue, 11 Aug 2015 19:17:02 +1200
Subject: [Buildroot] [PATCH] wf111: Add mdev dependency
Message-ID: <1439277422-26111-1-git-send-email-cdhmanning@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wf111 really needs mdev

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 package/wf111/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wf111/Config.in b/package/wf111/Config.in
index d2ba440..c8a7537 100644
--- a/package/wf111/Config.in
+++ b/package/wf111/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_WF111
 	bool "wf111"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
+	 depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 	# Binary tools are distributed alongside the driver, and are
 	# dynamically linked against the glibc.
 	depends on BR2_TOOLCHAIN_USES_GLIBC
@@ -30,7 +31,7 @@ config BR2_PACKAGE_WF111_TARBALL_PATH
 
 endif
 
-comment "wf111 needs an (e)glibc toolchain"
+comment "wf111 needs an (e)glibc toolchain and mdev"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
-- 
1.9.1
