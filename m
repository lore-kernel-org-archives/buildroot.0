Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E397C4332F
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 20:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F11DD81777;
	Mon,  5 Dec 2022 20:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F11DD81777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3vytTwVdEsu; Mon,  5 Dec 2022 20:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 407DC815CA;
	Mon,  5 Dec 2022 20:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407DC815CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13D481BF2B3
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 20:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCF65815CA
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 20:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCF65815CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_WcSi-vn8y9 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 20:37:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04BAA81467
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04BAA81467
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 20:37:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3834:9ccb:80f2:4b42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 974E42003D0;
 Mon,  5 Dec 2022 21:37:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Dec 2022 21:37:36 +0100
Date: Mon, 5 Dec 2022 21:37:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Pesce Luca <Luca.Pesce@vimar.com>
Message-ID: <20221205203736.GH2855@scaer>
References: <AS8PR08MB6870E377EFDB1E28448EBF5581049@AS8PR08MB6870.eurprd08.prod.outlook.com>
 <1669815827-23415-1-git-send-email-luca.pesce@vimar.com>
 <20221201202558.GB978091@scaer>
 <AS8PR08MB6870CBA6B56FA36972D523AA81179@AS8PR08MB6870.eurprd08.prod.outlook.com>
 <20221202192938.GA3302@scaer>
 <AS8PR08MB6870B0AB64BA09B2EA3C73D081189@AS8PR08MB6870.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8PR08MB6870B0AB64BA09B2EA3C73D081189@AS8PR08MB6870.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670272660;
 bh=ooGM6qu2iN27kulpd5LrJsRB+EG85GVf5YqL+Y0C2Hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QfLznTQhoDq5mgkTtGH9FKjxS2aqD7/U66hHD/6vigQvKPfNEbBCpJwHsGZ3MAAku
 LuDzkol13waXThkT54C+P1aHN4Or2/80yqy1/7MMNxsXg2ph808kugsmptTkTzcbPj
 J8cfzg3She1bThANCketY9c+UhZq3w9zrDith+Ou6Z/wlozuooHEZ5JhcnKXPd1D5y
 BpAUYTC8E7ypxpr6i0/dtR+d7wNICDmWKEpcpPFm3Dwe++zr/YTArCLXkjuTi5VtZA
 lQZhQOVM+JZnntLSQxQRHepsAisZIVbpozFTyCTtmA/qBs2xPhOSp1TOCrgn42MOd8
 E7WnBRAA3AlHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QfLznTQh
Subject: Re: [Buildroot] R: R: [PATCH] support/download/dl-wrapper: make the
 whole dl_dir writeable for the group
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2022-12-05 12:36 +0000, Pesce Luca via buildroot spake thusly:
[--SNIP--]
> > Could you handle refining this change, test it, and when/if that works,
> > send it as a proper patch, please?
> Yes, will send something soon. Do I have to ack you in some way in the upcoming
> patch?

You can add me in Cc when sending the patch; usually, 'git send-email'
will do it for you automatically if you add just (without quotes) at the
end of your commit message: 
    Cc: someone <some-email>

Regards,
Yann E. MORIN.

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
