From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 27 Aug 2012 16:20:03 +0200
Subject: [Buildroot] [PATCH] Clean kernel when "make linux-clean" is called
Message-ID: <1346077203-16144-1-git-send-email-sho@relinux.de>
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
 linux/linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..e9a5da9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -268,6 +268,8 @@ linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig li
 linux-savedefconfig linux26-savedefconfig: dirs linux-configure
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
+linux-clean:
+	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) clean
 
 ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 linux-update-config linux26-update-config: linux-configure $(LINUX_DIR)/.config
-- 
1.7.0.4
