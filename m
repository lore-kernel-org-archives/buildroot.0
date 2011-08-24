From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 24 Aug 2011 14:45:46 +0200
Subject: [Buildroot] [git commit] linux: add linux/linux26-savedefconfig
	support
Message-ID: <20110824124641.3F24B8B8BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f5777ce8fbd60c216234de58147f25dfaac88fe6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile       |    1 +
 linux/linux.mk |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 24f0cb2..7e7e25f 100644
--- a/Makefile
+++ b/Makefile
@@ -652,6 +652,7 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 endif
 ifeq ($(BR2_LINUX_KERNEL),y)
 	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
+	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
 endif
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
diff --git a/linux/linux.mk b/linux/linux.mk
index e6cf01a..6662f7b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -184,6 +184,10 @@ linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig li
 		$(subst linux-,,$(subst linux26-,,$@))
 	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
 
+linux-savedefconfig linux26-savedefconfig: dirs $(LINUX_DIR)/.stamp_configured
+	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
+		$(subst linux-,,$(subst linux26-,,$@))
+
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.initramfs
-- 
1.7.3.4
