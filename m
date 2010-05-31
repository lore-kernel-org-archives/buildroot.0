From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:04 +0200
Subject: [Buildroot] [PATCH 18/46] u-boot: remove unneeded symbolic link +
	blank line
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fce3ab311202b3d347f76da0e96d5fd7fbf1bb27.1275343447.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index bc03039..92fdc4c 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -147,7 +147,6 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 		$(addprefix $(U_BOOT_DIR)/lib_generic/,crc32.c md5.c sha1.c) \
 		$(U_BOOT_DIR)/tools/os_support.c \
 		$(U_BOOT_DIR)/libfdt/fdt*.c
-
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 # Build manually fw_printenv for the target
@@ -157,7 +156,6 @@ $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/.configured
 		-DUSE_HOSTCC -o $@ \
 		$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib_generic/crc32.c
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 
 u-boot: $(U_BOOT_TARGETS)
 
-- 
1.7.0.4
