From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:21 -0000
Subject: [Buildroot] [git commit] linux: qstrip the path to the custom
	configuration file
Message-ID: <20150302222717.D476A807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89a47724e943fe449ce55b6341d64744fcb8e18a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though this is not strictly necessary with the current version of
linux.mk, it becomes necessary when migrating linux.mk to the kconfig
infrastructure.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
