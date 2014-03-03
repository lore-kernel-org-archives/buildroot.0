From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 22:40:46 +0100
Subject: [Buildroot] [git commit] linux: fix check of configuration file
	existence
Message-ID: <20140303214053.9B7719BCC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=477c28cf1d637b224b819dd278103a05fb6f9dbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index ec7dfc3..91a5fb8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -166,9 +166,11 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
 
+ifeq ($(BR2_LINUX_KERNEL),y)
 ifeq ($(wildcard $(KERNEL_SOURCE_CONFIG)),)
 $(error Configuration file '$(KERNEL_SOURCE_CONFIG)' not found.)
 endif
+endif
 
 ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(KERNEL_SOURCE_CONFIG)),y)
 LINUX_DEPENDENCIES += host-lzop
