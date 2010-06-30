From: =?UTF-8?q?Henri=20H=C3=A4kkinen?= <henuxd@gmail.com>
Date: Wed, 30 Jun 2010 13:43:47 +0300
Subject: [Buildroot] [PATCH] Fixed LINUX26_IMAGE_PATH
Message-ID: <1277894627-4586-1-git-send-email-henuxd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel image is actually located in boot/images/ rather than in boot/
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 593a1b4..355276e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -42,7 +42,7 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX26_IMAGE_NAME=vmlinux.bin
 endif
 
-LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
+LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_IMAGE_NAME)
 
 # Download
 $(LINUX26_DIR)/.stamp_downloaded:
-- 
1.7.0.4
