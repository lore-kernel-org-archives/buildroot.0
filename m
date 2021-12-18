Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E119FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B4C9400AF;
	Sat, 18 Dec 2021 22:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j92aEf4e6aSg; Sat, 18 Dec 2021 22:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6B07400C1;
	Sat, 18 Dec 2021 22:50:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EBC41BF5AE
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C36E84E09
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMlDz_pA4eNT for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:49:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C27384E1E
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:49:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B6E865FF33;
 Sat, 18 Dec 2021 23:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639867784;
 bh=/X2SSICEuaDj1VKHEQ6o5H9gL8LH7jnOFiC8T1gwO1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XcISXpqlCSNWNILudXzwaG4ajzXtaunWBQqiT/qGU0kaR/YL0/Df2ZwtnO+9NSKJH
 d3mWL8jwMUg7sP6+lZm/C9ILoJwbTtS0M9lSBWbStjINk98LHw+QaKk/djgRokKXdw
 cfWteo6xO+zRPuObhdcFYzn1jUqoPZba7XkcJYK3HE5LKueeGRvSJkFHqO0SY5XAlS
 NphwiXFGnuIfQiMZpgc8Hb4PseFcHvIl8wBcZrliFL8bd79ZNjgr1EiaxLt3zZaoZG
 S+lBmtHUrV/9Fm5WBiOoomvBvY7jQdK3aahmvQwgkkodhRYjRKs7Ag8UnFgAttmeR2
 EHVskl644I5wQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 23:49:37 +0100
Date: Sat, 18 Dec 2021 23:49:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211218224937.GY2603@scaer>
References: <20211218223430.577974-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218223430.577974-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez-alsa: fix empty line
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
Cc: =?utf-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-18 23:34 +0100, Fabrice Fontaine spake thusly:
> Fix the following warning added by commit
> 3ba8e88e396f216ac8486580b8817aac92ae93b2:
> 
> package/bluez-alsa/bluez-alsa.mk:79: consecutive empty lines
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bluez-alsa/bluez-alsa.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
> index a1e550ab6c..f5e3aa1245 100644
> --- a/package/bluez-alsa/bluez-alsa.mk
> +++ b/package/bluez-alsa/bluez-alsa.mk
> @@ -76,5 +76,4 @@ else
>  BLUEZ_ALSA_CONF_OPTS += --without-libopenaptx --disable-aptx --disable-aptx-hd
>  endif
>  
> -
>  $(eval $(autotools-package))
> -- 
> 2.33.0
> 
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
