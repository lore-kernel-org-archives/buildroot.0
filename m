From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 16 Nov 2010 09:39:10 -0500
Subject: [Buildroot] [PATCH] linux: update paths to compiled cpio files
Message-ID: <1289918350-17559-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux has been using "usr/initramfs_data.cpio" for a few releases as the
generated cpio name, so the buildroot match of "...cpio.*" won't actually
clean out the previous result.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 4c982f8..4a6025c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -151,7 +151,7 @@ $(LINUX26_DIR)/.stamp_initramfs_rebuilt: $(LINUX26_DIR)/.stamp_installed $(BINAR
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Remove the previously generated initramfs which was empty,
 	# to make sure the kernel will actually regenerate it.
-	$(RM) -f $(@D)/usr/initramfs_data.cpio.*
+	$(RM) -f $(@D)/usr/initramfs_data.cpio*
 	# Build the kernel.
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_IMAGE_NAME)
 	# Copy the kernel image to its final destination
-- 
1.7.3.2
