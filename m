From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Mon, 19 Feb 2018 16:56:32 +0100
Subject: [Buildroot] [PATCH master 2/2] Revert "uboot: use local libfdt.h"
In-Reply-To: <20180219155632.30086-1-thomas.de_schampheleire@nokia.com>
References: <20180219155632.30086-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180219155632.30086-3-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 3a6573ccee2624de0c604abf2c7df6704a4cf566.

It is no longer necessary after solving the problem differently.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 boot/uboot/uboot.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 977f44cad8..c7cd739150 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -188,13 +188,6 @@ define UBOOT_APPLY_LOCAL_PATCHES
 endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 
-# Bug: https://patchwork.ozlabs.org/patch/833760/
-define UBOOT_FIX_LIBFDT_SYSTEM_PATH
-	[ ! -e $(@D)/tools/fdtgrep.c ] || \
-	$(SED) 's%<../include/libfdt.h>%"../include/libfdt.h"%' $(@D)/tools/fdtgrep.c
-endef
-UBOOT_POST_PATCH_HOOKS += UBOOT_FIX_LIBFDT_SYSTEM_PATH
-
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) 	\
-- 
2.13.6
