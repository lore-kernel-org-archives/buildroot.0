From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jul 2013 22:18:47 +0200
Subject: [Buildroot] [git commit] package/owl-linux: drop check for EABI
Message-ID: <20130714204246.B7D129A49D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=171df5276f837c177f94e9f70aa89224cc0c104e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... since we only support EABI now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/owl-linux/Config.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

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
