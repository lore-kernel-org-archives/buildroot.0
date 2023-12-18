Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BA8C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40FFD4044D;
	Mon, 18 Dec 2023 08:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40FFD4044D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QItWP8bXASJG; Mon, 18 Dec 2023 08:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3343F40930;
	Mon, 18 Dec 2023 08:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3343F40930
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4FE51BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD2FF417BE
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD2FF417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUMgf6dm6dFf for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:16 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CE1D417F8
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CE1D417F8
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a2339939573so123893366b.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887614; x=1703492414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jlyosgxVLBq1G2iNwCkoAb+eTEGi8yOcOj/kQCmcM2g=;
 b=nWP87g2lHt3fMjKzMrDrDsAeks0QLjMna74dHIs1Inds/FnzaTJGenrDiISssMeA1E
 ssVZ4MuopvgEHa9tEeiwGH4kzzvQ1XeYy0EFH5rakCFhJdi6WdCBn7WKokntmAG7QLid
 7LwQJYPv0ZonVHxGe+L2qKAmn0jjT27FX0tM4IERegsnro3Zfs3HH030xmEwWAAHyiv6
 rAuUXbFjqzAOKuid4xwCeaaioRt7EvD6v4PwStNdAf8IOHXvJyX8rNk8RP2rxlGE5X3k
 3kItkxc+xH9T+Cno+pKAJyjd0O7gud+IqHniFK+BjfPaPCt4LLrmzuZDOQZ2fP16SB+6
 cNKg==
X-Gm-Message-State: AOJu0YzbdlPeDJky23NeZCnhWFQF2PrvOMJm4QbZWly+2L5mwH6hBd10
 3t+dGU0pseECe0lsctvQM08aXG87/WY9i2atSL3CBA==
X-Google-Smtp-Source: AGHT+IFZCs75Z5JsqD3xhDSOoJGhJCajjX2EtsqWfdNhg6B7VhdnbKhw+R4dgvPxs2gHzaG55Exd5Q==
X-Received: by 2002:a17:906:8e:b0:a23:62e7:d4cf with SMTP id
 14-20020a170906008e00b00a2362e7d4cfmr194600ejc.34.1702887614245; 
 Mon, 18 Dec 2023 00:20:14 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:13 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:48 +0100
Message-ID: <20231218081958.506691-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887614; x=1703492414;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlyosgxVLBq1G2iNwCkoAb+eTEGi8yOcOj/kQCmcM2g=;
 b=iSi3dhu/vwVAVTOvbNQ+vTwb6BFBLlEdxYSlL8Nxkg+0o0IkItdVp1a/JNd/T7JxH2
 9Dj4NVVMKWuyCgG1hznhWn6i9Fi2teDDiGRaz3iUl3p2q/TLewSVfj3GAMiTCTQ51ZwB
 yPzt7EcRTqYEufqZyvj0ei1rsS+GVIMfo6bOQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iSi3dhu/
Subject: [Buildroot] [PATCH v3 01/11] boot/ti-k3-core-secdev: new package
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
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
index 311dcd950481..60a95434c70f 100644
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
