Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84106C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CB1B40B77;
	Tue, 26 Apr 2022 17:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIfwNswLT6oB; Tue, 26 Apr 2022 17:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C99A409D6;
	Tue, 26 Apr 2022 17:32:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF33E1BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC2DB409D6
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H29i3Z8XxLWK for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:32:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3256140499
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:32:20 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id iq10so5672527pjb.0
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2RYRh2BjLmOX8vTa4sSNvOxojZKQL4PxVYdDHljW2jU=;
 b=SyEitJiCi2u1qAtvDT4av5ppfKomJDINmWLS9fE4mNzk11bPRFrKS8LPSg46sBrQCd
 TvfqN6dxH0v86KwP5P83LEB7g6w3TJmudcTwtQJjpMT15YOTL5G31Voh2Ihjwz1vNlCR
 eOBSsdVrpkALSBG9zHGja3OQR5/OAoNWCQ0flAHu7YgYl5w5vW1ZqOyrugHOKYOEbd67
 yCkjT2C9T6lP+7zLlLqSApWhitfnfJiRJ+KXd3elkpJD97kNflmcjWKqyD/dxcC38OGn
 YJVYdMVFyPz6p9mCYCASwWrwjOuPDoq8IoHvasT9Z/DHCWPrDZ9yDk8q1dHl+Yh8WThy
 js/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2RYRh2BjLmOX8vTa4sSNvOxojZKQL4PxVYdDHljW2jU=;
 b=D9gI3fjCCzNkDKDylpSRU8eiAw8x4bykdPbti859cDVV4TXnFulswapsVncVhxtCrV
 WwcU8cgmtZhuR3IVho/XIkMZapRNaIjDUmXpCuel1Pxx5nm5C5PGfsx8DeE95deMJ32E
 vjWfl9cYwNa43XKpMuoELxsJh15GRS4zYq5J3imkgQAuZ/P6rzfIQKb+T0H/QdCpY6UG
 I9nkUClXnbD0S19Yt2HEa0vmurKnVlhRwOMc+v96moXMh0nqkoAmDw9MnBJjoQT27Jtt
 i66G0ynrcNv4Is38QhBw4Z8HezhLulXiwXOjsePv4uOgkdG5rVAtKYRvDT2pXIYjEgON
 1MZg==
X-Gm-Message-State: AOAM530J4b8yBNSo5htWRTWjLW6geIPWkKD+l77lwosHsq0ZaJdnW5/C
 xAvnIsz55WCpQM4tS27gBU1OoqRa1F8=
X-Google-Smtp-Source: ABdhPJwTkecmK23gAOQ0Nj8fL1vkuTkdb0549OhTVwL74I4EGOd1ACkReNuEboDH69YPBVzXS28/pw==
X-Received: by 2002:a17:90b:4f49:b0:1d9:8793:1788 with SMTP id
 pj9-20020a17090b4f4900b001d987931788mr10154220pjb.131.1650994339087; 
 Tue, 26 Apr 2022 10:32:19 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 o64-20020a62cd43000000b0050d416200e6sm7204341pfg.5.2022.04.26.10.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:32:17 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 10:32:09 -0700
Message-Id: <20220426173211.64840-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/2] External GCC12 toolchain support
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
Cc: opendmb@gmail.com, mmayer@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series allows us to use Linaro's GCC12 snapshot that can be
downloaded from here:

https://snapshots.linaro.org/gnu-toolchain/12.0-2021.10-1/aarch64-linux-gnu/

Changes in v2:

- rebased against master

Florian Fainelli (2):
  toolchain/Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_12 blind option
  toolchain/toolchain-external/toolchain-external-custom: add gcc 12
    version selection

 toolchain/Config.in                                   | 11 +++++++++--
 .../toolchain-external-custom/Config.in.options       |  4 ++++
 2 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
