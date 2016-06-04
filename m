From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Jun 2016 18:30:51 +0200
Subject: [Buildroot] [PATCH 5/8 v3] linux: use the generic help rules
In-Reply-To: <cover.1465056706.git.yann.morin.1998@free.fr>
References: <cover.1465056706.git.yann.morin.1998@free.fr>
Message-ID: <6da8d3725c067c93761c6c9918188c8ab7bbe5c3.1465056706.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile       | 6 ------
 linux/linux.mk | 7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index f5ae613..bb3d588 100644
--- a/Makefile
+++ b/Makefile
@@ -941,12 +941,6 @@ help:
 		@echo $(sep) \
 		@echo '$($(p)_NAME):' $(sep) \
 		$($(p)_HELP_CMDS)$(sep))
-ifeq ($(BR2_LINUX_KERNEL),y)
-	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
-	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
-	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
-	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
-endif
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
 endif
diff --git a/linux/linux.mk b/linux/linux.mk
index 4f4f802..d6d9132 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -8,6 +8,13 @@ LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPLv2
 LINUX_LICENSE_FILES = COPYING
 
+define LINUX_HELP_CMDS
+	$(call print-help,linux-menuconfig,Run Linux kernel menuconfig)
+	$(call print-help,linux-savedefconfig,Run Linux kernel savedefconfig)
+	$(call print-help,linux-update-defconfig,Save the Linux configuration \
+		to the path specified by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+endef
+
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
-- 
2.7.4
