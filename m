Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFE8E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 12:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DBF260E43;
	Sun, 21 Dec 2025 12:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd34TrbQkJLv; Sun, 21 Dec 2025 12:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57DCE60C2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766321788;
	bh=eYtK53JB9ORqvEfA+ipACiUPTKfvCiFRShzla1XzAiY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qPFryIhRHNalKNrwOOnclAhWsjOSofRsOR8gC3ZS9yBuJZaXJ+lTsMLxP2tkqVN0Y
	 u+dI0dENtkOSQFj5sMS4BBot3uEQZxvV2LpPpEnLyWQcHl1xL6156TIMm0ElVNB3sE
	 BVSgx1IHTXkrw/vY2fqZ7mLGNhVTO57+MBrS3FAQdhVpgWNwCVBwPF7ZIdn2p+qS0V
	 RSw4jR3gddhBPyf/Bu9eOFY1oltN1EU7Mkb7YCW9rc4ZGFyPxLA9MWlhfy0etNUBc8
	 J64zsrZoopuHMIAfBUFjdYfQBBX3vufHduvCDeoW6rdQpZKdkbM7VWrG0M/vVpo3Ww
	 GBUvzXTVF6MSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57DCE60C2E;
	Sun, 21 Dec 2025 12:56:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7541C195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D4F5811CD
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4QRpUoJI3c6 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 12:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F71D811BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F71D811BD
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:56:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84FF087317; Sun, 21 Dec 2025 12:56:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 13:49:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd991649d39c143fa60419691d01ffb816b39bf0
X-Git-Newrev: e4233b02c1bff005062523e23fa31adef0deab52
X-Patchwork-Hint: ignore
Message-Id: <20251221125625.84FF087317@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: bump to version
 1.0.5.0.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e4233b02c1bff005062523e23fa31adef0deab52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop local patch that has been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../esp-hosted/0001-Fix-ng-build-for-6.15.patch    | 167 ---------------------
 package/esp-hosted/esp-hosted.hash                 |   2 +-
 package/esp-hosted/esp-hosted.mk                   |   4 +-
 3 files changed, 3 insertions(+), 170 deletions(-)

