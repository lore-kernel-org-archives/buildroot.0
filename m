Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C43E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 22:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7CE940248;
	Mon, 30 Dec 2024 22:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ge1mc7pfx9ao; Mon, 30 Dec 2024 22:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6ACE40570
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6ACE40570;
	Mon, 30 Dec 2024 22:54:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29434C8
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1772A804BA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2qMYufoc3pt for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 22:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BFCA80ACE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BFCA80ACE
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BFCA80ACE
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:54:40 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id D26A5240B29;
 Mon, 30 Dec 2024 23:54:38 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id B28672405A0;
 Mon, 30 Dec 2024 23:54:38 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 05792240562;
 Mon, 30 Dec 2024 23:54:37 +0100 (CET)
To: buildroot@buildroot.org
Cc: Drew Fustini <dfustini@tenstorrent.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 kilian.zinnecker@mail.de
Date: Mon, 30 Dec 2024 23:53:43 +0100
Message-ID: <3603154.iIbC2pHGDl@kilian-laptop>
In-Reply-To: <20241230224631.1080014-1-kilian.zinnecker@mail.de>
References: <20241230224631.1080014-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1052
X-purgate-ID: 154282::1735599278-117722C4-00F6C996/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735599278;
 bh=vzgAzQ9b5g2Xy0BrZbBKE7QR9SvkdX51oPg+4rGT2uk=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=QDyNe6WFHOqcR0vMyYpqcHQ1xPOdUAQCnNAW5YVor34UGpmFbKJ8CUac9nCfSfeXK
 dpf0XNRmwLvV3V7u5YRkM597ZD299NQQP0DGs3BzzPkgMV01I+A0cF49sxmc+24c1Q
 Esy/5txAekeuWaLjcAA+UiBjLt772OQckOIJ9bbWtIHu9ZApiL+J8YtIJx7+jXs0mC
 0SDa9vTcgXw8Xys4lSbznwQPWzZZUd0ZPUB8J5AJITHY5F9/LXZEldRTd8FlC44x5I
 rLHusZrm4HI1Ayu8oima016q937a1rVpTt+6ZvD0HL1RkMrj1ynQUPovstrK9HshmU
 x+8X9tBMCbKrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=QDyNe6WF
Subject: Re: [Buildroot] [PATCH v5 0/2] Add board support for the
 BeagleV-Ahead
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,

please feel free to give feedback once more if you like, but please don't 
apply this series of the patches yet, since there are still some open issues:

1) Still there is no LICENSE file in the xuantie-bins repository - hopefully I 
can get someone to add the proper license eventually.

2) The uboot is still the custom one. In the past I was not able to get the 
official uboot running, which features the Lichee Pi 4A - another board with the 
same SoC. I don't know, whether I can get it running though. So far I was not 
successfull.

3) Currently it seems that only one of the SoC's 4 cores gets activated. I see 
the following in my bootlog:

[    0.111209] smp: Bringing up secondary CPUs ...
[    1.132870] CPU1: failed to come online
[    2.161923] CPU2: failed to come online
[    3.190788] CPU3: failed to come online
[    3.194847] smp: Brought up 1 node, 1 CPU

I didn't look into it yet. If anyone has a suggestion, what could be going 
wrong, please tell me.

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
