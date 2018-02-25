From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:40:22 +0100
Subject: [Buildroot] [git commit] uboot: revert "uboot: use local libfdt.h"
Message-ID: <20180225214110.8D50481E5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b15a7a62d3f992af3fa8eca1e358735c47b64390
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 3a6573ccee2624de0c604abf2c7df6704a4cf566.

It is no longer necessary after solving the problem differently.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
