Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00231C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70590401B9;
	Wed,  9 Feb 2022 21:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8U_Zsc4TKdJA; Wed,  9 Feb 2022 21:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A89C040183;
	Wed,  9 Feb 2022 21:33:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A08521BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99BE340183
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rq_Ef1cOV_qO for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEBE640149
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d4bd:3395:fce0:5749])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2C1267802BE;
 Wed,  9 Feb 2022 22:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644442395;
 bh=SdhvnPKQQDaHn3bHFSsTkFSpwVqNvXov61lyUP/8+BM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qLMNF00ql6bxGsACVzR5uRG6jHlbdLvAX3vAmGHJvcOxROj9Gu/FkhoXOHJ8MX2Gs
 qhN8jtzaObuQJn9UIeqZg1KSHMh2IdvT4asHHwR9ZM/27tLXpUx+bYqpRgySIW4PzR
 NHOTtPBsDgYfNE3beKhF1R4Fx+1etEtyMBcmXnjeaLu49Yoajlt4YrroDIopj3qHJi
 4MbpTWPpemIQhrIvPnRlwPmTOb9tjh2O58zGSxovBgHALk+YIaEuF3E/dIJs7uj/Ye
 3bZ6sQEEK3xNMCIG9I7VOrJjy9VwcjiZ/RHPKQ4vxp1DodO6e+BaeSJXhZOa7IoKIk
 7xKiE+pWl0G6A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 22:33:12 +0100
Date: Wed, 9 Feb 2022 22:33:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220209213312.GE2249818@scaer>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 000/107] Drop python 2.7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter ,All,

On 2022-02-09 17:50 +0100, Peter Korsgaard spake thusly:
> Python 2.7 is EOL since April 2020 and almost all packages support
> python 3, so drop it before the 2022.02 release.
> 
> It is a big series, but the changes are mainly mechanical in nature.
> 
> There is still some cleanup to do, E.G. the python2 support in
> pkg-python and the host python-setuptools package - But this is IMHO
> the minimum changes before -rc1.
> 
> Peter Korsgaard (107):
...
>   package/python: drop target package
...
>   package/python: drop host package
...
>   docs/manual: drop python2 references

All 107 patches applied, thanks!

I'll reply further to two of them, with ultra-minor nits.

Pfew, 21st century, here we come at last! ;-)

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
