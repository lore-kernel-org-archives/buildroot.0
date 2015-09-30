From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2015 23:54:45 +0200
Subject: [Buildroot] [PATCH 2/9] linux: split overly-long dependency line
	for readability
In-Reply-To: <cover.1443650034.git.yann.morin.1998@free.fr>
References: <cover.1443650034.git.yann.morin.1998@free.fr>
Message-ID: <47ba1d9a2c6849fedcdffda03d3313288180ac5f.1443650034.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
This is going to be useful to better understand the initramfs patch
coming next.
---
 linux/linux.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index bbcc54b..316f973 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -390,7 +390,10 @@ $(eval $(kconfig-package))
 
 # Support for rebuilding the kernel after the cpio archive has
 # been generated in $(BINARIES_DIR)/rootfs.cpio.
-$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
+$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed
+$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_images_installed
+$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(BINARIES_DIR)/rootfs.cpio
+$(LINUX_DIR)/.stamp_initramfs_rebuilt:
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
-- 
1.9.1
