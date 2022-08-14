Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5395AC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 21:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9510403EA;
	Sun, 14 Aug 2022 21:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9510403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0BAypysgXnaf; Sun, 14 Aug 2022 21:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8640400E9;
	Sun, 14 Aug 2022 21:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8640400E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFA7E1BF282
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ADC0400E9
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ADC0400E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-IJ2HPDep9o for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 21:46:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67883400AC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67883400AC
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 21:46:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 316AD60128;
 Sun, 14 Aug 2022 23:46:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 23:46:32 +0200
Date: Sun, 14 Aug 2022 23:46:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220814214632.GQ2854108@scaer>
References: <2ba3394abf87c940fe036b2e18e1afc2a2d37ad0.1660320356.git.stefan@agner.ch>
 <20220813115137.GA2741326@scaer>
 <17a5ae06-dc0c-944b-8b86-591b3e9ca500@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17a5ae06-dc0c-944b-8b86-591b3e9ca500@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660513596;
 bh=mbhVnJAwWnYTplL+i7RJzVb1e/x1viq7MnZQlw8Zytg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uTalyGHNT8BPsATyqIcaM3E/qaSDK8CrhiL5gEHMNsUZ6ZehKkorfWihLfcbXMKzi
 R8iGZlm5blPetukGhMP55DZeOr+RoXiOxwroeQKHgUcAjSMOPCAHlMvXRdIGky5lRC
 8jHZJflCyThSnKeRTnOmHAr2lFmO9+AyUKJEEwpTgzyZ9ceo5sbjZ1YJd+12IlQ6ed
 URSGIh/52RUaFmzCS24AzRfwB2tmDFcDP2kl4R/81iBinHtHj8BgtGgeFFXlUm0roZ
 lNhZelgAg/jPClXar0dSL+/PRG9437dOZ18/ARDUzO0741M/Ofw4d6gbfz40948IhY
 hSsVs4pgr+NkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uTalyGHN
Subject: Re: [Buildroot] [PATCH] package/docker-engine: use kernel modules
 for extra network drivers
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
Cc: Stefan Agner <stefan@agner.ch>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Stefan, All,

On 2022-08-14 23:27 +0200, Arnout Vandecappelle spake thusly:
> On 13/08/2022 13:51, Yann E. MORIN wrote:
> >On 2022-08-12 18:07 +0200, Stefan Agner spake thusly:
> >>Docker network driver "overlay", "macvlan" and "ipvlan" are not used
> >>by default. Make them a module.
[--SNIP--]
>  Actually, if they're optional, I wouldn't configure them at all. Someone
> who doesn't need this feature may very well want to build a kernel that
> doesn't have them at all, even as modules. Or you may even build a kernel
> that doesn't have module support.
> 
>  We don't have a good way to make those options "suggested", other than
> mentioning them in the help text. But I do think that that's enough.

Agreed.

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
