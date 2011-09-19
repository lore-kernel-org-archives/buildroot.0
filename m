From: keguang.zhang at gmail.com <keguang.zhang@gmail.com>
Date: Mon, 19 Sep 2011 17:47:21 +0800
Subject: [Buildroot] [PATCH] Add vmlinuz support in Kernel binary format for
	MIPS.
Message-ID: <1316425641-2731-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Kelvin Cheung <keguang.zhang@gmail.com>

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 linux/Config.in |    4 ++++
 linux/linux.mk  |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5655286..09e5685 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -148,6 +148,10 @@ config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
 	depends on BR2_mips || BR2_mipsel
 
+config BR2_LINUX_KERNEL_VMLINUZ
+	bool "vmlinuz"
+	depends on BR2_mips || BR2_mipsel
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index f249d96..32b588c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -63,6 +63,8 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX_IMAGE_NAME=vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_NAME=vmlinux
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
+LINUX_IMAGE_NAME=vmlinuz
 endif
 endif
 
@@ -80,6 +82,8 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_PATH=$(LINUX_DIR)/$(LINUX_IMAGE_NAME)
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
+LINUX_IMAGE_PATH=$(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else
 ifeq ($(KERNEL_ARCH),avr32)
 LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/images/$(LINUX_IMAGE_NAME)
-- 
1.7.1
