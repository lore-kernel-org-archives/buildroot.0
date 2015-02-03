From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2015 15:21:46 +0100
Subject: [Buildroot] [PATCH 06/10] linux: qstrip the path to the custom
	configuration file
In-Reply-To: <cover.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <4bd6723d3283469509941b98a57654aff2198531.1422972638.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Even though this is not strictly necessary with the current version of
linux.mk, it becomes necessary when migrating linux.mk to the kconfig
infrastructure.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 29f59e8..a321fa7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -171,7 +171,7 @@ LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
 
 define LINUX_CONFIGURE_CMDS
-- 
1.9.1
