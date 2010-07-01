From: =?UTF-8?q?Henri=20H=C3=A4kkinen?= <henuxd@gmail.com>
Date: Thu,  1 Jul 2010 11:10:59 +0300
Subject: [Buildroot] [PATCH] Fixed LINUX26_IMAGE_PATH on avr32 arch
Message-ID: <1277971859-2226-1-git-send-email-henuxd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel image is actually located in boot/images/ rather than in boot/ in
avr32 architecture.

Signed-off-by: Henri H?kkinen <henuxd@gmail.com>
---
 linux/linux.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 593a1b4..37370de 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -42,7 +42,11 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX26_IMAGE_NAME=vmlinux.bin
 endif
 
+ifeq ($(KERNEL_ARCH),avr32)
+LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_IMAGE_NAME)
+else
 LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
+endif
 
 # Download
 $(LINUX26_DIR)/.stamp_downloaded:
-- 
1.7.0.4
