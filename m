Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAE7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 15:34:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97BBA610C7
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 15:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97BBA610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65ADC81046;
	Mon, 18 Oct 2021 15:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JMbWXtg3gGN; Mon, 18 Oct 2021 15:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95F6880AB6;
	Mon, 18 Oct 2021 15:34:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 810971BF317
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 15:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 706A683B92
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 15:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QdqpfplQyHe for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 15:34:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC2B282F11
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 15:34:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87d:8477:c454:3318])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9973D2003D3;
 Mon, 18 Oct 2021 17:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634571240;
 bh=MBYigWIcHdMQ3jeM0xlCYuo466A4qAyrJFU6hVpHi30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KyJl4yGRaWb0vP1z2NeoliXQQ/2NyJeDGBgXDO3Eq5tSEbZRLNUATqgAtcrVs/O/J
 TiabmtCi5acBZkNbNHZPzc/HhQ/YurfGmGcd2ZKL5w5eC+cGGYmeuom6nDQw2JD4zd
 FP0jOAiBOvBA9SBO8a7RYKplZRl21v7XJjUe9j3WvT6Vw9eXnz+SL+LHFeEGZWPoIj
 2vUUuUXNyedG5eSs0iUIaIPaC55w/beNcxzazPbFHm5D+72cuF7pWY/OYTFqZtiwDo
 XITPmya48fFrs+sO0dDmENe63YSSJPzir/nSOWIQaVUul8Eyx0j5qDyl4456bjQdFX
 x9zfrASwv0LWg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Oct 2021 17:33:54 +0200
Date: Mon, 18 Oct 2021 17:33:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Weber,
 Matthew L                            Collins" <Matthew.Weber@collins.com>
Message-ID: <20211018153354.GS2400@scaer>
References: <20211015215003.181073-1-paul@crapouillou.net>
 <20211016080238.GD4165837@scaer>
 <SN5P110MB048022947C6AD67D5341B4A6F2BC9@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN5P110MB048022947C6AD67D5341B4A6F2BC9@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [External] Re: [PATCH] package/lightning: stop spam!
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Matthew, All,

On 2021-10-18 13:21 +0000, Weber, Matthew L                            Collins spake thusly:
> > From: Yann E. MORIN <yann.morin.1998@free.fr>
> > Matt: is there a process to update the NIST CPE DB? Can we add that in the
> > manual, even just as an URL?
> Thomas and I had started this elinux page covering adding/updating a CVE or CPE.
> https://www.elinux.org/Buildroot:Security_Vulnerability_Management

Ah, great! :-)

> So in this case, I think we need to submit an entry for the GNU
> lightning package (cpe:2.3:a:gnu:lightning:2.1.3:*:*:*:*:*:*:*) as
> there isn't a CPE. [...] I've emailed the XML [1] to NIST to make
> this update.

So if I follow correctly, GNU lightning did not exist in the NIST CPE.
I tried to look for it yesterday, and it turned up mothing.

But now, in addition to the one version you submitted (as per your XML,
below), there are a bunch of results, from version 1.0 up to and
including 2.1.3:

    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:lightning

They were all added on 2021-10-18, so am I wrong in understanding that
your submission triggered some (automated/manual) scanning of the
upstream repo to generate all those entries?

> Once that's added, then this .mk can set "LIGHTNING_CPE_ID_VENDOR =
> gnu" so the CVE filter is clear for this package (right now it is
> free txt based and that's why you've picked up the server CVE).

Patch pending to be sent; pkg-stats still reports "CPE version unknown
in CPE database", although the website does include 2.1.3...

Thanks ! :-)

Regards,
Yann E. MORIN.

> Regards,
> Matt
> 
> 
> 
> [1]
> <?xml version="1.0" encoding="utf-8"?>
> <cpe-list xmlns="http://cpe.mitre.org/dictionary/2.0" xmlns:config="http://scap.nist.gov/schema/configuration/0.1" xmlns:cpe-23="http://scap.nist.gov/schema/cpe-extension/2.3" xmlns:meta="http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2" xmlns:ns6="http://scap.nist.gov/schema/scap-core/0.1" xmlns:scap-core="http://scap.nist.gov/schema/scap-core/0.3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://scap.nist.gov/schema/cpe-extension/2.3 https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary-extension_2.3.xsd http://cpe.mitre.org/dictionary/2.0 https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary_2.3.xsd http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2 https://scap.nist.gov/schema/cpe/2.1/cpe-dictionary-metadata_0.2.xsd http://scap.nist.gov/schema/scap-core/0.3 https://scap.nist.gov/schema/nvd/scap-core_0.3.xsd http://scap.nist.gov/schema/configuration/0.1 https://scap.nist.gov/schema/nvd/configuration_0.1.xsd http://scap.nist.gov/schema/scap
 -core/0.1 https://scap.nist.gov/schema/nvd/scap-core_0.1.xsd">
>         <cpe-item name="cpe:/a:gnu:lightning:2.1.3">
>                 <title xml:lang="en-US">GNU Lightning Project 2.1.3</title>
>                 <references>
>                         <reference href="http://git.savannah.gnu.org/cgit/lightning.git">VERSION</reference>
>                         <reference href="https://www.gnu.org/software/lightning/">PRODUCT</reference>
>                 </references>
>                 <cpe-23:cpe23-item name="cpe:2.3:a:gnu:lightning:2.1.3:*:*:*:*:*:*:*"/>
>         </cpe-item>
> </cpe-list>

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
