From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Feb 2015 23:34:23 +0100
Subject: [Buildroot] [PATCH 04/12] linux: get rid of avr32 specifics
In-Reply-To: <cover.1423866603.git.yann.morin.1998@free.fr>
References: <cover.1423866603.git.yann.morin.1998@free.fr>
Message-ID: <9dcaeeca2b73a0d016a3fd39807dcc1a6a40b5fb.1423866603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/Config.in | 2 +-
 linux/linux.mk  | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c981493..9873ea0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -174,7 +174,7 @@ choice
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
-		   BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64 || \
+		   BR2_powerpc || BR2_sh || BR2_sh64 || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 29f59e8..c9a7e9d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -137,11 +137,7 @@ LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else
-ifeq ($(KERNEL_ARCH),avr32)
-LINUX_IMAGE_PATH = $(KERNEL_ARCH_PATH)/boot/images/$(LINUX_IMAGE_NAME)
-else
 LINUX_IMAGE_PATH = $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
-endif
 endif # BR2_LINUX_KERNEL_VMLINUX
 
 define LINUX_DOWNLOAD_PATCHES
-- 
1.9.1
