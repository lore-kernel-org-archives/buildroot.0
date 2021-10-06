Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3C5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:42:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDC6A61131
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDC6A61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C776B60F41;
	Wed,  6 Oct 2021 20:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKYKyxb6P7Fc; Wed,  6 Oct 2021 20:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3641E60F3F;
	Wed,  6 Oct 2021 20:42:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC2BD1BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC15160F3F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQe9aAz-jtxA for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:41:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5619060F3E
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:41:57 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 66so3525447pgc.9
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6aen/BUO19+MUEZuk5ISDyw3k48sA+gWwO5Ztj43P9o=;
 b=US0BFuW8ZkGs/rqK4JoNDl8EUJBWbTMlyY0KbkYdKrlO3dOC0nPBpNIFu1mtfFufvm
 Sht9MdFnU0agA3eB3a6xIfn5zm3dxySw7lIUzDlcRh2Hs3uxvoj9qcWerv7I7AgMTOGA
 U6mP8P3+0oH0MSWqCNpXteYdMSGUExg750g9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6aen/BUO19+MUEZuk5ISDyw3k48sA+gWwO5Ztj43P9o=;
 b=VJGkIS6GN1eeKIIwjsTUVlUG/yqtsSDuJyUDzYX0s1fASGe9/AMHxxPgkVI5KclnkU
 w8nv5IYq2sEFh9SvWvj1O3YZWaWyVLpcZ+h5xCSFPJfJ5hmCLHiTclFr0IKBo+ESOrXi
 6ZwpEvPRbBtFS+uwvgCMaLs+8UHgMC4n5OXEdB0OqeRU5oXY9sDLElFDQ+Zv0otjlOBB
 +e8+iKXOVnyAjZsI42ZMEJVZLZ6XK2a+6+Qmza5CnwsSGx/lwfO1QyOo3pccK+wfNjf2
 mmp8/PiMzisckX8FMx6wnvUFgC6crFpsGdAU2NQJNhz0UyOgvqaqpISWS4vWmAV3LK7N
 fNpw==
X-Gm-Message-State: AOAM530VjTtTDOETskKbw0LwPhELhmXLQDAlyE2GyNok7P9N9KMqkUaZ
 tRirN29VCD/sirl2anqrINzFcmwJQAQeJ+i0
X-Google-Smtp-Source: ABdhPJzYxZgeZ3SEFrbtyRFcazkb4CEi8eZ9SCO2elOvqxkuLvyu2J5ZEO7a8aupND902oH49hCyVA==
X-Received: by 2002:a63:fb09:: with SMTP id o9mr133500pgh.255.1633552916457;
 Wed, 06 Oct 2021 13:41:56 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:41:56 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:27 -0700
Message-Id: <20211006204135.2813745-4-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 04/12] package/freescale-imx/imx-gpu-g2d: bump
 version to 6.4.3.p2.0
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
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 4f05ca78b0..4d28b037d0 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9fd1b2c05ecabb3cc1468c357fc85f024a736de54abb9942e17230f24fa280c0  imx-gpu-g2d-6.4.3.p1.2-arm.bin
-sha256  1b0369e9f75bf8fff7b8a86ade8d0d1748a52579b02ef72e53ad5565eee4dc60  imx-gpu-g2d-6.4.3.p1.2-aarch64.bin
-sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
-sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
+sha256  39fe307916e19a0892a514621121086e276a43858af90230372a1344852116a2  imx-gpu-g2d-6.4.3.p2.0-arm.bin
+sha256  2642a49e088daae4cf568a150d01e7c095995e8a6ff1883c02c3fa6d26d254b3  imx-gpu-g2d-6.4.3.p2.0-aarch64.bin
+sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
+sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 12f881105d..0e4078a962 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.3.p1.2-aarch64
+IMX_GPU_G2D_VERSION = 6.4.3.p2.0-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.3.p1.2-arm
+IMX_GPU_G2D_VERSION = 6.4.3.p2.0-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
