From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:21:50 +0200
Subject: [Buildroot] [PATCH 16/49] u-boot: remove unused U_BOOT_TARGET_TOOLS
	variable
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4a587b12eb387e0cb44e5a1c27dc765fc98a60c3.1276352308.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index a562da2..220eeb2 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -30,7 +30,6 @@ U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
 
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/config.h
 
-U_BOOT_TARGET_TOOLS:=
 ifeq ($(BR2_TARGET_UBOOT_TOOL_MKIMAGE),y)
 U_BOOT_TARGETS+=$(TARGET_DIR)/usr/bin/mkimage
 endif
@@ -155,7 +154,7 @@ u-boot: $(U_BOOT_TARGETS)
 
 u-boot-clean:
 	-$(MAKE) -C $(U_BOOT_DIR) clean
-	rm -f $(MKIMAGE) $(U_BOOT_TARGET_TOOLS)
+	rm -f $(MKIMAGE)
 
 u-boot-dirclean:
 	rm -rf $(U_BOOT_DIR)
-- 
1.7.0.4
