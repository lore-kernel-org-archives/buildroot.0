Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877E1C32792
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 19:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A1B540B83;
	Wed, 24 Aug 2022 19:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A1B540B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pcRu0cY0I-7; Wed, 24 Aug 2022 19:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FA1340BB5;
	Wed, 24 Aug 2022 19:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FA1340BB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDD401BF307
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6F69417AD
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F69417AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsAytIgMTo3X for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 19:26:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B66E6417B1
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B66E6417B1
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 19:26:27 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso2505257pjo.5
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 12:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2uQz6DPys3YfBsy54syAfOezZ1mKfATgosDt86rsqBo=;
 b=HwGoFS4DpnZXkJWzwYDELjegaaBjupaFKzKXPqmAgsNIaNJPq531dJxMx1kcsKplZP
 0O4qJj13CbTy8XApMJTxg3eS6+DXxfIGt2nlXNosfxgRIBbSrSZUZm2wyCXgsqR7A0BT
 51arD0Aw6kVqo1LwjSDAUQs8SLvDvXknHbZX7uOqrsdwInB6HSQBu0XHQgnahQSQP6wS
 Vj9kPUzK5XedJKZStppr7GV+qAuycq6Je7F7aEAv+0p2fn3iC+pc6K1/3rw0vQYOB7xL
 K0ZibBIdUGzWbyL6OfFuo+taiITsUEuGZtK19q9BDdS+R+kNaiV1B9t2FMT/9ZTN3/M9
 Y2uA==
X-Gm-Message-State: ACgBeo24Xqd8GC3nszQbFO/815WbT5DaHJA5VH5xCsm6XUmSO8cAj+7/
 hxYEtECeMG7uEMWTKMPw5jUBLhOsHqKI722n+OA=
X-Google-Smtp-Source: AA6agR6tRPgxhSRiyEqA2W79+QZamM4hvGk0owvvSnI+CqoI5Ru8e5PPk4CymYzsUiYBqrkm0H9Rsw==
X-Received: by 2002:a17:90b:1e12:b0:1fb:6df6:b45d with SMTP id
 pg18-20020a17090b1e1200b001fb6df6b45dmr647852pjb.63.1661369186971; 
 Wed, 24 Aug 2022 12:26:26 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a17090a1b0100b001fb4a8d82a7sm1741338pjq.56.2022.08.24.12.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 12:26:26 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:26:00 -0700
Message-Id: <20220824192604.2549356-10-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
References: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2uQz6DPys3YfBsy54syAfOezZ1mKfATgosDt86rsqBo=;
 b=NawiCvcOBIXEY+4P4WT7Wudvkrgt3assCru39ytT6mWQeSBBtSIHTtso0ipUnPO3de
 dd0mfw8MnLK3HelSxvwL7WcCMPV05Ruqmc+6g2M37+5vTXY7XPWBMHb63DCaN6jo5sm8
 eigTna5kKYlMl7oZ/BphEIynH2H9GdCJdx+Kk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=NawiCvcO
Subject: [Buildroot] [PATCH 3/7]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p4.2
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

To match NXP 5.15.32-2.0.0 release.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index ee105ef82c..ccb28bc4f6 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  257c6cd8b01cfb6543827cbeb78409e6a2ad4ae321891751dcea1abc47d89379  kernel-module-imx-gpu-viv-ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5.tar.gz
+sha256  b816ab94b1d248cfc5fe5f6381422346c273d01760bb324303e0298e10bd46e2  kernel-module-imx-gpu-viv-82c6cb6c607424403b8d76805bb17e7be74292f6.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 10505fdf17..f94890a438 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 82c6cb6c607424403b8d76805bb17e7be74292f6 #6.4.3.p4.2
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
