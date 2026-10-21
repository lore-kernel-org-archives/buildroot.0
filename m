Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201A0606A327
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IwH6GAL+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF0E240C1F;
	Wed, 21 Oct 2026 20:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNBiS4E5WPth; Wed, 21 Oct 2026 20:04:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0AFBA40C70
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613081;
	b=Y/FMtxNbyQV/hvNqewy+NLUocr/LGO8yhDKo6wPu6rQ/CMMDoQMUQUMIkBOkdraj0kMb
	 hnCsWmOiRRAUi4JMyaNwP1HRtOTzS/GPhWmmnn1Abc9tT5r+4L8SvMhiALSx//yJPQxeS
	 bbxcaeIrsR/DRWl4n3RMKvUDkGmABPYrfHGUSSJzfYEX+PrOHawxBvh8DBc9MGs+afCYV
	 o4hiYy+owyq1t302HYkQG1d4hV4+9exq1c0ria3/kGqak72/iE3541sM4/rqvGAHsvFPD
	 KMUyoIKPw24Is93Jz7yMheXEVhuY1x9+wgPil1krIe6tvS1xTMpm/hs1IpmGVK8KkrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613081;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s6IIrEYjBt8UV+O2VMBKdjz87wOuxzUp3q3qPcPrA7M=;
	b=DltdqfBKekbrdyrN8p/C/LraGtoE0qBBxmewG+dcCVk4WGNwZb7drnv05nevgpEUA3xp
	 ZcML7Pb00C6HzuC0XgMO3fsRd+XjL9oFuEmKOjKOsyziyNcE/xnDIZ0k0u185Y437clFY
	 OAtT8gMapY0+0BDYjYbEuCBQRmucfd0ElKP+2X6r9L/56Xpu8JUO4BgEid089VNVVugDj
	 13wDmielqRU+aQqVU1ApS4ZHeUbFdj2LAVtGkfwRg3DALM5X9jxNcqVG0+cZacHZuVGuz
	 zuEnjvYXscS0+1lz8chPCdJOQKNRNwia2R1ArzvnXoCSbmDE30XRvZP/mxLEaLnwm/g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613081;
	bh=s6IIrEYjBt8UV+O2VMBKdjz87wOuxzUp3q3qPcPrA7M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IwH6GAL+eTrJWC+QJts0VKdbDxGIRUEsNiyB7DgD3XItbYkRA9juVyOEAyE3poj0B
	 tE3KOwHSECMlZ/c5gYAPgl/o8LVBjcZRNMUrkwfavRZQw0p4yiLQS95FzvTsL+xGXi
	 4x3P1Xh/+npDxbc5hi9jnJOKcKUvcF4C+wA3+3D8fIfyn5Km9N75scsfy0l0YFU9mi
	 Y3h/UQsgUm+HB+GB5VZvJQyVukzYw4TGoSGeOmtBnQ85ncQTqdHk9kAoZydafeaX7V
	 cdl29g1gArJTs+faek+lA4QtinAPb4WsGUiiEKMZd9R9LgYmTjRyR4ritwwP6RG3vp
	 6/CuP6oRzCTaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AFBA40C70;
	Wed, 21 Oct 2026 20:04:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71331769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6329C4016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVrxKWHUcJ28 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8526640042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613077;
 b=PobhyNQxKhlTIu2OOZTa8dRqvsAZH1JpR5bVrhudqHpUi3Cb1Qr3St+mkxlppBYvB1aM
 wMMrLduYrEQmt/Ehr/BUz6q7v/pDu0MXPPVXd2h7MUV3V/Vdr3hWRIh/qY9N+KY2aS7R7
 J8beAX6ZybzU7x2S4FnHBKQwN0O6xG1GtAnY38ZjxFiXQ+DJ8CEen+hGdeZ6RaFJSHXLm
 tnY7kkhZ2dwZC/hPQGke4tW5EXxAziTVuzQSVW/dfRxs1xNUByFhShxesutg9EwSZ8k8r
 DN8ow361tpAH48nmx9sesiWhlgIOK225eP2DFEPkw+L42nrVABqLX1kgZ7g6itQuRfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TN1x7yqD2oKTrAzmJqfQyaIzijlm+PzIyrECMmbBW58=;
 b=HIZSfnHR0KVjkJj9Q02FXU0yr8Rloa1tspxCDrlvEtqERDOdg0SgUcPbSsQg9SOr0a1e
 5x2fODg2iXWAhcNffj/wW55LVQC+ES05ecd80JcUNwnRSs0dTrsNXAZ6sng7so9S9e3pm
 fcS6EcHXgMestvJN+ZFY4+vXZTbYIkJx99s3USvaIwiUd2Iy3bnLV2M4h6UDcCEns9mfs
 /6aXy7Pd0dBNBacMtoQWvJfqhEqzsMtuRIO+u10421Q3OGqj3Z4CQ8kKpdngLnoBGQoHe
 nmi/2yVcz4pkCPRgVWBSViN9WRGH6A8G1SBJ0PPMhKUovL/qHaQrKasJshrtNlARIPw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8526640042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDC6D99B20; Wed, 21 Oct 2026 20:03:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 22:03:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8de9e606d7bb3d1fd5facf12aed36cb0b0d92612
