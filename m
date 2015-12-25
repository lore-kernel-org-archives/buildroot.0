From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:48 +0100
Subject: [Buildroot] [PATCH 19/84 RFC] package/nfs-utils: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <331bec77cc83ab0666a2973d213052b9f14e5ffb.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
1.9.1
