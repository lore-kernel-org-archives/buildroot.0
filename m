Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F181E77343
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 22:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B9242E1E;
	Fri, 29 Sep 2023 22:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16B9242E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBF21xCP1Gsx; Fri, 29 Sep 2023 22:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4268A42E50;
	Fri, 29 Sep 2023 22:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4268A42E50
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3AC1BF2CE
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5D4983D1B
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5D4983D1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kr04TwQH1E01 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 22:22:28 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1FFE83D1A
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 22:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1FFE83D1A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:c206:30b2:dda3:cc72])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 838A119F553;
 Sat, 30 Sep 2023 00:22:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 00:22:16 +0200
Date: Sat, 30 Sep 2023 00:22:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230929222216.GA2661@scaer>
References: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
 <20230919204252.2272594-7-adam.duskett@amarulasolutions.com>
 <20230923083500.GA1469982@scaer> <20230926192336.GT1469982@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230926192336.GT1469982@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696026144;
 bh=aQM0cmq/hjIRKw+5OcbQi5NXPc64V6kLQ25aPAWKLoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rVwo9J9OKEqjxojVjsgQp2UQjFM5u5IllUb8XapA0wUWQh+gneYhmfAAyM/X84N9K
 zxxXnBHxiHA5VbsDZgy9o10KNTkD2+y2+X2HNYL4dfoCgvitDVptpLt0opUNUA+/Dn
 L/IN2HR6b7bjVojn9FfHerhxuIzimY4HXgLuu/Dp6RtZgiz8g7Gu5my5GonrsQ25e1
 LlT3BPPJ4PxCBLsJrys5b7lWHpNk8Qoq+ewipb8MvZXvXyEANsrjbGlmCGXAkkH3eD
 di7r3DjEd2RlkvfCGF8n8bVj05dg/hg6x7oM8R70HpJJmyOawKNB1Z5XxtUgKGa3ni
 9pFXD6oziT67g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rVwo9J9O
Subject: Re: [Buildroot] [PATCH v9 7/7]
 support/testing/tests/package/test_flutter.py: new runtime test
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All

On 2023-09-26 21:23 +0200, Yann E. MORIN spake thusly:
> On 2023-09-23 10:35 +0200, Yann E. MORIN spake thusly:
> > On 2023-09-19 14:42 -0600, Adam Duskett spake thusly:
> > > This is a simple test that builds and runs the futter-gallery application and
> > > checks if the service is active.

So, we've discussed this tonight, and we decided to just apply the
series as I had reworked it, including the flutter-pi patch, that I've
submitted upstream:
    https://github.com/ardera/flutter-pi/pull/367

It would still be nice if you could follow-up on that and check that it
does not break in your use-case (or whether you have a better solution).

Thank you a lot for working on this, we just now need more flutter-based
applications! :-)

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
