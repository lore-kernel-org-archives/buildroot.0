From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:51 +0100
Subject: [Buildroot] [PATCH 82/84 RFC] boot/grub: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <e066fd4b8d753cd95c9d70ca5d91517ee94461eb.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

grub has more than 5 options, so use a 'menuconfig' to
group the options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/grub/Config.in | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/boot/grub/Config.in b/boot/grub/Config.in
index 4db8642..3ae688f 100644
--- a/boot/grub/Config.in
+++ b/boot/grub/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_GRUB
+menuconfig BR2_TARGET_GRUB
 	bool "grub"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
@@ -52,7 +52,7 @@ config BR2_TARGET_GRUB_DISKLESS
 	help
 	  enable diskless support
 
-menu "filesystem drivers"
+comment "Filesystem drivers"
 
 config BR2_TARGET_GRUB_FS_EXT2
 	bool "ext2"
@@ -86,9 +86,7 @@ config BR2_TARGET_GRUB_FS_XFS
 	help
 	  Enable support for the XFS filesystem in Grub.
 
-endmenu
-
-menu "network drivers"
+comment "Network drivers"
 
 config BR2_TARGET_GRUB_3c595
 	bool "3Com595 driver"
@@ -195,6 +193,4 @@ config BR2_TARGET_GRUB_w89c840
 	help
 	  enable Winbond W89c840 driver
 
-endmenu
-
 endif # BR2_TARGET_GRUB
-- 
1.9.1
