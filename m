Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E365CF34C3
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 21:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E0B140338;
	Thu,  3 Oct 2024 21:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hU9PzG-1rSaR; Thu,  3 Oct 2024 21:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B00C740533
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B00C740533;
	Thu,  3 Oct 2024 21:31:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9CD01BF34E
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7BC440543
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 21:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wonTL-pOPWCa for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 21:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB26C4053F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB26C4053F
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB26C4053F
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 21:31:34 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 55D1F240F9E;
 Thu,  3 Oct 2024 23:31:33 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 2F96E240A25;
 Thu,  3 Oct 2024 23:31:33 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 91530240A43;
 Thu,  3 Oct 2024 23:31:32 +0200 (CEST)
Message-ID: <d216fd1b-b106-45df-9f89-9ba0701079cf@mail.de>
Date: Thu, 3 Oct 2024 23:31:29 +0200
MIME-Version: 1.0
To: Niklas Cassel <Niklas.Cassel@wdc.com>
References: <20241003204515.403551-1-niklas.cassel@wdc.com>
 <20241003204515.403551-2-niklas.cassel@wdc.com>
 <76588525-e39c-4bd7-9311-bb3bc412cbae@mail.de> <Zv8KEm0yWWtNv8T-@ryzen.lan>
Content-Language: en-US
In-Reply-To: <Zv8KEm0yWWtNv8T-@ryzen.lan>
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 571
X-purgate-ID: 154282::1727991093-14CAB6E7-2610A86F/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1727991093;
 bh=kcua5FHoFKx4sJ2oR9xJ+zIYYBRF0msj1SGYOjl4CdE=;
 h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
 b=xP104tX7gGrPJ40t9LiWyCZ96A8gINbSacYLKCzqBJz7MYPLG+CtHFYy6lxqsLGPV
 4lLPY8cpqcbRF4rEJnaAp8Vlx/fJF6xDvIRaFVvrrOHnkuFIKxVJlUlnvshv+xaTkh
 777hSm0mZ1QxRj/Osl14hjO1/l/zZGXxefm+mK73hshCt/DrV3WeBp0MR6bBInxh2N
 hqLhtXeAEVaqbizAVyIra0q+qG99EcFXtwEfUBwtfs8yrowlk2TMlrmYxNWzM59Uly
 6JRrstn2YNpAssYY2rNl6mM5ct+i7UqAuyB7WJPi9ymijJ0y9A0H5KOiNS9uHBnfh4
 8/mfQyS9Ki9Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=xP104tX7
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas

[--SNIP--]
>> So maybe wait a bit and then directly bump to 6.11?
> 
> I don't have any strong opinion on this one.
> 
> We either pick up this patch now, and bump it again once 6.11 support has
> been merged in buildroot
> or
> we simply drop this patch and wait for you or someone else to send a bump
> once 6.11 support has been added.
> 
> Either is fine with me. I just thought that the current version (6.7 was
> a bit old). I'm happy with whatever Thomas decides.

Yes, this probably makes sense!

Thanks and best regards,
Kilian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
