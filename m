Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A0CEB64DD
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 18:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56E9383B42;
	Thu,  3 Aug 2023 18:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56E9383B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VgB9Zl6CNQPI; Thu,  3 Aug 2023 18:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 654BA83BE7;
	Thu,  3 Aug 2023 18:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 654BA83BE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F84F1BF425
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 18:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2898360DB7
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 18:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2898360DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOg-hBcQnGYN for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 18:51:22 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22FF060BBD
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 18:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22FF060BBD
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:220a:a3fc:7608:6165])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id EC8EB780377;
 Thu,  3 Aug 2023 20:51:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 03 Aug 2023 20:51:15 +0200
Date: Thu, 3 Aug 2023 20:51:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Afshin Pir <Afshin.Pir@gallagher.com>
Message-ID: <20230803185115.GK421096@scaer>
References: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <20230801121118.72610acf@windsurf>
 <SY2PR01MB2778DE94AA435DAE575AAFD7940BA@SY2PR01MB2778.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SY2PR01MB2778DE94AA435DAE575AAFD7940BA@SY2PR01MB2778.ausprd01.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691088679;
 bh=WN2JTgkawEzQMi3lbCXnPSovw07SqVHW4BwfMJoh1f8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LreJZaV+vQsav1rV8lgMzvUXy49EQAYvt1pgblksaVTRILKiuBnHy+kr8j8y6o9jC
 dZN405drpifUCibfUBkSbdK5CcIwcbMo3higX5G2mdbe/aYXXqZQTElXi+fqEiRYRo
 DvyyvjFi3EoXdUAWD+W99tET4xr8fjcg6hF2uadwq1hGytLNYNkJuzttd4zVvk9PFN
 VJk0t/vRAx1Tg2Xn7fBEWyUxwdBZvxiFozIW9g6ivOSEPmR+Gf2v65WCe+vpsP2g3Q
 hM2W8VwQ7MWaSXjtxWYEdCuK1NKlsalp7UD4UkVKLurxmeFyZpeDZIdB82yepcJ4ng
 Fg/s2O6hD2dwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LreJZaV+
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Afshin, All,

On 2023-08-02 22:30 +0000, Afshin Pir spake thusly:
> I wonder if you have found out the problem and is there any ETA for
> when it will be resolved?

There is no ETA yet, we are looking into the issue.

The main (and sole) purpose for s.b.o. is to provide a backup in case
some upstream tarballs disappear. As I understand it, you are looking
for the openssh archives, but those are still available upstream, and
they stillmatch the expected hashes, so there should be no reason for
it to be downloaded from s.b.o. Why are you so eager to have s.b.o.
up-to-date?

Besides, s.b.o. is a best effort, and there is no guarantee ever that
was expressed over its availability or reliability.

Regards,
Yann E. MORIN.

> Thanks a lot.
> 
> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, August 1, 2023 10:11 PM
> To: Afshin Pir <Afshin.Pir@gallagher.com>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] Update schedule of sources.buildroot.org
> 
> [You don't often get email from thomas.petazzoni@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hello Afshin,
> 
> On Tue, 1 Aug 2023 04:36:24 +0000
> Afshin Pir <Afshin.Pir@gallagher.com> wrote:
> 
> > I wonder when http://sources.buildroot.org is updated normally.
> > Because from what I see, it is normally updates pretty quickly when
> > packages are changed, but there has been no update for last 2 weeks
> > while some packages like openssh have been updated.
> 
> It is normally updated constantly. I see right now the script from Peter Korsgaard is running on the machine to do the update. But I indeed see in http://sources.buildroot.net/openssh/ that the latest openssh version is not there even though the bump was done quite some time ago. I'll try to see what's going on, though it's usually Peter that takes care of maintaining this part of the infrastructure, so I'm not super familiar with it.
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com
> ________________________________
>  This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
> ________________________________
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
