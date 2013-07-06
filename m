From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:49 +0200
Subject: [Buildroot] [PATCH 10/12] package/owl-linux: drop check for EABI
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <6784d71367a8a13d6b51dcaeed2caeedb920b3d9.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... since we only support EABI now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/owl-linux/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/owl-linux/Config.in b/package/owl-linux/Config.in
index 1dcf5f1..9b14027 100644
--- a/package/owl-linux/Config.in
+++ b/package/owl-linux/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_OWL_LINUX
 	bool "owl-linux"
 	depends on BR2_LINUX_KERNEL
 	depends on (BR2_arm920t || BR2_arm922t || BR2_arm926t)
-	depends on BR2_ARM_EABI
 	help
 	  Linux kernel driver for the H&D Wireless SPB104 SD-card WiFi SIP.
 
@@ -14,6 +13,6 @@ comment "owl-linux requires a Linux kernel"
 	depends on !BR2_LINUX_KERNEL
 	depends on BR2_arm || BR2_armeb
 
-comment "owl-linux is only supported on ARM9 architecture with EABI"
-	depends on !(BR2_arm920t || BR2_arm922t || BR2_arm926t) || !BR2_ARM_EABI
+comment "owl-linux is only supported on ARM9 architecture"
+	depends on !(BR2_arm920t || BR2_arm922t || BR2_arm926t)
 	depends on BR2_arm || BR2_armeb
-- 
1.8.1.2
