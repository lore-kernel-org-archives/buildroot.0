From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:22 +0200
Subject: [Buildroot] [PATCH 11/83 v2] package/nfs-utils: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <975a2e949c201e16f3e33268347609fcfe4531b7.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nfs-utils/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 1273092..7476fdb 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -2,7 +2,7 @@ comment "nfs-utils needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_NFS_UTILS
+menuconfig BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -15,8 +15,6 @@ config BR2_PACKAGE_NFS_UTILS
 
 if BR2_PACKAGE_NFS_UTILS
 
-menu "NFS utilities selection"
-
 config BR2_PACKAGE_NFS_UTILS_RPCDEBUG
 	bool "rpcdebug"
 	help
@@ -32,6 +30,4 @@ config BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD
 	help
 	  NFS remote quota server
 
-endmenu
-
 endif
-- 
2.7.4
