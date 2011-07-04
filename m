From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2011 23:33:36 +0200
Subject: [Buildroot] [PATCH 19/28] linux: indent and align some definitions
In-Reply-To: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1389ae6ea476daf9a18cece03545204f734dfd4c.1309815048.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0aab92d..eea84b5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -7,16 +7,16 @@ LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(LINUX_VERSION),custom)
-LINUX_TARBALL:=$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
-LINUX_SITE:=$(dir $(LINUX_TARBALL))
-LINUX_SOURCE:=$(notdir $(LINUX_TARBALL))
+LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
+LINUX_SITE    = $(dir $(LINUX_TARBALL))
+LINUX_SOURCE  = $(notdir $(LINUX_TARBALL))
 else
-LINUX_SOURCE:=linux-$(LINUX_VERSION).tar.bz2
-LINUX_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+LINUX_SOURCE  = linux-$(LINUX_VERSION).tar.bz2
+LINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 endif
 
-LINUX_DIR:=$(BUILD_DIR)/linux-$(LINUX_VERSION)
-LINUX_PATCH=$(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+LINUX_DIR     = $(BUILD_DIR)/linux-$(LINUX_VERSION)
+LINUX_PATCH   = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
-- 
1.7.4.1