X-Git-Newrev: 9b79b19bb0137f0c02b936db08737b5ca3861e62
X-Patchwork-Hint: ignore
Message-Id: <20261021200313.DDC6D99B20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add support for
 firmware-ele-imx
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b79b19bb0137f0c02b936db08737b5ca3861e62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Similar to the existing firmware-imx support, some platforms need the
EdgeLock Secure Enclave firmware when building U-Boot:

https://docs.u-boot-project.org/en/v2026.10/board/nxp/imx93_frdm.html

So add an option for this and extend the existing UBOOT_COPY_IMX_FW_FILES
logic to also handle it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in |  9 +++++++++
 boot/uboot/uboot.mk  | 10 +++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d4e77fd0f8..381a12197d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -351,6 +351,15 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
 	  This option makes sure that the i.MX firmwares are copied into
 	  the U-Boot source directory.
 
+config BR2_TARGET_UBOOT_NEEDS_IMX_ELE_FIRMWARE
+	bool "U-Boot needs firmware-ele-imx"
+	depends on BR2_PACKAGE_FIRMWARE_ELE_IMX
+	help
+	  Some i.MX8/i.MX9 platforms encapsulate NXP specific firmware
+	  for the EdgeLock Secure Enclave inside U-Boot.
+	  This option makes sure that the i.MX EdgeLock Secure Enclave
+	  firmware is copied into the U-Boot source directory.
+
 config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
 	bool "U-Boot needs rockchip-rkbin"
 	depends on BR2_PACKAGE_ROCKCHIP_RKBIN
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 96b8cd0d2e..99330a2f15 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -224,13 +224,21 @@ endif
 
 # Mainline U-Boot versions can create the i.MX specific boot images
 # and need some NXP firmware blobs.
+ifneq ($(BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE)$(BR2_TARGET_UBOOT_NEEDS_IMX_ELE_FIRMWARE),)
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE),y)
 UBOOT_DEPENDENCIES += firmware-imx
-UBOOT_IMX_FW_FILES = \
+UBOOT_IMX_FW_FILES += \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),signed_hdmi_imx8m.bin) \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),lpddr4*.bin) \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin) \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR3),ddr3*.bin)
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_IMX_ELE_FIRMWARE),y)
+UBOOT_DEPENDENCIES += firmware-ele-imx
+UBOOT_IMX_FW_FILES += $(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE)
+endif
 
 define UBOOT_COPY_IMX_FW_FILES
 	$(foreach fw,$(UBOOT_IMX_FW_FILES),\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
