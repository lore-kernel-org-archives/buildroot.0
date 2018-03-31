From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:35 -0300
Subject: [Buildroot] [PATCH 10/36] linux/linux*.mk: fix code style
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-11-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use only one space before backslash.
Remove consecutive empty line.
Indent with tabs.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 linux/linux-ext-rtai.mk |  4 ++--
 linux/linux.mk          | 23 +++++++++++------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index 46e3dae3a7..50f79f8d50 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -20,8 +20,8 @@ endif
 define RTAI_PREPARE_KERNEL
 	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
 	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
-		$(APPLY_PATCHES) $(LINUX_DIR)				\
-			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/	\
+		$(APPLY_PATCHES) $(LINUX_DIR) \
+			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ \
 			hal-linux-$${kver}-*patch ; \
 	else \
 		echo "No RTAI patch for your kernel version" ; \
diff --git a/linux/linux.mk b/linux/linux.mk
index e98b25cb72..907ef2b315 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -373,8 +373,8 @@ define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
-	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then	\
-		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
+	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
+		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ; \
 	fi
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
@@ -404,15 +404,14 @@ endif
 
 define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
-	if grep -q "CONFIG_DTC=y" $(@D)/.config; then	\
-		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/bin/linux-dtc ;	\
-		if [ ! -e $(HOST_DIR)/bin/dtc ]; then	\
-			ln -sf linux-dtc $(HOST_DIR)/bin/dtc ;	\
-		fi	\
+	if grep -q "CONFIG_DTC=y" $(@D)/.config; then \
+		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/bin/linux-dtc ; \
+		if [ ! -e $(HOST_DIR)/bin/dtc ]; then \
+			ln -sf linux-dtc $(HOST_DIR)/bin/dtc ; \
+		fi \
 	fi
 endef
 
-
 define LINUX_INSTALL_IMAGES_CMDS
 	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
 	$(call LINUX_INSTALL_DTB,$(BINARIES_DIR))
@@ -426,10 +425,10 @@ define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
-	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then	\
+	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
 		$(LINUX_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
-		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;		\
-		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
+		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
+		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
 	fi
 	$(LINUX_INSTALL_HOST_TOOLS)
 endef
@@ -484,7 +483,7 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
 $(error No kernel device tree source specified, check your \
-BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
+	BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
 endif
 
 endif # BR_BUILDING
-- 
2.14.1
