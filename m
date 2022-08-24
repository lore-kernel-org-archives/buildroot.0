Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA7DC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 19:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E71C340BAC;
	Wed, 24 Aug 2022 19:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E71C340BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RutJpDmqRUVm; Wed, 24 Aug 2022 19:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1FB940B76;
	Wed, 24 Aug 2022 19:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1FB940B76
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6745A1BF307
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F5EB60FDC
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F5EB60FDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqx8iIQLPI3g for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 19:26:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7421260FDA
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7421260FDA
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 19:26:22 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso2644610pjh.5
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 12:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Q9YRGn/aKOX9hGIBNWPe84dVdKYEYpA5rorSnbxJZC4=;
 b=OW4PZyXRbL+pLEhlIeMyW9g8lzTizKqt/XcW/40I7yF4QOYmtYvhs+QCaoMc21c44L
 o1DMz2r6Do3rPlDhTlAlU3Esz9tw07uaBskZadz39rt5xg18i8Phay8AumVmkZLCyhui
 cZIcBmxsPSNYSLQbf5jYJKLEjFI8gc5tdlCHXB/6+D3ZcdOrTLpBYH/qmqvZD3SIL/c1
 z0tVZYhmqYIvm1TgRCGdqF1wPy0CzEWRiJlA2WX26yDjTZkp+S9lMU4dnOahDaIIRGmr
 Mv6/BOLBNw76jC2nPEu9unX0iA44i9m7tr5gvMeqFnIs3QLIPgPHQOynRj3jaAOosKwR
 yETA==
X-Gm-Message-State: ACgBeo1r4sAsgHKkvy5DhfwZi5VxJ1AvLdUziNAA6EmA2/z39tdS1sc7
 MR9iWfQZTgdXOgj2EDY54aAx3VAfF3Hrulrfqmw=
X-Google-Smtp-Source: AA6agR4Ocuy9VsDz1imor33OMcBbcIHQYWs4uSfpqqRGGJt8xacC4BfuRzf3ZkGD1sb08WfF3Ygr9Q==
X-Received: by 2002:a17:902:8545:b0:172:ef49:9c6e with SMTP id
 d5-20020a170902854500b00172ef499c6emr411624plo.90.1661369181720; 
 Wed, 24 Aug 2022 12:26:21 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a17090a1b0100b001fb4a8d82a7sm1741338pjq.56.2022.08.24.12.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 12:26:21 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:25:57 -0700
Message-Id: <20220824192604.2549356-7-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
References: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Q9YRGn/aKOX9hGIBNWPe84dVdKYEYpA5rorSnbxJZC4=;
 b=KkhGokTprCxgtPcaWSUrhqEQ3E8noAINCooZM9GZaHGl7esvASXV3sg7QuFSEetHQA
 VVSmppRbanLR/fPeVHY08SmiIYGSDBp0Bv2Ek2gT5pv4HqDq4KLC00muYEs7LqInajk/
 vai2TOQIxMJfQqm/mcdoXTw0CM6WYTMXdAo98=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=KkhGokTp
Subject: [Buildroot] [PATCH 7/7]
 package/freescale-imx/imx-vpu-hantro-daemon: add package
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

i.MX Hantro V4L2 Daemon. Provides the vsidaemon, which is needed for
V4L2 nodes to work.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/Config.in               |  1 +
 .../imx-vpu-hantro-daemon/Config.in           | 20 +++++++++++
 .../imx-vpu-hantro-daemon.hash                |  4 +++
 .../imx-vpu-hantro-daemon.mk                  | 36 +++++++++++++++++++
 4 files changed, 61 insertions(+)
 create mode 100644 package/freescale-imx/imx-vpu-hantro-daemon/Config.in
 create mode 100644 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
 create mode 100644 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 4a4237fb42..13d611b696 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -115,6 +115,7 @@ source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
 source "package/freescale-imx/imx-seco/Config.in"
+source "package/freescale-imx/imx-vpu-hantro-daemon/Config.in"
 source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/Config.in b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
new file mode 100644
index 0000000000..2ab9f97081
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
@@ -0,0 +1,20 @@
+comment "imx-vpu-hantro-daemon needs an i.MX-specific Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "imx-vpu-hantro needs an i.MX platform with Hantro VPU"
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
+
+config BR2_PACKAGE_IMX_VPU_HANTRO_DAEMON
+	bool "imx-vpu-hantro"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
+	select BR2_PACKAGE_IMX_VPU_HANTRO
+	select BR2_PACKAGE_IMX_VPU_HANTRO_VC if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	help
+	  i.MX Hantro V4L2 Daemon specific for the NXP i.MX SoC
+	  integrating a Hantro Video Processing Unit (VPU) such as the
+	  i.MX8MQ/i.MX8MM/i.MX8MP.
+
+	  This library is provided by NXP as-is and doesn't have an
+	  upstream.
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
new file mode 100644
index 0000000000..811f8b21a3
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  77e25ad1e1860f0a3983f07d6beb9a04ff32763bacf26db9aefd16559e6eea9b  imx-vpu-hantro-daemon-1.1.2.tar.gz
+sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
+sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
new file mode 100644
index 0000000000..e9d628bef4
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# imx-vpu-hantro-daemon
+#
+################################################################################
+
+IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.2
+IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
+IMX_VPU_HANTRO_DAEMON_SOURCE = imx-vpu-hantro-daemon-$(IMX_VPU_HANTRO_DAEMON_VERSION).tar.gz
+IMX_VPU_HANTRO_DAEMON_DEPENDENCIES = linux
+IMX_VPU_HANTRO_DAEMON_DEPENDENCIES += imx-vpu-hantro
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)
+IMX_VPU_HANTRO_DAEMON_DEPENDENCIES += imx-vpu-hantro-vc
+endif
+
+IMX_VPU_HANTRO_DAEMON_MAKE_ENV = \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	SDKTARGETSYSROOT=$(STAGING_DIR) \
+	LINUX_KERNEL_ROOT=$(LINUX_DIR) \
+	CTRLSW_HDRPATH="$(STAGING_DIR)/usr/include" \
+	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
+
+IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
+IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = EULA COPYING
+IMX_VPU_HANTRO_DAEMON_REDISTRIBUTE = NO
+
+define IMX_VPU_HANTRO_DAEMON_BUILD_CMDS
+	$(MAKE1) -C $(@D) $(IMX_VPU_HANTRO_DAEMON_MAKE_ENV)
+endef
+
+define IMX_VPU_HANTRO_DAEMON_INSTALL_TARGET_CMDS
+	$(IMX_VPU_HANTRO_DAEMON_MAKE_ENV) $(MAKE1) -C $(@D) \
+		DEST_DIR=$(TARGET_DIR) libdir=/usr/lib install
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
