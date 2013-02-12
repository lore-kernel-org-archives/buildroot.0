From: Michael Nagy <nagy@accelecon.com>
Date: Tue, 12 Feb 2013 11:55:35 -0500
Subject: [Buildroot] [PATCH] Fixed dts parent directory issue.
Message-ID: <1360688135-7785-1-git-send-email-nagy@accelecon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 linux/linux.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..8182f62 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -190,14 +190,14 @@ define LINUX_BUILD_DTB
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
 endef
 define LINUX_INSTALL_DTB
-	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
+	cp $(KERNEL_ARCH_PATH)/boot/dts/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
 endef
 endif
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 define LINUX_APPEND_DTB
-	cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb >> $(KERNEL_ARCH_PATH)/boot/zImage
+	cat $(KERNEL_ARCH_PATH)/boot/dts/$(KERNEL_DTS_NAME).dtb >> $(KERNEL_ARCH_PATH)/boot/zImage
 	# We need to generate the uImage here after that so that the uImage is
 	# generated with the right image size.
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) uImage
-- 
1.7.9.5
