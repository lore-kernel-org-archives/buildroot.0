Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2292EB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 14:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13A248186E;
	Tue, 27 Jun 2023 14:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13A248186E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcFIuhVIReeW; Tue, 27 Jun 2023 14:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4727A81A6F;
	Tue, 27 Jun 2023 14:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4727A81A6F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0571BF35E
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 14:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E720F41DFF
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 14:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E720F41DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhNVnsODxMQe for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 14:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D27141DFD
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D27141DFD
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 14:34:10 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b69923a715so44058551fa.0
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 07:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687876449; x=1690468449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6DSYn4PfYP99QHE1wa+EsF1Bv/Ok8xnH7FhmVqi2s0U=;
 b=SbW9hozbiOOjn2U+THyIrCGNwGwoTku1hTbj0xUITD6kYJDq3z9T1/xJ0kW0TA9zhM
 fStBhqHb9xPFurOF8iqu7K5G+ZWkvI6iS8LX1Yapt6NE1CcCVURGim0uEVeBC0E/AcpM
 ogkXIETi60fmGy8RZgLDaOKPtB4ujqbdFLoqUB85lsQehzohz92WtpnzsoBLab2lMhE8
 IYHZ624nj7BAnTK/5Z7hp7yrKNbkDnaFnfD6LJ/6dw5X397iJaBYiIlNvVELwtiWjfoX
 dD+2FtFJhyo0k7nAZROMsKgfiOoNW37NjEdAdKFamk2MD+MfKNCNIx7ri6jjeEvHYByK
 cNGw==
X-Gm-Message-State: AC+VfDyHhSoMYTKCuCetJZe56gJO5A/crLt5iT8F6XoLSdGJFv/Iburb
 cVHYSZBXLnge9Mn6ABOBhptHVYI4Haw=
X-Google-Smtp-Source: ACHHUZ6SjxQpJbbo93j8u93hTN/MEgV5lpZljWuBfkCwAVz27WwyasPhBH96JVx9K++ePX8Jh0nOSQ==
X-Received: by 2002:a19:6748:0:b0:4f8:6600:4074 with SMTP id
 e8-20020a196748000000b004f866004074mr17824838lfj.17.1687876448495; 
 Tue, 27 Jun 2023 07:34:08 -0700 (PDT)
Received: from p1g2.home (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr.
 [83.204.213.113]) by smtp.gmail.com with ESMTPSA id
 h2-20020a1ccc02000000b003fa74bff02asm10874540wmb.26.2023.06.27.07.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 07:34:07 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 16:33:59 +0200
Message-Id: <20230627143401.594223-1-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687876449; x=1690468449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6DSYn4PfYP99QHE1wa+EsF1Bv/Ok8xnH7FhmVqi2s0U=;
 b=KzTGipVjtJBIrYeqOLT5iuCuGuPQBi1uJn/0gJoLljYAMZinJTUaa6bDFw/d3NBEnP
 +wMI4wPugg4f/tuIdmdXpk1pLI1B1MRUwLQyKlZGz/VzyAhcwZ8K7rVxzDrZxdAoTmsK
 Ag6AQBCrqkprkBlvvV73MVdP4Tf+oA5Jus24RJhmeHyU4eCWaezXROnfVv/q1gm7zbk2
 0bt0/vSMl4psxv0vASVpSwmYNq7Pb7cZk+SLvuTPpjueoPg+R6EqS3Q2WZDtFp6HGGFc
 nrJ1Bb2IBk7MbCWckVhQ2Uam4ki2PjWgB960gKh77/p6apUDZrmxw5GLpa+xjzer2Z7H
 o9Ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KzTGipVj
Subject: [Buildroot] [PATCH 0/2] configs/nitrogen*: fix u-boot build issues
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Sorry for the delay, finally had a chance to create a container using
the support Dockerfile and was able to reproduce the build issues.
Should be all good now.

Thanks,
Gary

Gary Bisson (2):
  configs/nitrogen*: add missing openssl u-boot dependency
  configs/nitrogen*: add missing pylibfdt u-boot dependency

 configs/nitrogen6sx_defconfig | 1 +
 configs/nitrogen6x_defconfig  | 1 +
 configs/nitrogen7_defconfig   | 1 +
 configs/nitrogen8m_defconfig  | 1 +
 configs/nitrogen8mm_defconfig | 1 +
 configs/nitrogen8mn_defconfig | 1 +
 configs/nitrogen8mp_defconfig | 1 +
 7 files changed, 7 insertions(+)

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
