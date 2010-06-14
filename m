From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: remove
	unused/useless code
Message-ID: <20100614203442.3D8C0804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=004acd88b14a8ad146a45932ded4416cbe1c07ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index dc475e4..1d1091e 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -50,8 +50,6 @@ $(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked .config
 		$(AT91BOOTSTRAP_BOARD)_defconfig
 	touch $(AT91BOOTSTRAP_DIR)/.configured
 
-#		$(BOARD_NAME)_defconfig
-
 $(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.configured
 	$(MAKE) \
 		MEMORY=$(AT91BOOTSTRAP_MEMORY) \
@@ -61,19 +59,13 @@ $(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.configured
 
 $(AT91BOOTSTRAP_DIR)/.installed:: $(AT91BOOTSTRAP_TARGET)
 	mkdir -p $(BINARIES_DIR)
-ifeq	($(AT91BOOTSTRAP_VERSION),2.3)
-	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-else
 	make MEMORY=$(AT91BOOTSTRAP_MEMORY) \
 		CROSS_COMPILE=$(TARGET_CROSS) \
 		-C $(AT91BOOTSTRAP_DIR) boot
 	make DESTDIR=$(BINARIES_DIR) -C $(AT91BOOTSTRAP_DIR) install || \
 		echo "Could not copy bootstrap to BINARIES_DIR"
-endif
 	touch $@
 
-#	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-
 .PHONY: at91bootstrap at91bootstrap-source
 
 at91bootstrap: $(AT91BOOTSTRAP_DIR)/.installed
@@ -97,8 +89,4 @@ at91bootstrap-dirclean:
 #############################################################
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
 TARGETS+=at91bootstrap
-endif
-
-at91bootstrap-status:
-	@echo AT91BOOTSTRAP_BOARD=$(AT91BOOTSTRAP_BOARD)
 
-- 
1.7.1
