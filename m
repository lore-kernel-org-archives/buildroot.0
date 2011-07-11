From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 15:53:46 +0200
Subject: [Buildroot] [PATCH 02/12] linux: indent and align some definitions
In-Reply-To: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b5726dec06543122cd9aff7a50c199d69bbc1e28.1310392269.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6dfd558..9a63382 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -3,20 +3,20 @@
 # Linux kernel target
 #
 ###############################################################################
-LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_VERSION := $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(LINUX_VERSION),custom)
-LINUX_TARBALL:=$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
-LINUX_SITE:=$(dir $(LINUX_TARBALL))
-LINUX_SOURCE:=$(notdir $(LINUX_TARBALL))
+LINUX_TARBALL := $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
+LINUX_SITE    := $(dir $(LINUX_TARBALL))
+LINUX_SOURCE  := $(notdir $(LINUX_TARBALL))
 else
-LINUX_SOURCE:=linux-$(LINUX_VERSION).tar.bz2
-LINUX_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+LINUX_SOURCE  := linux-$(LINUX_VERSION).tar.bz2
+LINUX_SITE    := $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 endif
 
-LINUX_DIR:=$(BUILD_DIR)/linux-$(LINUX_VERSION)
-LINUX_PATCH=$(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+LINUX_DIR     := $(BUILD_DIR)/linux-$(LINUX_VERSION)
+LINUX_PATCH   := $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
-- 
1.7.4.1
