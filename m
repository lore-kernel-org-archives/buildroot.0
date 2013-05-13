From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 13 May 2013 09:58:40 +0200
Subject: [Buildroot] [PATCH] linux: CONFIG_KERNEL_LZO option requires
	host-lzop
Message-ID: <1368431920-22020-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the LZO compression mode is chosen the linux kernel requires
lzop host utility at build time.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d375cf0..3877c35 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -34,7 +34,7 @@ endif
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES  += host-module-init-tools
+LINUX_DEPENDENCIES  += host-module-init-tools host-lzop
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 	LINUX_DEPENDENCIES += host-uboot-tools
-- 
1.8.1.4
