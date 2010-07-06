From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 6 Jul 2010 11:30:52 -0700
Subject: [Buildroot] [PATCH] linux: rebuild after reconfiguring kernel
Message-ID: <201007061130.52946.hartleys@visionengravers.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for rebuilding the kernel after make linux26-menuconfig.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/linux/linux.mk b/linux/linux.mk
index 593a1b4..a014f55 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -139,6 +139,7 @@ linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_in
 
 linux26-menuconfig linux26-xconfig linux26-gconfig: $(LINUX26_DIR)/.stamp_configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
+	$(Q)touch $@
 
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
