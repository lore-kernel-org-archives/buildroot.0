From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Fri,  8 Mar 2013 11:11:29 +0100
Subject: [Buildroot] [PATCH 1/2] Fix missing qstrip for KERNEL_DTS_NAME
Message-ID: <1362737490-26398-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_LINUX_KERNEL_CUSTOM_DTS_PATH is quoted and the quotes prevent
to build the kernel.

Signed-off-by: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0352acd..a854a63 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -55,7 +55,7 @@ LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
-KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))
+KERNEL_DTS_NAME = $(basename $(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
-- 
1.7.1
