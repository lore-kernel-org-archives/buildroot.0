Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A20FC77B7A
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 06:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2CA483F17;
	Wed, 24 May 2023 06:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2CA483F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gIM0GJQJMya; Wed, 24 May 2023 06:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 078E783D35;
	Wed, 24 May 2023 06:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 078E783D35
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7A911BF377
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 06:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0D1083D35
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 06:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0D1083D35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sciwL07MfNye for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 06:10:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 829FC83CE0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 829FC83CE0
 for <buildroot@buildroot.org>; Wed, 24 May 2023 06:10:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:1b02:4e3:83be:ab2e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id EAF5A19F5C3;
 Wed, 24 May 2023 08:10:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 24 May 2023 08:10:00 +0200
Date: Wed, 24 May 2023 08:10:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Pesce Luca <Luca.Pesce@vimar.com>
Message-ID: <20230524061000.GA1014074@scaer>
References: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
 <20230521170834.GA621937@scaer>
 <AS8PR08MB68702A3AC3BC40C1DDF695FE81439@AS8PR08MB6870.eurprd08.prod.outlook.com>
 <20230523162749.GI621937@scaer>
 <AS8PR08MB6870B939A5DA48452F35198381419@AS8PR08MB6870.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8PR08MB6870B939A5DA48452F35198381419@AS8PR08MB6870.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684908603;
 bh=08fyBj2gYkThieYi0XOyJdNofkIl1ScwKGeAbZqq5pg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ANky4hoDCyfT7XxBbV4FcaSX74gkruE6ZzF4XYxx4BUN9Wr1Bjvu1ZAuqh/e9FcC1
 mS1SSdAvAIrqDPyUL5vCj/jGdC/KKAdlGqDW3xvDGoDK3yvHoXOtcI0jh5J3jOUuKp
 +eKeeo4GYJ/tfVhdWg0glnlRbORIGcNClIOLRz6s8iEPF2Xp8oDwm6kJ5DGie7NbSO
 G8L2koHLMtgDur5jVEOURekxHLkD9wMo8ZMYfphLC7isMC7BLQ4KB9jwHVkt65Lodl
 adQnFTUERw00lp5kkBLhvjIZQlAhELpV50pBfEqiUlcQVZhtJHOL95ahs6NRdYDj7/
 XXsUfVbfoTq0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ANky4hoD
Subject: Re: [Buildroot] R: R: [PATCH 1/1] package/libwebsockets: added
 option to (re-)enable external poll loop support
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

On 2023-05-24 06:00 +0000, Pesce Luca via buildroot spake thusly:
> > Will you submit an updated patch (default to y, and select from
> > mosquitto) ?
> Yes. Would you prefer a single patch dealing with both libwebsockets
> and mosquitto, or rather a serie with two patches, one for libwebsockets
> and the other for mosquitto? The latter sounds more correct to me, but
> I can do either way.

I think it would be better with two patches, please.

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
