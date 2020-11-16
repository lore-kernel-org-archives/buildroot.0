From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 16 Nov 2020 12:40:33 +0100
Subject: [Buildroot] [PATCH] package/nfs-utils: select BR2_PACKAGE_RPCBIND
 only if needed
Message-ID: <20201116114033.844188-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rpcbind is only used by nfsd to export nfs share supporting older
v2, v3 protocols.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/nfs-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index cfca034019..36d799486a 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
-	select BR2_PACKAGE_RPCBIND # runtime
+	select BR2_PACKAGE_RPCBIND if BR2_PACKAGE_NFS_UTILS_RPC_NFSD # runtime# runtime
 	help
 	  The NFS Linux kernel server.
 
-- 
2.25.1
