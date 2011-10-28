From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Oct 2011 10:52:31 +0200
Subject: [Buildroot] [git commit] Add vmlinuz support in Kernel binary
	format for MIPS.
Message-ID: <20111028090516.0E1B98EE41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1485d51e8d66c0608935135ef41f5c5deabc587
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    4 ++++
 linux/linux.mk  |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 469fd7c..0082ca8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -148,6 +148,10 @@ config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
 	depends on BR2_mips || BR2_mipsel || BR2_powerpc
 
+config BR2_LINUX_KERNEL_VMLINUZ
+	bool "vmlinuz"
+	depends on BR2_mips || BR2_mipsel
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 6b6fd5c..9beb706 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -65,6 +65,8 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX_IMAGE_NAME=vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_NAME=vmlinux
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
+LINUX_IMAGE_NAME=vmlinuz
 endif
 endif
 
@@ -82,6 +84,8 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_PATH=$(LINUX_DIR)/$(LINUX_IMAGE_NAME)
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
+LINUX_IMAGE_PATH=$(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else
 ifeq ($(KERNEL_ARCH),avr32)
 LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/images/$(LINUX_IMAGE_NAME)
