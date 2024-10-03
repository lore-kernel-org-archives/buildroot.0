Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31278CF34C3
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 20:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E80A3607E4;
	Thu,  3 Oct 2024 20:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJjO9_AlQtN7; Thu,  3 Oct 2024 20:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09CB2607EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09CB2607EB;
	Thu,  3 Oct 2024 20:55:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51A871BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CD7940879
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucfc0Zb1Ra5h for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 20:55:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05F63407DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05F63407DE
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05F63407DE
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 20:55:37 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 24C01240F6F;
 Thu,  3 Oct 2024 22:55:36 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id BD088240A25;
 Thu,  3 Oct 2024 22:55:35 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 1098B240CDF;
 Thu,  3 Oct 2024 22:55:35 +0200 (CEST)
Message-ID: <76588525-e39c-4bd7-9311-bb3bc412cbae@mail.de>
Date: Thu, 3 Oct 2024 22:55:31 +0200
MIME-Version: 1.0
To: Niklas Cassel <niklas.cassel@wdc.com>, buildroot@buildroot.org
References: <20241003204515.403551-1-niklas.cassel@wdc.com>
 <20241003204515.403551-2-niklas.cassel@wdc.com>
Content-Language: en-US
In-Reply-To: <20241003204515.403551-2-niklas.cassel@wdc.com>
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 819
X-purgate-ID: 154282::1727988935-28CCB779-23B489B4/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1727988936;
 bh=0t/kcJ3ORoXRBVJzjDOYx5SylLNq+8FyDtTEqF9I7d4=;
 h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
 b=RLpRShq8KUcqzFgkEXO3AHzxGmM0XllJHt6unELisG5ohVoAHdKEkiuxymIaRnkIb
 nbfno1i0jH1w4PY6JbwYv/a4LCzJ82hEioES8Mk/kKgU72TYArzVa+OmutG20DqeJX
 6kM7K41+chHfZIC3j33MR9A5SyM5tbegAioQk1vDDpKXdpH6sc1XHBtMkk75ko7VjJ
 qLfZ7s10MsO32qwZVzPfRv9kidUlOOlj9tx3rk+k/+p6fYZWrn89UVRQGARmdTk9DO
 9D7cvMgp1xYcszAMKw3N/q5cyTr7/tHgDu2Sftfr/7tDsCBFarjtLf8KwI3y/TRCju
 tHXJNKTDQ+jnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=RLpRShq8
Subject: Re: [Buildroot] [PATCH v2 1/4] configs/rock5b: update to linux
 6.10.10
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
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas,

thanks for all your patches improving the Rock5b board support!

> A bunch of new hardware has been enabled for rock5b in linux 6.10,
> most notably USB3 host controller support and GPU support.

That's great! However, recently Bernd Kuhls submitted patches to support 
Kernel 6.11 in Buildroot, see here:

https://lists.buildroot.org/pipermail/buildroot/2024-September/763467.html
https://lists.buildroot.org/pipermail/buildroot/2024-September/763468.html

So far, they are not yet committed, but I'd assume that this maybe 
happens soon? 6.11 also brings improvements for the Rock5b:

https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3588/-/blob/main/mainline-status.md

So maybe wait a bit and then directly bump to 6.11?

Best regards,
Kilian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
