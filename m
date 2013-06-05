From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Jun 2013 18:21:09 +0200
Subject: [Buildroot] [PATCH 1/2] linux: qstrip the custom DTS path
Message-ID: <1370449270-22014-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes a problem reported by wacha at mit.bme.hu, see
http://lists.busybox.net/pipermail/buildroot/2013-June/073312.html.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 11b32c3..177446d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -55,7 +55,7 @@ LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
-KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))
+KERNEL_DTS_NAME = $(basename $(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
-- 
1.8.1.2
