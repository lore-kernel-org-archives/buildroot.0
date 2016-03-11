From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:41:15 +0100
Subject: [Buildroot] [PATCH 7/9 v2] linux: add the generic help rules
In-Reply-To: <cover.1457717002.git.yann.morin.1998@free.fr>
References: <cover.1457717002.git.yann.morin.1998@free.fr>
Message-ID: <c7bf667d720789649418bf79d7c690558c8941a2.1457717002.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile       | 6 ------
 linux/linux.mk | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 43fa20e..ca7a02e 100644
--- a/Makefile
+++ b/Makefile
@@ -935,12 +935,6 @@ help-internal:
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
 	@$(call print-help,$(PACKAGE_HELP))
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
index 7e20255..d530d00 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -8,6 +8,12 @@ LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPLv2
 LINUX_LICENSE_FILES = COPYING
 
+LINUX_HELP = \
+	"linux-menuconfig : Run Linux kernel menuconfig" \
+	"linux-savedefconfig : Run Linux kernel savedefconfig" \
+	"linux-update-defconfig : Save the Linux configuration to the path specified \
+				  by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE"
+
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
-- 
1.9.1
