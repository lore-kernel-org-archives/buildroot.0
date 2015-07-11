From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 11 Jul 2015 16:48:19 +0200
Subject: [Buildroot] [PATCH 1/3] nfs-utils: Add rpcbind as a runtime
	dependency
Message-ID: <1436626101-3598-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rpcbind is necessary for nfs_utils to works as a server

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/nfs-utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 66f9c21..2806551 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_RPCBIND # runtime
 	depends on BR2_USE_MMU # fork()
 	help
 	  The NFS Linux kernel server.
-- 
2.1.4
