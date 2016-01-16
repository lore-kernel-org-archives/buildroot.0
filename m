From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:11 +0100
Subject: [Buildroot] [PATCH 79/80 v1] boot/uboot: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <ea90707bd0d01c5c38abed57fb60305a30fd9255.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uboot has more than 5 options, so use a 'menuconfig' to
group the options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
