Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14163C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:42:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CD9361152
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CD9361152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FEF484025;
	Wed,  6 Oct 2021 20:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nEiIaCmMxD4; Wed,  6 Oct 2021 20:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BADEE84042;
	Wed,  6 Oct 2021 20:42:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8983F1BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84B8740DA9
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgePWMvYyOWw for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:41:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7164E40808
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:41:53 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id kk10so3150699pjb.1
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cVnHMsQG2+Afr8NBw93ZMhoF0gMTRSCu2xrCol7fzX8=;
 b=SjJ7ee/evtsS2Ovu1edu9BTkc3DgJEe29yXMOxF4OE4PQhLCg79OoRSVBI0cPAGl7m
 XWZcWGYYBHzSMG9v05APM8Rbkrd5L7DcRxrSC7QuvvSlmHeUUNCextdyUFZhkhAINow6
 bwwpLOyaoIaBNRRAYu5pRkMMbx/ZM0bsX4D8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cVnHMsQG2+Afr8NBw93ZMhoF0gMTRSCu2xrCol7fzX8=;
 b=MbSJPYWMNrvvQFa+BkwZL8UUBulWcidZX/1EKwN3hTWCw9gxOHDk+LbvcczuPBZS2K
 STee539nR33MTwT/pVkuqjw5IFX2xqQSOzsXSke4V5cxn87yvzeF8CBlkKSN+qBQd4iq
 4EhVnKaFQ2H4L472QJ+P5sZg/SF/4u+di8TK183kBbek7ydQWXm2lUcwKlmo6WmJUo/B
 nGoQIKtGK0PQvDsH4xDXFmAGuNSFLU54BO7X2AoS28NFmvLTlRDHCYHXGOsTKkwJLNju
 7A/JGmb0XnDQ20jChLQNqoh9DNpQn0C2EeIL79JNN38Nau2LShKCXsE2LwkNJ7mZljTE
 r44w==
X-Gm-Message-State: AOAM533Y0Nz85mE42WoS3hA+N+RFC9aY9g8nDYo4tPqIMC2XFzExK3Xc
 Kuk9JVbURUuWXtBxJbUtK3sAweE2NA1NCTrf
X-Google-Smtp-Source: ABdhPJymdUYDHrQasUNDZOK3OQaeDfXRMFH/OeIBtuBX2zas0xHmdx/CMT7vuyAXQtRWASYlwosuSw==
X-Received: by 2002:a17:90a:a389:: with SMTP id
 x9mr891832pjp.167.1633552912405; 
 Wed, 06 Oct 2021 13:41:52 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:41:52 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:24 -0700
Message-Id: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/12]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p2.0
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

To match NXP 5.10.35-2.0.0 release.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index ab021b6849..ee105ef82c 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  fbf400adbeaa52af0be234a5dcd96059615db4535cda2bd101d65d468e49e288  kernel-module-imx-gpu-viv-3588f2f6e64082153baae116dd393aa15061473d.tar.gz
+sha256  257c6cd8b01cfb6543827cbeb78409e6a2ad4ae321891751dcea1abc47d89379  kernel-module-imx-gpu-viv-ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 3afcc9d228..10505fdf17 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 3588f2f6e64082153baae116dd393aa15061473d
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
