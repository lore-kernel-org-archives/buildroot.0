Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68F2C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EEC440276;
	Wed, 23 Nov 2022 21:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EEC440276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcVrFVw8YUcK; Wed, 23 Nov 2022 21:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1517440306;
	Wed, 23 Nov 2022 21:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1517440306
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0931A1BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3948820C0
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3948820C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R212iHPas2rh for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:57:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6DAA820C6
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6DAA820C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C60488444D; Wed, 23 Nov 2022 21:57:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 22:56:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4ef729d1cf86a9793c34a794f89905ca502e86d3
X-Git-Newrev: b5dc9855d606ecfe85043a51aec777055d881edb
X-Patchwork-Hint: ignore
Message-Id: <20221123215751.C60488444D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-vpu-hantro-daemon: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b5dc9855d606ecfe85043a51aec777055d881edb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- i.MX Hantro V4L2 Daemon. Provides the vsidaemon, which is needed for
V4L2 nodes to work.
- To match NXP 5.15.52-2.1.0 release.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 package/freescale-imx/Config.in                    |  1 +
 .../freescale-imx/imx-vpu-hantro-daemon/Config.in  | 17 +++++++++++
 .../imx-vpu-hantro-daemon.hash                     |  3 ++
 .../imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk | 35 ++++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3f1ed0ef12..a2c60f38fd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -520,6 +520,9 @@ F:	package/alsa-plugins/
 N:	Changming Huang <jerry.huang@nxp.com>
 F:	package/qoriq-cadence-dp-firmware/
 
+N:	Chris Dimich <chris.dimich@boundarydevices.com>
+F:	package/freescale-imx/imx-vpu-hantro-daemon/
+
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
 F:	package/coremark-pro/
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
index 0000000000..663ed4346b
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
@@ -0,0 +1,17 @@
+comment "imx-vpu-hantro-daemon needs an i.MX-specific Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "imx-vpu-hantro-daemon needs an i.MX platform with Hantro VPU"
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
+
+config BR2_PACKAGE_IMX_VPU_HANTRO_DAEMON
+	bool "imx-vpu-hantro-daemon"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
+	select BR2_PACKAGE_IMX_VPU_HANTRO
+	select BR2_PACKAGE_IMX_VPU_HANTRO_VC if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	help
+	  i.MX Hantro V4L2 Daemon specific for the NXP i.MX SoC
+	  integrating a Hantro Video Processing Unit (VPU) such as the
+	  i.MX8MQ/i.MX8MM/i.MX8MP.
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
new file mode 100644
index 0000000000..e952491a60
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  83ba2798564702d74ab65f6238f95f59247d983b846de1de4c19bdfaf6dabeb8  imx-vpu-hantro-daemon-1.1.4.tar.gz
+sha256  bb645f02b260955f333348100e40af76253e2cd8b116bac047230439dd53ec5a  LICENSE.txt
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
new file mode 100644
index 0000000000..bf9088b065
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# imx-vpu-hantro-daemon
+#
+################################################################################
+
+IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.4
+IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
+IMX_VPU_HANTRO_DAEMON_SOURCE = imx-vpu-hantro-daemon-$(IMX_VPU_HANTRO_DAEMON_VERSION).tar.gz
+IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
+IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = LICENSE.txt
+IMX_VPU_HANTRO_DAEMON_REDISTRIBUTE = NO
+IMX_VPU_HANTRO_DAEMON_DEPENDENCIES = imx-vpu-hantro linux
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)
+IMX_VPU_HANTRO_DAEMON_DEPENDENCIES += imx-vpu-hantro-vc
+endif
+
+IMX_VPU_HANTRO_DAEMON_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	SDKTARGETSYSROOT=$(STAGING_DIR) \
+	LINUX_KERNEL_ROOT=$(LINUX_DIR) \
+	CTRLSW_HDRPATH="$(STAGING_DIR)/usr/include" \
+	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
+
+define IMX_VPU_HANTRO_DAEMON_BUILD_CMDS
+	$(MAKE) -C $(@D) $(IMX_VPU_HANTRO_DAEMON_MAKE_ENV)
+endef
+
+define IMX_VPU_HANTRO_DAEMON_INSTALL_TARGET_CMDS
+	$(IMX_VPU_HANTRO_DAEMON_MAKE_ENV) $(MAKE) -C $(@D) \
+		DEST_DIR=$(TARGET_DIR) libdir=/usr/lib install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
