From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2011 21:54:10 +0200
Subject: [Buildroot] [PATCH 19/28] linux: indent and align some definitions
In-Reply-To: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <09a3c565867699c31ced8ed16bb49ef3a53de049.1309895466.git.thomas.petazzoni@free-electrons.com>
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
index 8e685fd..83af4e2 100644
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
