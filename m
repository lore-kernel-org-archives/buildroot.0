Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37AFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 22:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 460E840B6F;
	Tue, 22 Mar 2022 22:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5RKXI3twYJB; Tue, 22 Mar 2022 22:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5335D40AFB;
	Tue, 22 Mar 2022 22:21:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 854341BF5B3
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 22:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D4D840AFB
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 22:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5iME8riWDlw for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 22:21:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1244340486
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 22:21:12 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so3412291pjp.3
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 15:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vHeWuKwTvyKoPpLMa/pI8Biwsnz1Ct32GA8KSHgCrbU=;
 b=YhNyVLBo1M2hxRM84xf3GR8QtmxJW9NR3e3yEkx5izJUeXIxU6LAuW5b0XSKtmpbkW
 KYwd8v9kNYRYOKEkk8g9sYGcS5KnD7OcCDgd9pZkV3MbqkH+h1vRHp8sxiTuf4ZZYg69
 PgP1Cdx9Qk5GP3n0B2PsySW3Do4eDOGlgSjUhHFG9ic021meWFmKP2lCaaDPJdqITwuc
 VwzR4pEwd44LrYK+Eh1Pv7Tq1tfWLKjZfaoiH+vymFpi8MtFAL47EdMIowphT0/Tuovc
 ttL5uMDIn0fT0fuuMbFy4eZVnF979e7fyhgLC91CV1+4gZfR3yqHB7pWHmWDQYQL9E2W
 fh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vHeWuKwTvyKoPpLMa/pI8Biwsnz1Ct32GA8KSHgCrbU=;
 b=t1+a6rKBf6D6PeQvRHRwpdTzZH3PE4PU5E+pT1XgegasrVEX1CBLzn/pzo57p2PWI1
 Qr5LoRKAA0omkE/wYUeC2D/wM/BS9GpGelRwge9REbhaMC351lOAfy0MjObO/oyeDSgR
 druCbnQjFOGcW7qX4832GDdeyeUf3zQsmyL83xJBW5AmB4v/GXzDa/BUaXNvRXGYWI73
 ATKH6mip6Uwqu776ThCxK5jsHTBYidJLZzBzU/Fa7tebVRGBKN5E4bdrOXNgZXZmKilb
 hGOkUI47eaY/1C54pJI3F+LN8JkLyIfkuOJsUUq2aTgH8h2Nk5hXAxGEixNeu1dcURyf
 ddIA==
X-Gm-Message-State: AOAM5323mIyF9MZ3qqlKRKBhx7Mrzqq/HrxuK5Zi5PhRSWbQkryySH4l
 DacDJ/al78cnqn06OBxQJt2axRmmAC8=
X-Google-Smtp-Source: ABdhPJwBRzEz3tMd9f5YbzqH9HD4ZbARDHDEWQ3/q6YmDiHMLnEg6MuivHOkaDBGG+qbYFAxFDptdA==
X-Received: by 2002:a17:902:e803:b0:154:2699:7f39 with SMTP id
 u3-20020a170902e80300b0015426997f39mr19801756plg.172.1647987671961; 
 Tue, 22 Mar 2022 15:21:11 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 h14-20020a63384e000000b00366ba5335e7sm18415313pgn.72.2022.03.22.15.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 15:21:11 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 15:21:04 -0700
Message-Id: <20220322222106.42347-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] External GCC12 toolchain support
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
Cc: opendmb@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
 mmayer@broadcom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series allows us to use Linaro's GCC12 snapshot that can be
downloaded from here:

https://snapshots.linaro.org/gnu-toolchain/12.0-2021.10-1/aarch64-linux-gnu/

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
