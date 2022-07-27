Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F068C19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE2540332;
	Wed, 27 Jul 2022 09:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE2540332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5stmd03W26ds; Wed, 27 Jul 2022 09:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D10C40308;
	Wed, 27 Jul 2022 09:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D10C40308
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4641BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17DD540494
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17DD540494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93j6gCNgEia5 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:35:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12A284028D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12A284028D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:35:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AF0A5B00729;
 Wed, 27 Jul 2022 11:35:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 11:35:41 +0200
Date: Wed, 27 Jul 2022 11:35:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220727093541.GE1085273@scaer>
References: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
 <20220726163951.2111731-4-thomas.petazzoni@bootlin.com>
 <20220727083020.GD1085273@scaer> <20220727112207.309f4ec4@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727112207.309f4ec4@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658914552;
 bh=X7dZWy0Z6L9TFh011xVC7c0xhcMvR4QDbkbfbTNg6Fg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MayrNbu8Joi59sCebPnMmoOAiubF2Gq4PUhwQPaZt+okOgo0dVAaXIkMSnw6BWf1I
 5Wcz12Ex81NU9MW/gypKGWWNrtcKcyrNINLwxvvJ3PK0IxMOIvSB0jiOnimStizhC5
 5nzTn7YkSeuvcWx3z7+HpvMro8LvJDMhs5RtcZUJG52f/q2y5Z6/8YGWN9SUfHFh4K
 0qGJzds7LkcVEZEGsD3yGW5uTjB5NKfgkBRj25RPcOcIdCvurNljkUcTscfmuPrSVt
 lnIc5ymNTOsbBftlKuPB7OOyZiX6DuRnX91ikoubLr6COLHgbQrsghKBKLXeIFASVa
 qgOU460NxsXow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MayrNbu8
Subject: Re: [Buildroot] [PATCH v2 4/4] arch: rework MMU option handling and
 move to "Target architecture" menu
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Mark Corbin <mark@dibsco.co.uk>,
 Jonathan Ben Avraham <yba@tkos.co.il>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-27 11:22 +0200, Thomas Petazzoni spake thusly:
> On Wed, 27 Jul 2022 10:30:20 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > I am not sure why you are removing a generic option in favour of two
> > arch-specific options that behave exactly the same.
> The motivation is explained in the commit log. Quoting it
> ================================================================
> However, if we simply move it in arch/Config.in, it means that we
> would have the following order of options:
> 
>  Target architecture
>  Target architecture variant
>  ABI
>  MMU
>  Binary format

Let me complete that for you, then:

   ... where variant and ABI are arch-specific, so we can't have a
    generic option in-between, because a kconfig option can be given a
    single prompt (even conditional ones), and appears in the menuconfig
    at the place it was given its prompt.

OK, got it now. Thanks!

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
