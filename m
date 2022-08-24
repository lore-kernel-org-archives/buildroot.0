Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04900C32793
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 02:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A504E40B05;
	Wed, 24 Aug 2022 02:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A504E40B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FeW3Oyjxs0EU; Wed, 24 Aug 2022 02:50:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DA7E40B03;
	Wed, 24 Aug 2022 02:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA7E40B03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25BB61BF3FF
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DB0660B58
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DB0660B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAShYPcLyZsh for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 02:49:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E7ED60B3D
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E7ED60B3D
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 02:49:36 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id g129so11888604pfb.8
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=upBMFJ26aleiWfHeGrrnuu5XtipPmEDHZJ0dJlpH7QE=;
 b=tDy8JnukuoS+qp+6XJ1FCnMF+UZtBTdfeNrGzw05HFyd51bs6D8b6lb3LwcbhfU1EB
 SGHlQm3RT1DsaLZXjuhSWn6JsalLG4m2gLL/LcqPctEBqgipuLoCQZv4mBaBFpdTr9d6
 NpGOwPWHvu8v5mC9lty7vhFX09w4IKssYDf9juvRH4qzTUdxnTCA2v1e8/uOk+Hv0X8d
 zt+OvNSD4y3lDu8pMMSiUhUZZ6MukobLnKUbeFlb57alJrPSueECT323ZbJTtbSIUwCT
 pmKGHtP/UnquFq1fYYcZWtJYtDPETSP4sNPjPuJIFHIISNqZbeWks8b52ifhCEdSIgOV
 o0WA==
X-Gm-Message-State: ACgBeo3iWMoZRz+nI8FfvPWhAQOjwpbxFFKThzVXziR/HFFcJkwdYWpn
 jIKXZmG8+Urni4F9NYR4u+SpYHZtPksu35mXHGo=
X-Google-Smtp-Source: AA6agR4sPKtVtZTCBkIK+U77aY1joHuQlDrwzGV1OGQnCj15CEsYQgHvsqVxRf7VbXAFB8Mwq2iPRw==
X-Received: by 2002:a63:1063:0:b0:42b:1b01:b394 with SMTP id
 35-20020a631063000000b0042b1b01b394mr826081pgq.602.1661309375881; 
 Tue, 23 Aug 2022 19:49:35 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 p13-20020a635b0d000000b004296719538esm9845273pgb.40.2022.08.23.19.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 19:49:35 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 19:48:57 -0700
Message-Id: <20220824024904.2529728-7-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=upBMFJ26aleiWfHeGrrnuu5XtipPmEDHZJ0dJlpH7QE=;
 b=Wd23frpWcSVdCwuFT2YrhTGXMgRPG6fHeRAhA1sqP0jJgfB/U6lU+ooX6t8RNnZm3U
 K8f5w/N4FSiK5orZnKrvEOYMsn2scY238+30Nevxyi2qJUmVkOkKEWsujjaatv+ZJuz7
 OonYTXUIVwp1ySeKIBlOR9fs3p0pvj5kpgYXo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=Wd23frpW
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
 .../imx-vpu-hantro-daemon/Config.in           | 20 ++++++++++
 .../imx-vpu-hantro-daemon.hash                |  4 ++
 .../imx-vpu-hantro-daemon.mk                  | 37 +++++++++++++++++++
 4 files changed, 62 insertions(+)
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
index 0000000000..8e039a9d94
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -0,0 +1,37 @@
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
+IMX_VPU_HANTRO_DAEMON_INSTALL_STAGING = YES
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
