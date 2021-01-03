From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 12:42:52 +0100
Subject: [Buildroot] [git commit] package/nfs-utils: rpcbind is only needed
 for rpc.nfsd
Message-ID: <20210103112613.E1FE28618E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95fdf09731cc6bba748bed37878e6697c41f0c33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rpcbind is only used by nfsd to export nfs share supporting older
v2, v3 protocols.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr:
  - move the select to the corresponding symbol
  - tweak the commit title
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nfs-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index cfca034019..da563db0f1 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
-	select BR2_PACKAGE_RPCBIND # runtime
 	help
 	  The NFS Linux kernel server.
 
@@ -28,6 +27,7 @@ config BR2_PACKAGE_NFS_UTILS_RPC_LOCKD
 config BR2_PACKAGE_NFS_UTILS_RPC_NFSD
 	bool "rpc.nfsd"
 	default y
+	select BR2_PACKAGE_RPCBIND # runtime
 	help
 	  NFS server
 
