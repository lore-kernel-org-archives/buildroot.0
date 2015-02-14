From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 10:23:14 +0100
Subject: [Buildroot] [PATCH 11/12 v2] package/eudev: we won't miss you, avr32
In-Reply-To: <cover.1423905753.git.yann.morin.1998@free.fr>
References: <cover.1423905753.git.yann.morin.1998@free.fr>
Message-ID: <f2259a2e5fa0e763c50a73b42c27e6ef79cd92ba.1423905753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/eudev/Config.in | 3 ---
 system/Config.in        | 2 --
 2 files changed, 5 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 7916fd0..7934cd7 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_EUDEV
 	bool "eudev"
-	depends on !BR2_avr32 # no epoll_create1
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_LARGEFILE # util-linux
@@ -32,11 +31,9 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
 endif
 
 comment "eudev needs eudev /dev management"
-	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 
 comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
-	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/system/Config.in b/system/Config.in
index 95e10ab..fb8b686 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -124,7 +124,6 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using eudev"
-	depends on !BR2_avr32 # eudev
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
@@ -133,7 +132,6 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	select BR2_PACKAGE_EUDEV
 
 comment "eudev needs a toolchain w/ largefile, wchar, dynamic library, headers >= 3.9"
-	depends on !BR2_avr32 # eudev
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
-- 
1.9.1
