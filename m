From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 28 Aug 2012 10:17:32 +0200
Subject: [Buildroot] [PATCH] Clean kernel when "make linux-clean" is called
Message-ID: <1346141852-31102-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When "make linux-clean" is typed one expects that the kernel tree
gets cleaned. Before this patch, only the stamp files had been
removed.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 linux/linux.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..ae07256 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -255,6 +255,10 @@ define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
+define LINUX_CLEAN_CMDS
+	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) clean
+endef
+
 include linux/linux-ext-*.mk
 
 $(eval $(generic-package))
-- 
1.7.0.4
