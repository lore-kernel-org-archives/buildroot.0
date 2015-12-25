From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:53 +0100
Subject: [Buildroot] [PATCH 84/84 RFC] boot/uboot: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <a93897991f9d246db5f8b92c18e4edce191ec6d6.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uboot has more than 5 options, so use a 'menuconfig' to
group the options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/uboot/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index b75006b..a4b2372 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -1,9 +1,10 @@
-config BR2_TARGET_UBOOT
+menuconfig BR2_TARGET_UBOOT
 	bool "U-Boot"
 	help
 	  Build "Das U-Boot" Boot Monitor
 
 if BR2_TARGET_UBOOT
+
 choice
 	prompt "Build system"
 	default BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
-- 
1.9.1
