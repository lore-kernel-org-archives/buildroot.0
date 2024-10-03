Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06516CF34C3
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 21:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C050240338;
	Thu,  3 Oct 2024 21:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2J8xmA4ZQdk; Thu,  3 Oct 2024 21:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6225D40533
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6225D40533;
	Thu,  3 Oct 2024 21:27:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC4671BF34E
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 21:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BC6840121
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 21:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AADraEbHLJD for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 21:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B87654006A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87654006A
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B87654006A
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 21:27:23 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 2B59F240F77;
 Thu,  3 Oct 2024 23:27:21 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 00D0D240A25;
 Thu,  3 Oct 2024 23:27:20 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 755C82409EB;
 Thu,  3 Oct 2024 23:27:20 +0200 (CEST)
Message-ID: <eb678033-8011-4119-bd9a-5bfc282b5b80@mail.de>
Date: Thu, 3 Oct 2024 23:27:17 +0200
MIME-Version: 1.0
To: Niklas Cassel <Niklas.Cassel@wdc.com>
References: <20241003204515.403551-1-niklas.cassel@wdc.com>
 <20241003204515.403551-3-niklas.cassel@wdc.com>
 <b6f8a2cd-b2e6-4075-9e41-ef4344a40681@mail.de> <Zv8JwGcZCT8ghE-p@ryzen.lan>
Content-Language: en-US
In-Reply-To: <Zv8JwGcZCT8ghE-p@ryzen.lan>
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1163
X-purgate-ID: 154282::1727990840-FD4AA6E7-38FF5EBE/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1727990841;
 bh=vBj672TzpTDfx6SCbfaBeRCoZ1r7ilz+tRdOBXDg7U0=;
 h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
 b=46cnbtDIg4J2O8h1eU6nLkpq4/Yv5oUbjcLQ6gOuh+lY0VJM+f3AIRDTabg3NwIcy
 nKvhGrjmPK2CFzbKYuPMkBFibWC3psSHdolsLWVZtPaiD8hqQooZ6pZjq2GC1meqMF
 76ucbgThhi0AvEKOlUk7bbdEnolKtcIu8nYPcQMEp3612kXXBmzUY3rm/CJvgCgEd7
 8jPjW1zVsR5sBgtqE+rUKkBOb2mGF6KtnXZkj+B/HkvrfnY2WuifJdoo14EJ23LHoI
 Sv+g59J2ANyMN0zbbiJl+yQzDKVTsMEAxnHXZ0V8dVEeqL81TbwoHANpoMMmN1K+Yh
 pbCXCY6jSgxng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=46cnbtDI
Subject: Re: [Buildroot] [PATCH v2 2/4] configs/rock5b: update to uboot
 2024.07
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas,

>> I also successfully used uboot 2024.07 on the board to boot the mainline ATF
>> (which now also features the RK3588) instead of the rockchip-rkbin binary
>> blob:
>>
>> https://lists.buildroot.org/pipermail/buildroot/2024-September/764512.html
> 
> Yes, I saw that patch.
> 
> But it seemed that you both agreed to wait bumping ATF until there was a
> new ATF release.

Yes: We agreed to wait bumping ATF.

> I think we should bump uboot now, as it provides some significant
> improvements by having full bootflow support, and there was also
> some MMC driver patches for rk3588 in this new uboot version.
> 
> I don't see any reason to wait with bumping uboot because of ATF.
> ATF can be bumped independently once a new version has been released.

Yes, I agree. In my reply to your patch I never said or suggested, that 
we should wait bumping uboot due to ATF. I just put my "tested-by" under 
your patch, which bumps uboot ;) So again:

So at least for uboot 2024.07 in combination with the mainline ATF:

Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Thanks for your patch and best regards,
Kilian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
