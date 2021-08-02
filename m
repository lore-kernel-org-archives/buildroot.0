Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B114C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 16:37:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4868C61050
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 16:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4868C61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D6DB40542;
	Mon,  2 Aug 2021 16:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3eTstLeebJ2e; Mon,  2 Aug 2021 16:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FF7F40535;
	Mon,  2 Aug 2021 16:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56F831BF34B
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 16:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4675483CEB
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 16:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRP-JQo-LxK4 for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 16:37:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6A9E83CE6
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 16:37:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f475:5bfa:f4b3:5a3a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E84BD5FFA2;
 Mon,  2 Aug 2021 18:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627922228;
 bh=1GTJ8VFCZ1qvx48DHfBE8ZszN8zG03qShvSCXoTG85Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rA+YbR4pZSMoZcbf3iLJe7M11ZRLyKDcvjeFCREMYu/58Lk88GTOVBw51tTkij4jU
 h8RT4YF6OMQ0/4ftuGFhLWU3M+HeCSb0FFVrW+YlQPl5tM8jxMLrN5lv2L7ND68Rh3
 fAwB9R9IVddEqXZ268O0yCIlptgMCoeCIRr2LP7R0c7VJuGF/z4orvsI6JSs+0WcUd
 pbefAnczw8LjCHEoz7NBseo6+AXPWwfRzfYwUdRuxTtCeu8mxfQlq0drFOIHMXT+1N
 RiOVfZ5Xv1/l/KDNB3qm37AmRQr4ws9SNYTSI+r4NxqGm/WH3U+qvksCLO6l6+spco
 ill9bDSXYAc1A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Aug 2021 18:37:01 +0200
Date: Mon, 2 Aug 2021 18:37:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Eugen.Hristev@microchip.com
Message-ID: <20210802163701.GB27036@scaer>
References: <20210730103908.11270-1-eugen.hristev@microchip.com>
 <20210730234234.31bc6aa0@windsurf>
 <8bc0814b-6d8a-4e96-7d8c-b6d476f1a42f@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8bc0814b-6d8a-4e96-7d8c-b6d476f1a42f@microchip.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/at91bootstrap3: updated to released
 4.0.0 final version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Eugen, All,

On 2021-08-02 06:57 +0000, Eugen.Hristev@microchip.com spake thusly:
> On 7/31/21 12:42 AM, Thomas Petazzoni wrote:
> > On Fri, 30 Jul 2021 13:39:08 +0300
> > Eugen Hristev via buildroot <buildroot@busybox.net> wrote:
> >> Update to AT91Bootstrap 4.0.0 version.
> >> This package is now released under MIT license.
> >> -AT91BOOTSTRAP3_LICENSE = Atmel License
> >> +AT91BOOTSTRAP3_LICENSE = MIT
> > While this change is correct for at91bootstrap 4.x, I don't think it's
> > true for at91bootstrap 3.x, so I suppose this should instead be
> > conditional?
> The plan is to also switch at91bootstrap3 to the same license.
> So if you want, you can hold the patch until I update bootstrap3 as well.

The problem will remain for custom versions. Indeed, users can select
any arbitrary git tree and git commit, and for those, we have no way to
know whether they are from before or after the change in licensing
terms.

As such, we will still want to have a conditional block, like I proposed
as a reply to Thomas.

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
