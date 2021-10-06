Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D78BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AC861131
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31AC861131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F399C4079C;
	Wed,  6 Oct 2021 20:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faEey3pkUmkM; Wed,  6 Oct 2021 20:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24A744079B;
	Wed,  6 Oct 2021 20:42:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7728A1BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 655F440689
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rihn-1as_sw2 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:41:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1D28405CB
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:41:58 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so3408998pjb.0
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itNhDcihffiRHmOBurTQBbOi8OoHR3CPb+nUBwhaKkI=;
 b=PF5R9260p8LB0vSQ1jSbP2peV0OX0Tb/s5tujqDsiHEDWGJ80FzRlReAR+RKBibGIH
 cnzazKcKJz41+3dSCd83qFtLgKqQQLtMDL5xQ2Hh8DrS3MwgEiMGFmEwdxgziq9k4v89
 HHFCV2/CTv10MoS2vPu832QXXrNHxvEdnkfAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itNhDcihffiRHmOBurTQBbOi8OoHR3CPb+nUBwhaKkI=;
 b=0wg3lrlHI2efPuhZoYhmik9BORsbSkT+2v31XKqfpt2RRUAnvf7W7ad51fe7rL+Sf/
 /FNVXWpHv+Gg5e3wZ+CtuDKSqRyQtN6WHLE5kEmrXIxicTE5fVYBueWmLeV/DQigCq1H
 /VgfIxtSsS4N5zKO0WVvhT31ZVZmnnQtNYVN0dAL4rP2Augui6uEm5sieIU64JsyEvd4
 tVD9kvxvgf3yLTLqpVph7tNBqR3CBXSM9jYhHZ6sMA1Z1IjJHs326A+WQncBVg6chwDV
 auzjDOg19kvUzfuqVC9NwMdWni4Ak6/DmtcVr93YE4VAah732s6YJJFERWZr+2iy5Gth
 5goA==
X-Gm-Message-State: AOAM530YubH0PQst9DXM65Kd/4Jpl3BwZoPxkDEV9Uh2zfIopFfBnBMj
 FwxwNFZcGZazkLkhl+CEo6y2NXsWttRp1z+V
X-Google-Smtp-Source: ABdhPJxJyy/pRsxqrrUEXr9RL6DkSZDJOHPTVJQPtr60R6d4dTIYgTKb9eCVFgm3H0N1/FWXqPOzpw==
X-Received: by 2002:a17:90b:4b07:: with SMTP id
 lx7mr282556pjb.195.1633552918046; 
 Wed, 06 Oct 2021 13:41:58 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:41:57 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:28 -0700
Message-Id: <20211006204135.2813745-5-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/12] package/freescale-imx/firmware-imx: bump
 version to 8.12
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
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index c434ce7ebd..98a0e73048 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1a7aaab69cd8c48d10ffb0118c938f4b3daf4c7fd86f0342f4d352906f8e0ecb  firmware-imx-8.11.bin
-sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
-sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
+sha256  6b6747bf36ecc53e385234afdce01f69c5775adf0d6685c885281ca6e4e322ef  firmware-imx-8.12.bin
+sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
+sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 29241342be..60c97fd2b8 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.11
+FIRMWARE_IMX_VERSION = 8.12
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
