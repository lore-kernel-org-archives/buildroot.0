Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84D3C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BEBB61152
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BEBB61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62C9B8415A;
	Wed,  6 Oct 2021 20:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MAWH8j2yoOiD; Wed,  6 Oct 2021 20:43:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EC6A84159;
	Wed,  6 Oct 2021 20:43:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D260F1BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFB9C84042
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_1c0UcXtkdU for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:42:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3119284025
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:42:00 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id b22so2496935pls.1
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQZJAFr9lfKLmTXGk8YVoz3XbaJAdXbrKMh1NnPt27Q=;
 b=fe13c9LQUJkmdnMsgYalED6c/7crdrK2JbBvx1ubUGVHwPME1FmuWjxflW79tY2UIv
 RfPN8+fu1z8D5rawpKHRsewRYy55/P3SpH1KVOHxXW96ZUhNgBK4GEaXP0U4ZjsI5KDj
 T8qsvdk/qpqsU/X6gqKRahlsvOaSmB9XW3V8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQZJAFr9lfKLmTXGk8YVoz3XbaJAdXbrKMh1NnPt27Q=;
 b=VWLFyiogbcRG36dt7N9PvuZwKd+q02zbVyJ4TjFbWVTiPlDph30WwB0HGt3ZqgtCFd
 vnId1sOKv81WKf+bfhnOM+Aw057h/bjPz01Po0eoWG1ELqKjqV3xfaw88BlUmcVI2ghn
 TNeM7bmFCdtlZmXk+notJ7k+ZKwOVbdll7YGbm+PsPhDsyl3/kujuyo6utBXpJLav/J5
 DqqfoUQO+VNftdqsLhfxmIaFQysfqsHyAMJ6KJzoj7buvhz0uIBaEO0s/jLRz4UzyFms
 /SovGrRQW1dDiB7wuUVkm4HgIs1YqUGhY3VL3E34Ph5PJ72Tb1t6rWCWURyzHghwVgRn
 +wsg==
X-Gm-Message-State: AOAM533OZwcB2vcgwRHvM1j6YctBS3ZfwaTjje6gCpidzxDKPfKOWi67
 O5etRqTLIqbId13zroVH2h6EH3TykVARF2CW
X-Google-Smtp-Source: ABdhPJznq8PVBwowy696HIDftVB5VILTGSSj/M/beErN3sf6heT0/ggW4trgNiYiyoGy/IqugALhyA==
X-Received: by 2002:a17:902:904b:b0:13d:c33b:294f with SMTP id
 w11-20020a170902904b00b0013dc33b294fmr48866plz.35.1633552919293; 
 Wed, 06 Oct 2021 13:41:59 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:41:58 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:29 -0700
Message-Id: <20211006204135.2813745-6-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 06/12] package/freescale-imx/imx-vpu-hantro-vc:
 add package
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

i.MX VC8000E Encoder library. Intended for the i.MX 8M Plus processor.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/Config.in               |  1 +
 .../freescale-imx/imx-vpu-hantro-vc/Config.in | 13 ++++++++++
 .../imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash  |  4 +++
 .../imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk    | 25 +++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/freescale-imx/imx-vpu-hantro-vc/Config.in
 create mode 100644 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
 create mode 100644 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index bedd05a471..4a4237fb42 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -115,6 +115,7 @@ source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
 source "package/freescale-imx/imx-seco/Config.in"
+source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 source "package/freescale-imx/libz160/Config.in"
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/Config.in b/package/freescale-imx/imx-vpu-hantro-vc/Config.in
new file mode 100644
index 0000000000..9ae139550a
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-vc/Config.in
@@ -0,0 +1,13 @@
+comment "imx-vpu-hantro-vc needs an i.MX-specific Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "imx-vpu-hantro-vc needs an i.MX platform with Hantro VPU"
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
+
+config BR2_PACKAGE_IMX_VPU_HANTRO_VC
+	bool "imx-vpu-hantro-vc"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
+	help
+	  i.MX VC8000E Encoder library. Intended for the i.MX 8M Plus processor.
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
new file mode 100644
index 0000000000..aadf5b121f
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  d5efae484c4271c098286d007590d6bf40c272d4f35702ff65625f2362715ab3  imx-vpu-hantro-vc-1.4.0.bin
+sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
+sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
new file mode 100644
index 0000000000..b07e116674
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# imx-vpu-hantro-vc
+#
+################################################################################
+
+IMX_VPU_HANTRO_VC_VERSION = 1.4.0
+IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
+IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
+IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
+
+IMX_VPU_HANTRO_VC_LICENSE = NXP Semiconductor Software License Agreement
+IMX_VPU_HANTRO_VC_LICENSE_FILES = EULA COPYING
+IMX_VPU_HANTRO_VC_REDISTRIBUTE = NO
+
+define IMX_VPU_HANTRO_VC_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_HANTRO_VC_DL_DIR)/$(IMX_VPU_HANTRO_VC_SOURCE))
+endef
+
+define IMX_VPU_HANTRO_VC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so
+	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so.1 $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so.1
+endef
+
+$(eval $(generic-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
