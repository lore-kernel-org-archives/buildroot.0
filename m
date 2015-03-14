From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 15:25:21 +0100
Subject: [Buildroot] [PATCH 5/5 v2] linux: migrate extensions to use the new
	infrastructure
In-Reply-To: <cover.1426342904.git.yann.morin.1998@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
Message-ID: <724c084b0e9f1d98670184ab5e77a2381e04d67c.1426342904.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux-ext-fbtft.mk   | 8 +-------
 linux/linux-ext-rtai.mk    | 8 +-------
 linux/linux-ext-xenomai.mk | 8 +-------
 3 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
index 6892c89..3e6a3cc 100644
--- a/linux/linux-ext-fbtft.mk
+++ b/linux/linux-ext-fbtft.mk
@@ -4,9 +4,7 @@
 # Patch the linux kernel with fbtft extension
 ################################################################################
 
-ifeq ($(BR2_LINUX_KERNEL_EXT_FBTFT),y)
-# Add dependency to fbtft package (download helper for the fbtft source)
-LINUX_PATCH_DEPENDENCIES += fbtft
+LINUX_EXTENSIONS += fbtft
 
 # for linux >= 3.15 install to drivers/video/fbdev/fbtft
 # for linux < 3.15 install to drivers/video/fbtft
@@ -22,7 +20,3 @@ define FBTFT_PREPARE_KERNEL
 		>> $${dest}/Kconfig ; \
 	echo 'obj-y += fbtft/' >> $${dest}/Makefile
 endef
-
-LINUX_PRE_PATCH_HOOKS += FBTFT_PREPARE_KERNEL
-
-endif #BR2_LINUX_KERNEL_EXT_FBTFT
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index 942b430..07e7a19 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -4,9 +4,7 @@
 # Patch the linux kernel with RTAI extension
 ################################################################################
 
-ifeq ($(BR2_LINUX_KERNEL_EXT_RTAI),y)
-# Add dependency to RTAI (user-space) which provide kernel patches
-LINUX_PATCH_DEPENDENCIES += rtai
+LINUX_EXTENSIONS += rtai
 
 RTAI_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_RTAI_PATCH))
 
@@ -41,7 +39,3 @@ define RTAI_PREPARE_KERNEL
 		$(notdir $(RTAI_PATCH))
 endef
 endif
-
-LINUX_PRE_PATCH_HOOKS += RTAI_PREPARE_KERNEL
-
-endif #BR2_LINUX_EXT_RTAI
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index f6a5ffd..76a9786 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -4,9 +4,7 @@
 # Patch the linux kernel with xenomai extension
 ################################################################################
 
-ifeq ($(BR2_LINUX_KERNEL_EXT_XENOMAI),y)
-# Add dependency to xenomai (user-space) which provide ksrc part
-LINUX_PATCH_DEPENDENCIES += xenomai
+LINUX_EXTENSIONS += xenomai
 
 # Adeos patch version
 XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
@@ -24,7 +22,3 @@ define XENOMAI_PREPARE_KERNEL
 		$(XENOMAI_ADEOS_OPTS) \
 		--verbose
 endef
-
-LINUX_PRE_PATCH_HOOKS += XENOMAI_PREPARE_KERNEL
-
-endif #BR2_LINUX_EXT_XENOMAI
-- 
1.9.1
