From: Markus Kaindl <markus.kaindl@stusta.mhn.de>
Date: Wed, 21 Mar 2012 02:19:04 +0100
Subject: [Buildroot] [PATCH] linux.mk: .ub-File copying after building
	initramfs
Message-ID: <1332292744-11797-1-git-send-email-markus.kaindl@stusta.mhn.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

test should exit with Exit-Code 0 if no .ub-File present and copy the
file if Exit-Code 1, otherwise make fails

Signed-off-by: Markus Kaindl <markus.kaindl@stusta.mhn.de>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2a29de8..2fb890e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -230,7 +230,7 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 	# Copy the kernel image to its final destination
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 	# If there is a .ub file copy it to the final destination
-	test -f $(LINUX_IMAGE_PATH).ub && cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
+	test ! -f $(LINUX_IMAGE_PATH).ub || cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
 	$(Q)touch $@
 
 # The initramfs building code must make sure this target gets called
-- 
1.7.3.4
