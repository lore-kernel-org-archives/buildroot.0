From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Mon, 19 Mar 2012 17:31:47 -0300
Subject: [Buildroot] [PATCH] linux: invert test logic to fix build error.
Message-ID: <1332189109-23697-1-git-send-email-aletes.xgr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c0334d2..6cb1efc 100644
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
1.7.9.1
