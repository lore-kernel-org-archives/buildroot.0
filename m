From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:34 +0200
Subject: [Buildroot] [PATCH 83/83 v2] boot/uboot: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <779b15791a114a8e6ee44e85122e1dd4baaf3196.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uboot has more than 5 options, so use a 'menuconfig' to
group the options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 9ffbb51..8e5ecda 100644
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
2.7.4
