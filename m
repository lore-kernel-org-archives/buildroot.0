From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 23:28:10 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/nfs-utils:
 rpcbind is only needed for rpc.nfsd
Message-ID: <20210105222212.6D638865B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad95564214c23de463d9d86a551050540c576fc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

rpcbind is only used by nfsd to export nfs share supporting older
v2, v3 protocols.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr:
  - move the select to the corresponding symbol
  - tweak the commit title
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 95fdf09731cc6bba748bed37878e6697c41f0c33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
