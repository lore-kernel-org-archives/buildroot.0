From: Laurent Cans <laurent.cans@gmail.com>
Date: Mon, 17 Feb 2014 23:32:49 +0100
Subject: [Buildroot] [PATCH 1/1] uboot: build custom target if custom target
	selected
Message-ID: <1392676369-19238-1-git-send-email-laurent.cans@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When selecting custom uboot target the installation fail due to incorrect
target built. So when configuring custom uboot target, build the target
configured in buildroot configuration instead of legacy one.

Signed-off-by: Laurent Cans <laurent.cans@gmail.com>
---
 boot/uboot/uboot.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2174584..3e16b7a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -51,6 +51,7 @@ UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 UBOOT_DEPENDENCIES += host-elftosb
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BIN          = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
+UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 else
 UBOOT_BIN          = u-boot.bin
 UBOOT_BIN_IFT      = $(UBOOT_BIN).ift
-- 
1.7.10.4
