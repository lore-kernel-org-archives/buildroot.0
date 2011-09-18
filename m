From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Sep 2011 22:09:42 +0200
Subject: [Buildroot] [git commit] boot: get rid of toplevel submenus
Message-ID: <20110918210214.501348D5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec9ec06b56bcc38f7a5ed98ff8b076e864e74c5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sub options are indented anyway, so no need for empty menus / force people
to enter sub menus to see configuration options.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/at91bootstrap/Config.in |    2 +-
 boot/barebox/Config.in       |    2 +-
 boot/grub/Config.in          |    2 +-
 boot/uboot/Config.in         |    2 +-
 boot/xloader/Config.in       |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index f022dd5..ff968cd 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -1,4 +1,4 @@
-menuconfig BR2_TARGET_AT91BOOTSTRAP
+config BR2_TARGET_AT91BOOTSTRAP
 	depends on BR2_arm
 	bool "AT91 Bootstrap"
 	help
diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 87bf39b..71d530f 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -1,4 +1,4 @@
-menuconfig BR2_TARGET_BAREBOX
+config BR2_TARGET_BAREBOX
 	bool "Barebox"
 	help
 	  The Barebox bootloader, formerly known as U-Boot v2.
diff --git a/boot/grub/Config.in b/boot/grub/Config.in
index bc7a73e..ec48d17 100644
--- a/boot/grub/Config.in
+++ b/boot/grub/Config.in
@@ -9,7 +9,7 @@ config BR2_TARGET_GRUB_SPLASH
 	depends on BR2_TARGET_GRUB
 	help
 	  Add support for splashimage.
-	
+
 	  A splashimage is a 14-color indexed .xpm picture which
 	  is displayed as background for the grub menu.
 
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a0b2bfc..3608cd4 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -1,4 +1,4 @@
-menuconfig BR2_TARGET_UBOOT
+config BR2_TARGET_UBOOT
 	bool "U-Boot"
 	help
 	  Build "Das U-Boot" Boot Monitor
diff --git a/boot/xloader/Config.in b/boot/xloader/Config.in
index d295b45..c411be4 100644
--- a/boot/xloader/Config.in
+++ b/boot/xloader/Config.in
@@ -1,4 +1,4 @@
-menuconfig BR2_TARGET_XLOADER
+config BR2_TARGET_XLOADER
 	bool "X-loader"
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	help
