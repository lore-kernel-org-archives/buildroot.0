Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E308BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B17405BD;
	Fri, 13 May 2022 07:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdg9fxLbx37m; Fri, 13 May 2022 07:16:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD54E405BF;
	Fri, 13 May 2022 07:16:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEDB71BF357
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBE68405BD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp34XZtizhWA for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:15:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C41E40120
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:15:31 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id l18so14442108ejc.7
 for <buildroot@buildroot.org>; Fri, 13 May 2022 00:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQClKqRaU3ogqjn/15zWqcZHOH3aqHzS7cHftOvHejA=;
 b=i+zYkgwaIW51kew1rb3WDpC0pmp2EAkMfUlh74fSiVhveTxmtw0NGq2M2hlX5S72Hf
 sjs/SRv28qamcv3yh1Y3vTdDTc/ZVMVAqEykxIdFMvEPfCnN28c0d5SB1hg7WMb0IS0p
 KgbvuaPtlRMJukoaGVOKnj63IjyeW5/rLIaHsHc+ULoDrlWCDoxWSjZbbhB9f0PWKCwl
 b5m+rNDXDtz5ZIM2hPbk7kjhozrLSxWthKcANCiCvLMqdJYTejXcVu4WrrVViSaCwxlC
 GetVS9my86ydSQ8l/RoY1tG7wDQmTeHpP+d1D/6C/jKCkL0elCJuERcKDYTsp8omzIc1
 JMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQClKqRaU3ogqjn/15zWqcZHOH3aqHzS7cHftOvHejA=;
 b=j0lfnFbfRTuvl/fFtCaT3tFTXSnLJ/ASI5HeUQOFqLwpqaoWFBl3eM5EPN4RFSp8e9
 8rOTr+qZhGXlQFCEHrOCxeVcRBfTDoumXMMHvbpKsWIu15GcMFj9JNs9Y2pJLves5EqB
 R3CbjqVTqrmmcBC3+aDAUnC6ksA+7o3RmSegA/H5U01/UXLzFirsw37CLmlgCzFSrvLQ
 940LBGHG6qzMspTMIeIylBx8X54l7q4ej4lCkVLfwsPrwT5VDVSqx0LkL1lWY16vE4yQ
 KaEIieT41cUFU/Ir/b6Nsa+ZeD4KVm7t0QE8XWLr6IMynKFI/04s+Z+9DQlL5qcCzKyh
 bNdw==
X-Gm-Message-State: AOAM530GTU2oNa8/c5fnwl67k8KYCu2iyrxYNBxTs4ccPMt2UvYX+I4Z
 MDy4uwNxtY8icnz2Wcer+7kFaZjczmJGyw==
X-Google-Smtp-Source: ABdhPJwBk8TGqF3Hb5cxeE5hn7DmdOqyPDWJiC4i+QmZX8Z97c2VzBgmmrrPmJIsGGJhIXqu6/5l9g==
X-Received: by 2002:a17:907:961e:b0:6f4:b201:6629 with SMTP id
 gb30-20020a170907961e00b006f4b2016629mr3098320ejc.152.1652426129605; 
 Fri, 13 May 2022 00:15:29 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 d27-20020a056402517b00b0042a2ccdd2b8sm577065ede.70.2022.05.13.00.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 00:15:29 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 09:15:22 +0200
Message-Id: <20220513071522.19853-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/kontron_pitx_imx8m_defconfig: use linux
 kernel 5.17.7
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_pitx_imx8m_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 161b9cfe3b..b69516b8cc 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-kontron-pitx-imx8m"
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
