From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 7 Aug 2012 17:09:33 +0800
Subject: [Buildroot] [PATCH 1/5] buildroot:linux: Rename blackfin kernel
	Image file from vmImage back to uImage.
Message-ID: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Consist with other architectures.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 linux/linux.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5365d5f..c4bdf90 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -69,12 +69,7 @@ ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
-ifeq ($(KERNEL_ARCH),blackfin)
-# a uImage, but with a different file name
-LINUX_IMAGE_NAME=vmImage
-else
 LINUX_IMAGE_NAME=uImage
-endif
 else ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 LINUX_IMAGE_NAME=uImage
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
-- 
1.7.0.4
