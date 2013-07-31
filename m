From: Nathan Ford <nford@westpond.com>
Date: Wed, 31 Jul 2013 10:31:53 -0400
Subject: [Buildroot] [PATCH] Fix building initramfs kernel with appended dtb
Message-ID: <1375281113-18893-1-git-send-email-nford@westpond.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Nathan Ford <nford@westpond.com>
---
 linux/linux.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 17e9838..9d29d9d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -311,7 +311,8 @@ endif
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_TARGET)
+	$(LINUX_APPEND_DTB)
 	# Copy the kernel image to its final destination
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 	# If there is a .ub file copy it to the final destination
-- 
1.7.9.5
