Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5ADC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1BBB40245;
	Sun,  5 Dec 2021 10:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4E8OQsDQw6h; Sun,  5 Dec 2021 10:29:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E32C340333;
	Sun,  5 Dec 2021 10:29:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A70B41BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9679E6071A
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 808K30fKX07G for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:29:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA538606C8
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:29:20 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b40so17924748lfv.10
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 02:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qc2L5DTU1JBynUIQA567AX3a9BjLD19RDXxv+KNQG2g=;
 b=Yg7hFzCoaooU8psoN599ymdWLY+JHMRcaptP5krQN1FzjyC/fitc6soOd92CiGKR+z
 2CwGXSyh4GNOBXTRElxQ2BQI6BlOHl7yOC70gStmX2QZtOpiBc+zAr/5lerFi42PYI3Q
 c7W0zUuy+RWo3rfPl0HuUeJOtC0H08Z1N0lX/u6kJIzvruAjvaVtXtjsI5Eu5l0jIeo6
 H6rMZzG+d6frdHjwl3Mc5zNlWdAKbeb17pvvjxhFS10ypGPJu2ihmzyg1TY6jXZ8T0iV
 /stx4iHnMqTgXH4fqQBn2RC/g5uJ6moQa24b8B4ThVGogrMLze6d5VQ4f+yaHWEpz1T3
 V1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qc2L5DTU1JBynUIQA567AX3a9BjLD19RDXxv+KNQG2g=;
 b=gxAilrs9k23sFoKj2UWAJQID10tqRtAWELMfFDIqRqdEbKZOv3baVVLjEZuE8XOtmZ
 aq1npIjbT61fqBBzAscSKtEGyqF1Ffsw2dRn7K9rKGRLwcuykOPmubWJtfRE1Qg2E4hq
 uOrv/5YBLqTR3dmQB7XeqcRniu+U+0QyS7nqnuk5bUvCkr+LmSc2sIKKgYZxayq+ZXe1
 Ma5tP4hfe3IN9kG6OBvGxj8er1LVRW514Ow/P/1NJd6+7nfX3WZcQAM3UKRamRaKVb+J
 +jXTOdMhncgrEpM0ztwcVO01jHAvjXvmLHA/fXYpTYPW61x3NyHlqkwdRwyxwthnZcj3
 OAHQ==
X-Gm-Message-State: AOAM5334R1SYAdB+crgydDxrQT2S/WlTFRKQeadtgvU3ufKSMO4GH6+P
 g7kcwcPtQQjYvBIfDa7a9n8YCyriOjA=
X-Google-Smtp-Source: ABdhPJxN0B9vBCSaoCknBIcPQLWG+T+d4w9pODF9Uf4dszoyV/17siwYBWfMpnqA6PMtBcm4S4efkA==
X-Received: by 2002:a05:6512:118e:: with SMTP id
 g14mr29200270lfr.561.1638700158550; 
 Sun, 05 Dec 2021 02:29:18 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.198])
 by smtp.gmail.com with ESMTPSA id k22sm1047191lfu.95.2021.12.05.02.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 02:29:18 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 11:29:03 +0100
Message-Id: <20211205102907.2836980-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next 0/3] package/inadyn: start script rework +
 repost
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
Cc: Joachim Wiberg <troglobit@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, all!

This patch set contains the rework of the inadyn start script.  It is
now modeled closely on BusyBox S01syslogd, as requested.

I'm also including a repost of the .conf example update and the switch
to use the upstrem systemd unit file.

Best regards
 /Joachim

Joachim Wiberg (3):
  package/inadyn: replace local systemd unit file with upstream
  package/inadyn: refactor start script
  package/inadyn: update inadyn.conf example

 package/inadyn/S70inadyn      | 100 ++++++++++++++++++++++------------
 package/inadyn/inadyn.conf    |  25 +++++++--
 package/inadyn/inadyn.mk      |   2 +-
 package/inadyn/inadyn.service |  10 ----
 4 files changed, 86 insertions(+), 51 deletions(-)
 mode change 100644 => 100755 package/inadyn/S70inadyn
 delete mode 100644 package/inadyn/inadyn.service

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