diff --git a/package/esp-hosted/0001-Fix-ng-build-for-6.15.patch b/package/esp-hosted/0001-Fix-ng-build-for-6.15.patch
deleted file mode 100644
index 36baed50c7..0000000000
--- a/package/esp-hosted/0001-Fix-ng-build-for-6.15.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From cab85fc98dfcddad6ebf0faa2f5f4f4d6c6562a0 Mon Sep 17 00:00:00 2001
-From: Yogesh Mantri <yogesh.mantri@espressif.com>
-Date: Sun, 8 Jun 2025 12:11:09 +0800
-Subject: [PATCH] Fix(ng): build for 6.15 Fixes #607
-
-Upstream: https://github.com/espressif/esp-hosted/commit/cab85fc98dfcddad6ebf0faa2f5f4f4d6c6562a0
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- esp_hosted_ng/host/Makefile                  | 63 +++++++++-----------
- esp_hosted_ng/host/esp_debugfs.c             |  2 +-
- esp_hosted_ng/host/esp_stats.c               |  1 +
- esp_hosted_ng/host/include/esp_kernel_port.h |  5 ++
- esp_hosted_ng/host/sdio/esp_sdio.c           |  2 +-
- 5 files changed, 36 insertions(+), 37 deletions(-)
-
-diff --git a/esp_hosted_ng/host/Makefile b/esp_hosted_ng/host/Makefile
-index 029f930f55..6fa68c876f 100644
---- a/esp_hosted_ng/host/Makefile
-+++ b/esp_hosted_ng/host/Makefile
-@@ -1,67 +1,60 @@
--# Toolchain Path
-+# Toolchain and kernel
- CROSS_COMPILE :=
--# Linux Kernel header
- KERNEL := /lib/modules/$(shell uname -r)/build
--# Architecture
- ARCH := $(shell uname -m)
- 
--# Check and adjust ARCH for specific cases
-+# Normalize ARCH
- ifeq ($(ARCH), x86_64)
-     ARCH := x86
- endif
--
- ifeq ($(ARCH), aarch64)
-     ARCH := arm64
- endif
- 
--#Default interface is sdio
--MODULE_NAME=esp32_sdio
--
--#enable logging by default
--CONFIG_DEBUG_LOGS := y
-+# Module name (default: sdio)
-+target ?= sdio
-+MODULE_NAME := esp32_$(target)
- 
-+# Debug and AP support
-+CONFIG_DEBUG_LOGS ?= y
- ifeq ($(CONFIG_AP_SUPPORT), y)
--	EXTRA_CFLAGS += -DCONFIG_AP_MODE
-+    EXTRA_CFLAGS += -DCONFIG_AP_MODE
- endif
- 
--#Targets passed overrrides default value
-+# Source and include paths
-+PWD := $(shell pwd)
-+ccflags-y += -I$(src) -I$(src)/include -I$(CURDIR) -I$(CURDIR)/include
-+EXTRA_CFLAGS += -I$(M) -I$(M)/include
-+
-+# Interface-specific sources
- ifeq ($(target), sdio)
--	MODULE_NAME=esp32_sdio
-+    ccflags-y += -I$(src)/sdio -I$(CURDIR)/sdio
-+    EXTRA_CFLAGS += -I$(M)/sdio
-+    module_objects += sdio/esp_sdio.o sdio/esp_sdio_api.o
- endif
- 
- ifeq ($(target), spi)
--	MODULE_NAME=esp32_spi
--endif
--
--#debug_flags := -DDEBUG
--
--EXTRA_CFLAGS += -I$(PWD)/include -I$(PWD)
--
--ifeq ($(MODULE_NAME), esp32_sdio)
--	EXTRA_CFLAGS += -I$(PWD)/sdio
--	module_objects += sdio/esp_sdio.o sdio/esp_sdio_api.o
--endif
--
--ifeq ($(MODULE_NAME), esp32_spi)
--	EXTRA_CFLAGS += -I$(PWD)/spi
--	module_objects += spi/esp_spi.o
-+    ccflags-y += -I$(src)/spi -I$(CURDIR)/spi
-+    EXTRA_CFLAGS += -I$(M)/spi
-+    module_objects += spi/esp_spi.o
- endif
- 
-+# Common source files
- module_objects += esp_bt.o main.o esp_cmd.o esp_utils.o esp_cfg80211.o esp_stats.o esp_debugfs.o esp_log.o
--#$(foreach obj,$(module_objects),$(eval CFLAGS_$(obj:.o=).o := $(debug_flags)))
- CFLAGS_esp_log.o = -DDEBUG
- 
--PWD := $(shell pwd)
--
-+# Module build rules
- obj-m := $(MODULE_NAME).o
- $(MODULE_NAME)-y := $(module_objects)
- 
-+# Build targets
- all: clean
--	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) modules
-+	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) modules
- 
- clean:
--	rm -rf *.o sdio/*.o spi/*.o *.ko
--	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) clean
-+	rm -rf *.o */*.o *.ko *.mod.c *.symvers *.order .*.cmd .tmp_versions
-+	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) clean
- 
- check:
--	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) $(module_objects)
-+	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) $(module_objects)
-+
-diff --git a/esp_hosted_ng/host/esp_debugfs.c b/esp_hosted_ng/host/esp_debugfs.c
-index 74b1813fb4..4399cab825 100644
---- a/esp_hosted_ng/host/esp_debugfs.c
-+++ b/esp_hosted_ng/host/esp_debugfs.c
-@@ -1,4 +1,4 @@
--#include "include/utils.h"
-+#include "utils.h"
- #include <linux/debugfs.h>
- #include <linux/module.h>
- #include <linux/fs.h>
-diff --git a/esp_hosted_ng/host/esp_stats.c b/esp_hosted_ng/host/esp_stats.c
-index 82eff7b0a6..61c37733cb 100644
---- a/esp_hosted_ng/host/esp_stats.c
-+++ b/esp_hosted_ng/host/esp_stats.c
-@@ -8,6 +8,7 @@
- 
- #include "utils.h"
- #include "esp_stats.h"
-+#include "esp_kernel_port.h"
- 
- #if TEST_RAW_TP
- 
-diff --git a/esp_hosted_ng/host/include/esp_kernel_port.h b/esp_hosted_ng/host/include/esp_kernel_port.h
-index b633ee346f..35a18da504 100644
---- a/esp_hosted_ng/host/include/esp_kernel_port.h
-+++ b/esp_hosted_ng/host/include/esp_kernel_port.h
-@@ -222,4 +222,9 @@ static inline bool wireless_dev_current_bss_exists(struct wireless_dev *wdev)
- #define spi_master_put(_ctlr)		spi_controller_put(_ctlr)
- #endif
- 
-+
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0)
-+  #define del_timer timer_delete_sync
-+#endif
-+
- #endif
-diff --git a/esp_hosted_ng/host/sdio/esp_sdio.c b/esp_hosted_ng/host/sdio/esp_sdio.c
-index 52759dee34..6d90fe92f6 100644
---- a/esp_hosted_ng/host/sdio/esp_sdio.c
-+++ b/esp_hosted_ng/host/sdio/esp_sdio.c
-@@ -20,7 +20,7 @@
- #include <linux/kthread.h>
- #include "esp_stats.h"
- #include "esp_utils.h"
--#include "include/esp_kernel_port.h"
-+#include "esp_kernel_port.h"
- 
- extern u32 raw_tp_mode;
- #define MAX_WRITE_RETRIES       2
--- 
-2.39.5
-
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 8af32e9239..65083fff70 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1025b8c8d982bab03ebec9859f828a1c81218077245b602621eb4f07c169bac8  ng-v1.0.4.0.0.tar.gz
+sha256  15e634c6181b32c39c1274917efcefc78a8123cc52e72475f71b512625a30ef1  ng-v1.0.5.0.3.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 965d3a5cc6..01a05135b1 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 1.0.4.0.0
-ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-v$(ESP_HOSTED_VERSION))
+ESP_HOSTED_VERSION = 1.0.5.0.3
+ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-$(ESP_HOSTED_VERSION))
 ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
