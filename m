From: Petr Kulhavy <brain@jikos.cz>
Date: Thu,  1 Sep 2016 16:51:33 +0200
Subject: [Buildroot] [PATCH 1/2] boot/uboot: add missing SPL build dependency
In-Reply-To: <1472741494-7043-1-git-send-email-brain@jikos.cz>
References: <1472741494-7043-1-git-send-email-brain@jikos.cz>
Message-ID: <1472741494-7043-2-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If SPL installation is selected make does not always build the SPL binary.
Add the SPL binary explicitly to the build command.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7c3512a..a62f7be 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -149,7 +149,7 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 define UBOOT_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
-		$(UBOOT_MAKE_TARGET)
+		$(UBOOT_MAKE_TARGET) $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
 	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
 		$(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
-- 
2.7.4
