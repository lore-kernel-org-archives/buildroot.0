From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  6 Mar 2014 10:42:28 +0100
Subject: [Buildroot] [PATCH v2 3/4] linux: fix coding style
In-Reply-To: <1394098949-31981-1-git-send-email-fabio.porcedda@gmail.com>
References: <1394098949-31981-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1394098949-31981-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated in the Buildroot user manual add one space before and after
a = sign.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 linux/linux.mk | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index f948e6c..3d52e69 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -41,7 +41,7 @@ endif
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES  += host-kmod host-lzop
+LINUX_DEPENDENCIES += host-kmod host-lzop
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 	LINUX_DEPENDENCIES += host-uboot-tools
@@ -80,36 +80,36 @@ endif
 KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
-LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
+LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
-LINUX_IMAGE_NAME=uImage
+LINUX_IMAGE_NAME = uImage
 else ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
-LINUX_IMAGE_NAME=uImage
+LINUX_IMAGE_NAME = uImage
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
-LINUX_IMAGE_NAME=bzImage
+LINUX_IMAGE_NAME = bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
-LINUX_IMAGE_NAME=zImage
+LINUX_IMAGE_NAME = zImage
 else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
-LINUX_IMAGE_NAME=zImage
+LINUX_IMAGE_NAME = zImage
 else ifeq ($(BR2_LINUX_KERNEL_CUIMAGE),y)
-LINUX_IMAGE_NAME=cuImage.$(KERNEL_DTS_NAME)
+LINUX_IMAGE_NAME = cuImage.$(KERNEL_DTS_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
-LINUX_IMAGE_NAME=simpleImage.$(KERNEL_DTS_NAME)
+LINUX_IMAGE_NAME = simpleImage.$(KERNEL_DTS_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
-LINUX_IMAGE_NAME=linux.bin
+LINUX_IMAGE_NAME = linux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
-LINUX_IMAGE_NAME=vmlinux.bin
+LINUX_IMAGE_NAME = vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
-LINUX_IMAGE_NAME=vmlinux
+LINUX_IMAGE_NAME = vmlinux
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
-LINUX_IMAGE_NAME=vmlinuz
+LINUX_IMAGE_NAME = vmlinuz
 endif
 endif
 
 LINUX_KERNEL_UIMAGE_LOADADDR=$(call qstrip,$(BR2_LINUX_KERNEL_UIMAGE_LOADADDR))
 ifneq ($(LINUX_KERNEL_UIMAGE_LOADADDR),)
-LINUX_MAKE_FLAGS+=LOADADDR="$(LINUX_KERNEL_UIMAGE_LOADADDR)"
+LINUX_MAKE_FLAGS += LOADADDR="$(LINUX_KERNEL_UIMAGE_LOADADDR)"
 endif
 
 # Compute the arch path, since i386 and x86_64 are in arch/x86 and not
@@ -117,22 +117,22 @@ endif
 # for bzImage, arch/i386 and arch/x86_64 do not exist when copying the
 # defconfig file.
 ifeq ($(KERNEL_ARCH),i386)
-KERNEL_ARCH_PATH=$(LINUX_DIR)/arch/x86
+KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/x86
 else ifeq ($(KERNEL_ARCH),x86_64)
-KERNEL_ARCH_PATH=$(LINUX_DIR)/arch/x86
+KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/x86
 else
-KERNEL_ARCH_PATH=$(LINUX_DIR)/arch/$(KERNEL_ARCH)
+KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
-LINUX_IMAGE_PATH=$(LINUX_DIR)/$(LINUX_IMAGE_NAME)
+LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
-LINUX_IMAGE_PATH=$(LINUX_DIR)/$(LINUX_IMAGE_NAME)
+LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else
 ifeq ($(KERNEL_ARCH),avr32)
-LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/images/$(LINUX_IMAGE_NAME)
+LINUX_IMAGE_PATH = $(KERNEL_ARCH_PATH)/boot/images/$(LINUX_IMAGE_NAME)
 else
-LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
+LINUX_IMAGE_PATH = $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
 endif
 endif # BR2_LINUX_KERNEL_VMLINUX
 
-- 
1.8.3.2
