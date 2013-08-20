From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Aug 2013 13:05:41 +0200
Subject: [Buildroot] [PATCH 2/3] linux: use kmod instead of module-init-tools
In-Reply-To: <1376996742-4638-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996742-4638-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1376996742-4638-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 578d535..025fd51 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -35,7 +35,7 @@ endif
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES  += host-module-init-tools host-lzop
+LINUX_DEPENDENCIES  += host-kmod host-lzop
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 	LINUX_DEPENDENCIES += host-uboot-tools
-- 
1.8.1.2
