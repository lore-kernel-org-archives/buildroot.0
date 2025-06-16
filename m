Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE73C71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5AFF80F30;
	Mon, 16 Jun 2025 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-0Khe2a_0_t; Mon, 16 Jun 2025 19:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C583E80F3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C583E80F3D;
	Mon, 16 Jun 2025 19:56:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EDDD4D79
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF5EA403DA
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CihqyCFQOaKd for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFFE14023F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFFE14023F
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFFE14023F
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:56:06 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id RFw4uk0iP0WuxRFw4umWOf; Mon, 16 Jun 2025 21:56:04 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 16 Jun 2025 21:56:03 +0200
Message-Id: <20250616195603.2282692-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIa9bveMc12niTtK2MkSGCFRR6UUZRXJITeBBot403jZd1/NsbYr480hj5gjvCuo/UQWhum0qhxKwcWeNQ/ljG05lKGtX0S/wwcfdBDHtPvO5FSvV0Jq
 8vrftkdXCB2M+Caap6F8Ovj0HlwR9AaICB94tY0VENUL5q5IjSsvQ9yIfolaHWdQAelydXY5Tq19Gx9ScH7E4DK3GAxk7gYXk/yYEVjWtgWfJtOlyhwLWhot
 5p4kuG5bftVNpvmYPwvHkf5w6zAx6lcKvuQFatnZm+U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1750103764; bh=/8W3rFZLiL/VdPKbzFs95e44F0PctGlBbbG4JrTM8T4=;
 h=From:To:Subject:Date:MIME-Version;
 b=EeGCMuduyiKCep/mDRZPcNDnenXLrM5wKqU9VURiAISuIFTyUjqhMF11+wugOWCZh
 pl7kGW4B1YLl1gJctL3ELlOj1YHjxENJnqJw0H4YPXRWQ01WoEgZfTa15W1XxBJ6mK
 xMsbSvdcH9rmjVRwV/Ki7X6d6jWoLajRemY4p3DdT3khvo7S90yv93E2y32jvnUrUW
 o6Fq/lnTSj01jsiCfNv0ebIudwvFpxWAp9OF01KqX/aBEh2dBmEfMp7oIKFGX3ybxi
 sSs6tNfYqgEj0+u+xXo4SpjsosCZQX+12Hap+xQmGbWu+EM3vKusGL/Vpn2DXPkMkL
 /8ArpQnB7T4pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=EeGCMudu
Subject: [Buildroot] [PATCH] package/esp-hosted: fix build with Linux 6.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch committed upstream to fix building Linux 6.15.

Fixes:
https://autobuild.buildroot.org/results/8cb7f1654b2bc5aa5dbcc5fc1474a4eebcdae8b2/
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-ng-build-for-6.15.patch          | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 package/esp-hosted/0001-Fix-ng-build-for-6.15.patch

