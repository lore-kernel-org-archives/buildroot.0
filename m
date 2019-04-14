From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sun, 14 Apr 2019 14:43:06 +0100
Subject: [Buildroot] [PATCH 1/2] boot/riscv-pk: add generation of binary bbl
 file
Message-ID: <20190414134307.24754-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support the SiFive HiFive Unleashed board we need to
generate a binary bootloader file ready for writing to an SD card.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 boot/riscv-pk/riscv-pk.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/riscv-pk/riscv-pk.mk b/boot/riscv-pk/riscv-pk.mk
index 0ab5879ee4..f32d96ed3a 100644
--- a/boot/riscv-pk/riscv-pk.mk
+++ b/boot/riscv-pk/riscv-pk.mk
@@ -26,7 +26,9 @@ define RISCV_PK_BUILD_CMDS
 endef
 
 define RISCV_PK_INSTALL_IMAGES_CMDS
+	$(TARGET_OBJCOPY) -S -O binary $(@D)/build/bbl $(@D)/build/bbl.bin
 	$(INSTALL) -D -m 0755 $(@D)/build/bbl $(BINARIES_DIR)/bbl
+	$(INSTALL) -D -m 0755 $(@D)/build/bbl.bin $(BINARIES_DIR)/bbl.bin
 endef
 
 $(eval $(generic-package))
-- 
2.19.1
