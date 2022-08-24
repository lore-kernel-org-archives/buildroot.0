Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406A6C32793
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 02:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE11F60BB9;
	Wed, 24 Aug 2022 02:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE11F60BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgKx0Ixfyvy8; Wed, 24 Aug 2022 02:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E9160B58;
	Wed, 24 Aug 2022 02:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4E9160B58
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21DC41BF3FF
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F136E60B58
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F136E60B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obIqBWBeJJKG for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 02:49:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D1ED60B3D
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D1ED60B3D
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 02:49:30 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id g129so11888440pfb.8
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2uQz6DPys3YfBsy54syAfOezZ1mKfATgosDt86rsqBo=;
 b=T+RU4ErSTTZvTsdPAJfeg5KdaSTrn2SYJzqL22NMFG+pYKq+N+NgUPeFMk1RBYweyj
 mivd7iUduYxoUcGtrhZe5n0rsVEruDqDhTBRt8KjrCOcJtGeNheJ029aBK/FIsrQzS/4
 PHnEJidUmVi+/cqJ/SXUULCitDKj3+eQuIOkPLXgm+A3JD0V1NvZtlgujSHwHUO1sRnm
 QYiGgcdEfU7KzH8L/c/hsnX7mQyUP2Da7+9GJo7CWk6TZ+wmidUHtpNlu83AH9ZVwOwf
 QjYI56Ge/qNU2Swbr2x89PFLHvUOjffY5rYgEl+4D4dWuYSPGj/TaM8d6EtNuYVnC+Mq
 c08w==
X-Gm-Message-State: ACgBeo3i3F00BGLT2sJduWS8kEBkZPnNpTBR/8MlMREfmuqEh7rb3EcV
 xw4GsAcBPVD0TlvWoaKAC/MFo3qX2ad9PmCIvwU=
X-Google-Smtp-Source: AA6agR4VfgRYRDmLc+GN7vNnl/Z9YaLg+8xKfeR7tTcJEC5eRES5BjVWjOa40tiTv0VIlLi09uzyvQ==
X-Received: by 2002:a05:6a00:2349:b0:536:bf09:9c0a with SMTP id
 j9-20020a056a00234900b00536bf099c0amr10048247pfj.32.1661309370071; 
 Tue, 23 Aug 2022 19:49:30 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 p13-20020a635b0d000000b004296719538esm9845273pgb.40.2022.08.23.19.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 19:49:29 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 19:48:53 -0700
Message-Id: <20220824024904.2529728-3-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2uQz6DPys3YfBsy54syAfOezZ1mKfATgosDt86rsqBo=;
 b=Y/ee0Vw6NTWJye0gsTI/s8dJs/n5isycdj0zHPgOTRqIKuduLzOsg2K7GP71Bj0SCC
 fBPwmIh8Z9Is3FhubTgeY0URy0WZ/23cSS3+islrETQDWxsuwxonjz4bwoFXP3ljokTE
 EvDKumVnLnb19J6B3m8aw4hNNcSLpmD+RLnJg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=Y/ee0Vw6
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
