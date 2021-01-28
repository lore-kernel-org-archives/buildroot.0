From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 Jan 2021 14:33:38 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: drop redundant parentheses
Message-ID: <e66442f596117c0b73f9e43ee838688a1563164c.1611837218.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d8db91fc6fa ("package/uboot-tools: resolve host uboot env/script
error") introduced closing parentheses that is not matched and not
needed.

Fixes:
http://autobuild.buildroot.net/results/a65/a65fcc581f56ef70154f83e80f12d64f2e0f856a/
http://autobuild.buildroot.net/results/39a/39aabb9d8afcdead1d620e081d2cd43ee2d61fbc/

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uboot-tools/uboot-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index f2bd627e927e..a0cdcafd4e7e 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -160,7 +160,7 @@ endif #BR_BUILDING
 define HOST_UBOOT_TOOLS_GENERATE_BOOT_SCRIPT
 	$(@D)/tools/mkimage -C none -A $(MKIMAGE_ARCH) -T script \
 		-d $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE)) \
-		$(@D)/tools/boot.scr)
+		$(@D)/tools/boot.scr
 endef
 define HOST_UBOOT_TOOLS_INSTALL_BOOT_SCRIPT
 	$(INSTALL) -m 0755 -D $(@D)/tools/boot.scr $(BINARIES_DIR)/boot.scr
-- 
2.29.2