diff --git a/package/esp-hosted/0001-Fix-ng-build-for-6.15.patch b/package/esp-hosted/0001-Fix-ng-build-for-6.15.patch
new file mode 100644
index 0000000000..36baed50c7
--- /dev/null
+++ b/package/esp-hosted/0001-Fix-ng-build-for-6.15.patch
@@ -0,0 +1,167 @@
+From cab85fc98dfcddad6ebf0faa2f5f4f4d6c6562a0 Mon Sep 17 00:00:00 2001
+From: Yogesh Mantri <yogesh.mantri@espressif.com>
+Date: Sun, 8 Jun 2025 12:11:09 +0800
+Subject: [PATCH] Fix(ng): build for 6.15 Fixes #607
+
+Upstream: https://github.com/espressif/esp-hosted/commit/cab85fc98dfcddad6ebf0faa2f5f4f4d6c6562a0
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/Makefile                  | 63 +++++++++-----------
+ esp_hosted_ng/host/esp_debugfs.c             |  2 +-
+ esp_hosted_ng/host/esp_stats.c               |  1 +
+ esp_hosted_ng/host/include/esp_kernel_port.h |  5 ++
+ esp_hosted_ng/host/sdio/esp_sdio.c           |  2 +-
+ 5 files changed, 36 insertions(+), 37 deletions(-)
+
+diff --git a/esp_hosted_ng/host/Makefile b/esp_hosted_ng/host/Makefile
+index 029f930f55..6fa68c876f 100644
+--- a/esp_hosted_ng/host/Makefile
++++ b/esp_hosted_ng/host/Makefile
+@@ -1,67 +1,60 @@
+-# Toolchain Path
++# Toolchain and kernel
+ CROSS_COMPILE :=
+-# Linux Kernel header
+ KERNEL := /lib/modules/$(shell uname -r)/build
+-# Architecture
+ ARCH := $(shell uname -m)
+ 
+-# Check and adjust ARCH for specific cases
++# Normalize ARCH
+ ifeq ($(ARCH), x86_64)
+     ARCH := x86
+ endif
+-
+ ifeq ($(ARCH), aarch64)
+     ARCH := arm64
+ endif
+ 
+-#Default interface is sdio
+-MODULE_NAME=esp32_sdio
+-
+-#enable logging by default
+-CONFIG_DEBUG_LOGS := y
++# Module name (default: sdio)
++target ?= sdio
++MODULE_NAME := esp32_$(target)
+ 
++# Debug and AP support
++CONFIG_DEBUG_LOGS ?= y
+ ifeq ($(CONFIG_AP_SUPPORT), y)
+-	EXTRA_CFLAGS += -DCONFIG_AP_MODE
++    EXTRA_CFLAGS += -DCONFIG_AP_MODE
+ endif
+ 
+-#Targets passed overrrides default value
++# Source and include paths
++PWD := $(shell pwd)
++ccflags-y += -I$(src) -I$(src)/include -I$(CURDIR) -I$(CURDIR)/include
++EXTRA_CFLAGS += -I$(M) -I$(M)/include
++
++# Interface-specific sources
+ ifeq ($(target), sdio)
+-	MODULE_NAME=esp32_sdio
++    ccflags-y += -I$(src)/sdio -I$(CURDIR)/sdio
++    EXTRA_CFLAGS += -I$(M)/sdio
++    module_objects += sdio/esp_sdio.o sdio/esp_sdio_api.o
+ endif
+ 
+ ifeq ($(target), spi)
+-	MODULE_NAME=esp32_spi
+-endif
+-
+-#debug_flags := -DDEBUG
+-
+-EXTRA_CFLAGS += -I$(PWD)/include -I$(PWD)
+-
+-ifeq ($(MODULE_NAME), esp32_sdio)
+-	EXTRA_CFLAGS += -I$(PWD)/sdio
+-	module_objects += sdio/esp_sdio.o sdio/esp_sdio_api.o
+-endif
+-
+-ifeq ($(MODULE_NAME), esp32_spi)
+-	EXTRA_CFLAGS += -I$(PWD)/spi
+-	module_objects += spi/esp_spi.o
++    ccflags-y += -I$(src)/spi -I$(CURDIR)/spi
++    EXTRA_CFLAGS += -I$(M)/spi
++    module_objects += spi/esp_spi.o
+ endif
+ 
++# Common source files
+ module_objects += esp_bt.o main.o esp_cmd.o esp_utils.o esp_cfg80211.o esp_stats.o esp_debugfs.o esp_log.o
+-#$(foreach obj,$(module_objects),$(eval CFLAGS_$(obj:.o=).o := $(debug_flags)))
+ CFLAGS_esp_log.o = -DDEBUG
+ 
+-PWD := $(shell pwd)
+-
++# Module build rules
+ obj-m := $(MODULE_NAME).o
+ $(MODULE_NAME)-y := $(module_objects)
+ 
++# Build targets
+ all: clean
+-	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) modules
++	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) modules
+ 
+ clean:
+-	rm -rf *.o sdio/*.o spi/*.o *.ko
+-	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) clean
++	rm -rf *.o */*.o *.ko *.mod.c *.symvers *.order .*.cmd .tmp_versions
++	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) clean
+ 
+ check:
+-	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) $(module_objects)
++	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) $(module_objects)
++
+diff --git a/esp_hosted_ng/host/esp_debugfs.c b/esp_hosted_ng/host/esp_debugfs.c
+index 74b1813fb4..4399cab825 100644
+--- a/esp_hosted_ng/host/esp_debugfs.c
++++ b/esp_hosted_ng/host/esp_debugfs.c
+@@ -1,4 +1,4 @@
+-#include "include/utils.h"
++#include "utils.h"
+ #include <linux/debugfs.h>
+ #include <linux/module.h>
+ #include <linux/fs.h>
+diff --git a/esp_hosted_ng/host/esp_stats.c b/esp_hosted_ng/host/esp_stats.c
+index 82eff7b0a6..61c37733cb 100644
+--- a/esp_hosted_ng/host/esp_stats.c
++++ b/esp_hosted_ng/host/esp_stats.c
+@@ -8,6 +8,7 @@
+ 
+ #include "utils.h"
+ #include "esp_stats.h"
++#include "esp_kernel_port.h"
+ 
+ #if TEST_RAW_TP
+ 
+diff --git a/esp_hosted_ng/host/include/esp_kernel_port.h b/esp_hosted_ng/host/include/esp_kernel_port.h
+index b633ee346f..35a18da504 100644
+--- a/esp_hosted_ng/host/include/esp_kernel_port.h
++++ b/esp_hosted_ng/host/include/esp_kernel_port.h
+@@ -222,4 +222,9 @@ static inline bool wireless_dev_current_bss_exists(struct wireless_dev *wdev)
+ #define spi_master_put(_ctlr)		spi_controller_put(_ctlr)
+ #endif
+ 
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0)
++  #define del_timer timer_delete_sync
++#endif
++
+ #endif
+diff --git a/esp_hosted_ng/host/sdio/esp_sdio.c b/esp_hosted_ng/host/sdio/esp_sdio.c
+index 52759dee34..6d90fe92f6 100644
+--- a/esp_hosted_ng/host/sdio/esp_sdio.c
++++ b/esp_hosted_ng/host/sdio/esp_sdio.c
+@@ -20,7 +20,7 @@
+ #include <linux/kthread.h>
+ #include "esp_stats.h"
+ #include "esp_utils.h"
+-#include "include/esp_kernel_port.h"
++#include "esp_kernel_port.h"
+ 
+ extern u32 raw_tp_mode;
+ #define MAX_WRITE_RETRIES       2
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
