From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 13 Jul 2011 23:47:29 +0200
Subject: [Buildroot] [PATCH] Config: unbreak check-source caused by empty
	defconfigs
Message-ID: <1310593649-26237-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running check-source uses an allyesconfig-like configuration.
But in this case, the defconfig files for BareBox, U-Boot and
the Linux kernel are not set, thus braking the check.

This patch fixes it by setting a dummy value '(none)' as the
default value for the three affected defconfig entries.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 boot/barebox/Config.in |    1 +
 boot/uboot/Config.in   |    1 +
 linux/Config.in        |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index a821c45..852df65 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,6 +8,7 @@ menuconfig BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
 	string "board defconfig"
+	default "(none)"
 	help
 	  Name of the board for which Barebox should be built, without
 	  the _defconfig suffix.
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 070533e..bcd556d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -6,6 +6,7 @@ menuconfig BR2_TARGET_UBOOT
 if BR2_TARGET_UBOOT
 config BR2_TARGET_UBOOT_BOARDNAME
 	string "U-Boot board name"
+	default "(none)"
 	help
 	  One of U-Boot supported boards to be built.
 	  This will be suffixed with _config to meet U-Boot standard naming.
diff --git a/linux/Config.in b/linux/Config.in
index 8d3b0ba..a8ba98f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -111,6 +111,7 @@ endchoice
 config BR2_LINUX_KERNEL_DEFCONFIG
 	string "Defconfig name"
 	depends on BR2_LINUX_KERNEL_USE_DEFCONFIG
+	default "(none)"
 	help
 	 Name of the defconfig file to use, without the trailing
 	 _defconfig
-- 
1.7.2.5
