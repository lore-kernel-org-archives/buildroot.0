Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B224FC4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F147060A4C;
	Mon, 12 Feb 2024 21:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id np-xuemSMV2a; Mon, 12 Feb 2024 21:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF9A60A5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF9A60A5E;
	Mon, 12 Feb 2024 21:45:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E11BF1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 992D781E08
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKRbEdf5UGIo for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16EB481F5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16EB481F5C
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:45:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 024AF8353C; Mon, 12 Feb 2024 21:45:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 22:01:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1cdd48e13b2842669f0ab30e817d8064663beec
X-Git-Newrev: 69d127fe29dc8ca0321588ed19f14f644ff7e910
X-Patchwork-Hint: ignore
Message-Id: <20240212214541.024AF8353C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-ele-imx:
 new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0013702327976080497=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0013702327976080497==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=69d127fe29dc8ca0321588ed19f14f644ff7e910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides firmware blobs for the Edgelock Secure
Enclave (ELE) [1] present on i.MX8ULP and i.MX9 Socs.
This version comes from the 6.1.55-2.2.0 release.

Since i.MX8ULP is not added to Buildroot yet, only support i.MX9.

[1] https://www.nxp.com/products/nxp-product-information/nxp-product-programs/edgelock-secure-enclave:EDGELOCK-SECURE-ENCLAVE

Reviewed-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Arnout:
 - Introduce BR2_PACKAGE_FREESCALE_IMX_HAS_ELE instead of specific
   dependencies.
 - Drop BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A1, use
   BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 instead.
 - Don't use SCR.txt as license file (it's just an index file); instead,
   use EULA.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/freescale-imx/Config.in                    |  6 +++++
 package/freescale-imx/firmware-ele-imx/Config.in   | 23 ++++++++++++++++++
 .../firmware-ele-imx/firmware-ele-imx.hash         |  4 ++++
 .../firmware-ele-imx/firmware-ele-imx.mk           | 27 ++++++++++++++++++++++
 4 files changed, 60 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 3221f06e43..3211592468 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -133,6 +133,11 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 
+config BR2_PACKAGE_FREESCALE_IMX_HAS_ELE
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
+
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
@@ -143,6 +148,7 @@ source "package/freescale-imx/imx-uuc/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
+source "package/freescale-imx/firmware-ele-imx/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
 source "package/freescale-imx/imx-seco/Config.in"
diff --git a/package/freescale-imx/firmware-ele-imx/Config.in b/package/freescale-imx/firmware-ele-imx/Config.in
new file mode 100644
index 0000000000..241ad3942d
--- /dev/null
+++ b/package/freescale-imx/firmware-ele-imx/Config.in
@@ -0,0 +1,23 @@
+comment "firmware-ele-imx needs an i.MX platform with EdgeLock Secure Enclave"
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+
+config BR2_PACKAGE_FIRMWARE_ELE_IMX
+	bool "firmware-ele-imx"
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_ELE
+	help
+	  Firmware blobs for the EdgeLock Secure Enclave (ELE)
+	  present on i.MX8ULP and i.MX9 SoCs.
+
+	  This library is provided by NXP as-is and doesn't have an
+	  upstream.
+
+if BR2_PACKAGE_FIRMWARE_ELE_IMX
+
+config BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE
+	string
+	default "mx93a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A0
+	default "mx93a1-ahab-container.img" if \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
+
+endif # BR2_PACKAGE_FIRMWARE_ELE_IMX
diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
new file mode 100644
index 0000000000..0923e546b0
--- /dev/null
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  4a0440168d8dfb95989a17be8fafb149589e110e7d4518e5e8a33463dfb5e5ca  firmware-ele-imx-0.1.0.bin
+sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
+sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
new file mode 100644
index 0000000000..d493fe4a96
--- /dev/null
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# firmware-ele-imx
+#
+################################################################################
+
+FIRMWARE_ELE_IMX_VERSION = 0.1.0
+FIRMWARE_ELE_IMX_SITE = $(FREESCALE_IMX_SITE)
+FIRMWARE_ELE_IMX_SOURCE = firmware-ele-imx-$(FIRMWARE_ELE_IMX_VERSION).bin
+
+FIRMWARE_ELE_IMX_LICENSE = NXP Semiconductor Software License Agreement
+FIRMWARE_ELE_IMX_LICENSE_FILES = COPYING EULA
+FIRMWARE_ELE_IMX_REDISTRIBUTE = NO
+
+FIRMWARE_ELE_IMX_INSTALL_IMAGES = YES
+
+define FIRMWARE_ELE_IMX_EXTRACT_CMDS
+	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_ELE_IMX_DL_DIR)/$(FIRMWARE_ELE_IMX_SOURCE))
+endef
+
+FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE))
+
+define FIRMWARE_ELE_IMX_INSTALL_IMAGES_CMDS
+	cp $(@D)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/ahab-container.img
+endef
+
+$(eval $(generic-package))

--===============0013702327976080497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0013702327976080497==--
