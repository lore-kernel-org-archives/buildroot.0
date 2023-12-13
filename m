Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F80DC4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4A5860F11;
	Wed, 13 Dec 2023 16:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4A5860F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OGSV3xprYys; Wed, 13 Dec 2023 16:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3374660ED1;
	Wed, 13 Dec 2023 16:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3374660ED1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 013E31BF285
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB763408C5
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB763408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRvT7EEigrci for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:18 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A4E3408BD
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A4E3408BD
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a1915034144so939302266b.0
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485796; x=1703090596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8z+ceXyPF1/MAwYsjmyC6gaYiGjfc2Cmajdh2SFPjek=;
 b=Sm09sOyk1lQQD8sm3+edu242YRrc5esVOzVsX3Sjq+O9DPLh2s9EbMuDEcfH69VF+N
 vfhnwMnY+HrTTs8gEXlUstdpZJcGvz5NH4LiT/7VW4W4KvwMLFZ/wPtcCDslPxlrgfU2
 JxNCFSoggA3KcBq9i9WDbKRdj9uwWnQDNGGVLV/T9SKcG+bnISGJOXZkb8e0vXoIzHvY
 g228BTG4i24vNnlbHV6YGdudbLUHsUIXafcdCd5x46XJfyWFiKBG0VL6XiEmu5+vLKel
 KmLBgiUgjMt7U0c7m2/by4GX7B/Ya4GLO5gH153mdPDrv7siy6obMYlfNjIu87k/xtTD
 wOYA==
X-Gm-Message-State: AOJu0Yy5mRbCBLLEBtp8CWeu7dCzCZiYMQAcVJkEp+6U2lwIFn8HLxM8
 85uKKm8XknYwiCsHvwK3tw6RKffp5BwHam6bG695hQ==
X-Google-Smtp-Source: AGHT+IGGdeLS+B4zgHvS5KaAHmfxnFKikEN9OlONuGtGHssyY76+geue77bf0GrCdckqeoSDta86sQ==
X-Received: by 2002:a17:907:9408:b0:a1d:4f7c:4428 with SMTP id
 dk8-20020a170907940800b00a1d4f7c4428mr5945690ejc.63.1702485795987; 
 Wed, 13 Dec 2023 08:43:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:01 +0100
Message-ID: <20231213164311.4180059-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485796; x=1703090596;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8z+ceXyPF1/MAwYsjmyC6gaYiGjfc2Cmajdh2SFPjek=;
 b=cyYHg4hMyfh7U6YKFpJ+La/QJJpSnr8mo6lVkAA96kgx+vDEGYQx021KZ9WynpTSHV
 O/ODFLhMsfNgMo36XIWjuHMBqe5jWGJya7h/hRt3teve2X9c5edGKCwnxa+W28KzO8+e
 QiavvFjZa9G7ve1MBDw4wZSxIYIp2YATmUnfw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cyYHg4hM
Subject: [Buildroot] [PATCH v2 01/11] boot/ti-k3-core-secdev: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a security development package containing tools for
High-Security(HS) TI K3 platform devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 boot/Config.in                                |  1 +
 boot/ti-k3-core-secdev/Config.in              |  9 +++++++++
 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash |  3 +++
 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk   | 19 +++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 boot/ti-k3-core-secdev/Config.in
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ccc4d1bb321a..267153ede584 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -754,6 +754,7 @@ F:	package/xinetd/
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
 F:	board/stmicroelectronics/stm32f769-disco/
+F:	boot/ti-k3-core-secdev/
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index e5fdf7ad439e..18a7d268f95a 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,6 +20,7 @@ source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
+source "boot/ti-k3-core-secdev/Config.in"
 source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
diff --git a/boot/ti-k3-core-secdev/Config.in b/boot/ti-k3-core-secdev/Config.in
new file mode 100644
index 000000000000..1749b7ab5fd9
--- /dev/null
+++ b/boot/ti-k3-core-secdev/Config.in
@@ -0,0 +1,9 @@
+config BR2_TARGET_TI_K3_CORE_SECDEV
+	bool "ti-k3-core-secdev"
+	depends on BR2_aarch64
+	help
+	  This package downloads and installs development tools for
+	  High-Security(HS) TI K3 platforms (which include AM62x,
+	  AM64x, AM65x and more).
+
+	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3/
diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash b/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
new file mode 100644
index 000000000000..0460cff6c59f
--- /dev/null
+++ b/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b6d3bca0d561d055c6869c5564b06f2fb1b9f67e4ef180c2baf8a14a6a6afa06  core-secdev-k3-08.06.00.007.tar.xz
+sha256  3e5cf4f5ab9f0333f46cd68fabede3f21e55de1a9e3c6ad673f241f4514d8369  k3-secdev-0.2-manifest.html
diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk b/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
new file mode 100644
index 000000000000..0127e6503d4d
--- /dev/null
+++ b/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# ti-k3-core-secdev
+#
+################################################################################
+
+TI_K3_CORE_SECDEV_VERSION = 08.06.00.007
+TI_K3_CORE_SECDEV_SITE = https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapshot
+TI_K3_CORE_SECDEV_SOURCE = core-secdev-k3-$(TI_K3_CORE_SECDEV_VERSION).tar.xz
+TI_K3_CORE_SECDEV_INSTALL_IMAGES = YES
+TI_K3_CORE_SECDEV_LICENSE = TI Text File, Apache-2.0
+TI_K3_CORE_SECDEV_LICENSE_FILES = k3-secdev-0.2-manifest.html
+
+define TI_K3_CORE_SECDEV_INSTALL_IMAGES_CMDS
+	cp -dpfr $(@D)/keys $(BINARIES_DIR)/
+	cp -dpfr $(@D)/scripts $(BINARIES_DIR)/
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
