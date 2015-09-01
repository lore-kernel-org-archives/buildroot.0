From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  2 Sep 2015 01:10:34 +0200
Subject: [Buildroot] [PATCH] system: use a menuconfig for the getty options
Message-ID: <1441149034-27282-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Making the getty option a menuconfig instead of a simple config
automatically moves its dependees into a menu without the need to
manually declare such a menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index fad829d..ea45cf3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -260,12 +260,11 @@ config BR2_SYSTEM_BIN_SH
 	default "dash"    if BR2_SYSTEM_BIN_SH_DASH
 	default "zsh"     if BR2_SYSTEM_BIN_SH_ZSH
 
-config BR2_TARGET_GENERIC_GETTY
+menuconfig BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
 	default y
 
 if BR2_TARGET_GENERIC_GETTY
-menu "getty options"
 config BR2_TARGET_GENERIC_GETTY_PORT
 	string "TTY port"
 	default "console"
@@ -313,7 +312,6 @@ config BR2_TARGET_GENERIC_GETTY_OPTIONS
 	help
 	  Any other flags you want to pass to getty,
 	  Refer to getty --help for details.
-endmenu
 endif
 
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
-- 
1.9.1
