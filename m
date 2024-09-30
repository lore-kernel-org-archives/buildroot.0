Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EB2CEB2C2
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 21:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA558400AF;
	Mon, 30 Sep 2024 21:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdDgxQNNLE5y; Mon, 30 Sep 2024 21:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F25400C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7F25400C5;
	Mon, 30 Sep 2024 21:20:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCC201BF38B
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 21:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBE1760659
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 21:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhT9Lh41C8Sa for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 21:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F26D060595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F26D060595
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F26D060595
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 21:20:53 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 2C92E240F1F;
 Mon, 30 Sep 2024 23:20:52 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 0A503260286;
 Mon, 30 Sep 2024 23:20:52 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id BE8FB240571;
 Mon, 30 Sep 2024 23:20:51 +0200 (CEST)
Message-ID: <79861be1-00c9-4f61-baca-2a276683910e@mail.de>
Date: Mon, 30 Sep 2024 23:20:49 +0200
MIME-Version: 1.0
To: Quentin Schulz <quentin.schulz@cherry.de>, buildroot@buildroot.org
References: <20240929151124.103921-1-kilian.zinnecker@mail.de>
 <2460269a-e521-4add-ac09-6bd1b0a7a872@cherry.de>
Content-Language: en-US
In-Reply-To: <2460269a-e521-4add-ac09-6bd1b0a7a872@cherry.de>
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 726
X-purgate-ID: 154282::1727731251-064C8779-E29731AA/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1727731252;
 bh=aUKAsUQhyjhk2g4iobqhVDu/U+jhZWyNEWcU7lh0Fo0=;
 h=Message-ID:Date:Subject:To:From:From:To:CC:Subject:Reply-To;
 b=OCXSYdAeKUr0P0T8hYR3A5QH+F880zYLNbwEX4DB0O1LJyZe3SqCuJ/HxNzf2TBQz
 mHKm0XY4cv4BIYwWiXjVf0Nar0KlRB3SWtTsImWgcma0G6SE8S7bWJZE/arGuJroqA
 utkBWYV0s2qH3j45gixS4NuStSTLIFLDPVKdppmFUSlJePSY0jazQHeauHGiiso4qU
 wjADk6vkeQIij+nQFkNjrtjvW6G2ux5rA+G2X+NebuKekkL3oqk/QTHXzf644QYnW+
 2OkXM+w6GDGkN+u1wWvweFybAUAw8g2J0yOaZyU0NqhPpjxKoeYRAlq2d8K5tCOSNP
 JSilJtK+h+rIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=OCXSYdAe
Subject: Re: [Buildroot] [PATCH 1/1] configs/rock5b: Switch to mainline
 TrustedFirmware
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Quentin,

> Is it really reasonable to use a random commit in the master branch?
> 
> The v2.12 tag should happen somewhere in November/December if it follows 
> the release cycle of the last few releases, shouldn't we rather wait for 
> that?

My thoughts were, that it might be better to take the commit from the 
master branch of the upstream ATF, than the binary blob. And switching 
to the release version can be done, when it is released.

However, I also understand, that one might argue, that a rather random 
commit from the master branch might not be so stable vs. the binary 
blob. Hence, for me it would also be ok if we wait till v2.12 is 
released. What do you think?

Best regards,
Kilian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
