Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C87C531DF
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 21:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7991640329;
	Sun, 18 Aug 2024 21:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88YbbI7WEizt; Sun, 18 Aug 2024 21:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 381DA40447
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 381DA40447;
	Sun, 18 Aug 2024 21:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA2D1BF951
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 21:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3927F40319
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 21:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQQxvVsEsuhv for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 21:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E908440021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E908440021
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E908440021
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 21:43:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2378F60002;
 Sun, 18 Aug 2024 21:43:08 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 18 Aug 2024 23:43:02 +0200
Message-ID: <20240818214305.1051667-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724017388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nzOt7moqxwsy5RxXRCkesEN8G24R9ItgW+YuK6DmepE=;
 b=JOGUmJVOke2oAUQNOklCmEqpJZcKJEDmYsj3C2mf58RDmL2Gv3780pWuG7PShtkCX42SyQ
 ivvchZtDtX3VYMt0TJzOFcrvl1Ll+/BtaUecq7jHgFbXIpAluDLdFYQMuHhW7kWZon0rO1
 RLYLEzcZNMn/Dh/eFI8kok1O5nc51UxuoS+Bpxjmv0UWYQ+/f/RlHrkVhX/ROXewDlCG6Y
 fahAM6QVWI1NOhdLmMqnYrzp18C8OcYwOKqPLpJBuyYMBJDFvZ9uvUp2o6+HeJneMBU4ub
 hrKRXKcenDyAiAc3WCL0E1GXvF30UGsFN24Z7id/7TwIqtZZfA3S5jBrIHVv+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JOGUmJVO
Subject: [Buildroot] [PATCH next 0/2] Update to Bootlin toolchains 2024.05
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This short series updates toolchain-external-bootlin to the 2024.05
toolchains.

NOTE: this series depends on
https://patchwork.ozlabs.org/project/buildroot/patch/20240810215624.482529-2-thomas.petazzoni@bootlin.com/,
which introduces the BR2_ARCH_NEEDS_GCC_AT_LEAST_15 symbol also used
in this series.

Thanks,

Thomas

Thomas Petazzoni (2):
  support/scripts/gen-bootlin-toolchains: tarballs are now xz-compressed
  toolchain/toolchain-external/toolchain-external-bootlin: bump to
    2024.05

 support/scripts/gen-bootlin-toolchains        |    4 +-
 .../tests/toolchain/test_external_bootlin.py  |   81 +
 .../Config.in.options                         | 1519 +++++++++--------
 .../toolchain-external-bootlin.hash           |  870 +++++-----
 .../toolchain-external-bootlin.mk             |  890 +++++-----
 5 files changed, 1758 insertions(+), 1606 deletions(-)

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
