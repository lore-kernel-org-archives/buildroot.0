From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:21:51 +0200
Subject: [Buildroot] [PATCH 17/49] u-boot: add a few comments
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6db01c1b3091aec8c0131f0f559daabb27e78c1c.1276352308.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 220eeb2..90a45b8 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -108,6 +108,7 @@ endif
 endif # BR2_TARGET_UBOOT_NETWORK
 	touch $@
 
+# Build U-Boot itself
 $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
 	$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
@@ -116,6 +117,7 @@ $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
 		$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
 		 -C $(U_BOOT_DIR)
 
+# Copy the result to the images/ directory
 $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	rm -f $(BINARIES_DIR)/$(U_BOOT_BIN)
 	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)/
@@ -129,6 +131,7 @@ $(MKIMAGE): $(U_BOOT_DIR)/.patched
 	$(MAKE) -C $(U_BOOT_DIR) tools
 	cp -dpf $(U_BOOT_DIR)/tools/mkimage $(@D)
 
+# Build manually mkimage for the target
 $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(U_BOOT_DIR)/tools \
@@ -142,6 +145,7 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
+# Build manually fw_printenv for the target
 $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
-- 
1.7.0.4
