Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA517C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 00:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61D5F408E6;
	Thu,  7 Apr 2022 00:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJLdVjPuqo2v; Thu,  7 Apr 2022 00:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85DCE40500;
	Thu,  7 Apr 2022 00:56:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFF3C1C1135
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE22960F41
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WXz0eSUdz7L for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 00:56:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 211A560E8E
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 00:56:23 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id n9so3497679plc.4
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 17:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNb+spGSYQlOu9KvbJ/ViXMMwrSbLDeSNaYto/pjL84=;
 b=oirrNcu935T6V8Dqu2OnlBtq1NXXX7N4a1bSETTRaEH0m0pMPKrkBiCUTeAcx1CC8U
 2BcVOgawdpvfBr1/ufNb38BvetTMbtK0BLVnc0nlPfKJ6Oy7M79P0gfpuvnDsdeAJw/0
 mXa9/YoFOb8Se3MSxwXcG8ocxFFclNkGAqJIRCPlJSmdB5oMOvqOECOULbjBq3Ib/CRg
 AMyB+zkaR0azEI87D/TnDTYUO8K0nvJu/nhyF0NM2TEsRSaAKtNtRb3Ele5kzdbxdpO1
 yj+TOvH/PWojMm4QJtpZV4kkMx8CnLlzRq7GWYFrRemusvrNW6ZcktuiGAagdu+K+pVk
 RuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WNb+spGSYQlOu9KvbJ/ViXMMwrSbLDeSNaYto/pjL84=;
 b=gIqUAZu4Z9d2sHPU4XowtYpWLUItfcg5cFL2YCwA8ttUF61WwJo8Til+J2WbbhFjmR
 o+AQT1yBdqH3V/1RYOovbJ9cegrT289DD8sWOVZ73yJNARJwp3Ib3LqaDHwDRsRyeHTX
 jpM+eau4izH3u7zbdIwsXrutTHz/Shf1k0Hnjrt30Law8JzpKLV3pnld+wtHPN1Rf549
 /1vlvhP92BQLl3KpAtoXczyYxZXVpRBu+bHSv+SaFXgdsy5dl3lwZ4kop7l2/6znG6M3
 F9Qemszn5JpOJKXFaVCTgsE+bYZ/uszZMhhCosi1J4oOjKUKcwj7xDOITeHgh2MgP1GT
 pyEA==
X-Gm-Message-State: AOAM532bX14pinoqhDi9klo7k0fMlF2/XdhG0j0lsdtHUi4HSuHchlYT
 xg8DNC4QADK1JaAq6PevqgKQ3Zvc3yI=
X-Google-Smtp-Source: ABdhPJy2StO7sQZ/Hr6Jt7m7QCRIXzHbY9IctWgRu+jP13IL3nnUo4eBAF81z8lwU6DZXgxnZbbiNw==
X-Received: by 2002:a17:90b:4c0f:b0:1c7:d2de:5aec with SMTP id
 na15-20020a17090b4c0f00b001c7d2de5aecmr13170614pjb.110.1649292981917; 
 Wed, 06 Apr 2022 17:56:21 -0700 (PDT)
Received: from voyager.ibm.com (cpe-172-197-129-163.sa.foxtel.net.au.
 [172.197.129.163]) by smtp.gmail.com with ESMTPSA id
 x12-20020aa7956c000000b004fdf7a4d49dsm13067804pfq.158.2022.04.06.17.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 17:56:21 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	fontaine.fabrice@gmail.com
Date: Thu,  7 Apr 2022 10:26:05 +0930
Message-Id: <20220407005608.203359-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/3] powerpc: Add flag to control VSX
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Cyril Bur <cyrilbur@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice has been fixing powerpc build errors relating to VSX. Instead of
disabling the feature outright, add a BR2 flag so we only turn off VSX
where it's not supported.

Use this for flac and libnss.

Build tested with the ppc 602 configuration, with glibc and uclibc, and
with the power8 powernv defconfig.

This is v2 as Fabrice's libnss patch was v1:

 https://lore.kernel.org/buildroot/20220405213351.2487658-1-fontaine.fabrice@gmail.com/


Fabrice Fontaine (1):
  package/libnss: fix build on powerpc

Joel Stanley (2):
  arch/Config.in.powerpc: Add BR2_POWERPC_CPU_HAS_VSX
  package/flac: Configure powerpc vector extensions

 arch/Config.in.powerpc   |  5 +++++
 package/flac/flac.mk     | 12 +++++++++---
 package/libnss/libnss.mk |  5 +++++
 3 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
