Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E19C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:42:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 415D061152
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 415D061152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15D5F4022F;
	Wed,  6 Oct 2021 20:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEB2c8T-5mA2; Wed,  6 Oct 2021 20:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10C134079B;
	Wed,  6 Oct 2021 20:42:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D10671BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C13F640689
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rpbX_K8Nv_RL for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:41:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FD3F405CB
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:41:54 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so5304859pjc.3
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gMZnLf0FrRnnCfzjvQe0pPDWmqHlJNIZQrLHVmWB6og=;
 b=cb0KF6RjW8oqudfls+uHRBRECYOXuzyz7+vcM+GRSEp9PrC2R/Ma23ePYAulos7dVY
 IDaxCEFgnssWkuSRBMFuYGr9lfYuTl1XWlSQ3ck5D8iTmnv+Y3mCKY+d/OFV3S1UCth/
 Lz0v+ObH9T+fHDG3/8tlwbldnHF1sOaaWLdFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gMZnLf0FrRnnCfzjvQe0pPDWmqHlJNIZQrLHVmWB6og=;
 b=YhkmTnP0KVOpeod6jDUayjoGFowjI0tpT3eaYjuJd0LvP822YlqXi8HG3VxS8bXAD5
 ysC7/DXVOUSYDS1+ERFscDAOsnZ0RRKxp2N7Ls7YzCFC/6lKk2zXzraArikYLfuzcHLT
 nOi0n5tcryOwYqMxIHyP+FpxNlKszC6ZTFE7iT1Tf5t6f+9aYKsLqIWhAZJ5MBm+IMTj
 +25C9QqkmKMMF0hqmZok0dRDVNorJ67jUeHbOESNR0k1beGqb5nvrvRbq0Mh5oSLfdP4
 VjpFzBsRebaS6W/rK/D+fflbb0r5t3ohp0tc9znCrGBUUfnoTyauEJ+L+/oy4BK/zBsj
 ugIA==
X-Gm-Message-State: AOAM532JHvoqUoMlRhNYxbnvNXdoAw4oXfQ9WIZSw2vZpsoRrYE0hLpo
 fPukI0Sdu25kyFQZ37vicD61yHF1pUQnbcm7
X-Google-Smtp-Source: ABdhPJxG+AlEHZkfMfJVYsRUn3ikutaaqHf64z7N+k3I8xdbL/3RcKUW9iQiGoMaJZRvFi+cNu4x1w==
X-Received: by 2002:a17:90b:1645:: with SMTP id
 il5mr321505pjb.158.1633552913828; 
 Wed, 06 Oct 2021 13:41:53 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:41:53 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:25 -0700
Message-Id: <20211006204135.2813745-2-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/12] package/freescale-imx/imx-gpu-viv: bump
 to version 6.4.3.p2.0
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
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 6c0dacba60..312eeb6f82 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0f139f5544250a3059c0a0266d44f70e89632694861de3e186272b170b37c464  imx-gpu-viv-6.4.3.p1.2-aarch32.bin
-sha256  3de60afb1f54c0888d9849c5a27f938ba229f9f35675456a173bdf00e3538c5d  imx-gpu-viv-6.4.3.p1.2-aarch64.bin
-sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
-sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
+sha256  1324b1aaf190110b80ad9a6f6533f4f50dce9e9ab8d49d8503f59764b151d219  imx-gpu-viv-6.4.3.p2.0-aarch32.bin
+sha256  003c30baefb1655790b475c3cdfa5cefbf81ea89ef37c6649b64f151dd23a52e  imx-gpu-viv-6.4.3.p2.0-aarch64.bin
+sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
+sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index fec19523a3..ace025c656 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.3.p1.2-aarch64
+IMX_GPU_VIV_VERSION = 6.4.3.p2.0-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.3.p1.2-aarch32
+IMX_GPU_VIV_VERSION = 6.4.3.p2.0-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
