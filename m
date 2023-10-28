Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD1CC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 22:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F1C5401D8;
	Sat, 28 Oct 2023 22:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F1C5401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6457bEQjdSaF; Sat, 28 Oct 2023 22:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F038B4180F;
	Sat, 28 Oct 2023 22:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F038B4180F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBE1B1BF2B0
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 22:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D61E61419
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 22:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D61E61419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6-TIBClICnG for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 22:35:10 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 822496140D
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 22:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 822496140D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id AB5A12003AE;
 Sun, 29 Oct 2023 00:35:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 00:35:03 +0200
Date: Sun, 29 Oct 2023 00:35:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Oleg Lyovin <ovlevin@salutedevices.com>
Message-ID: <20231028223503.GF687180@scaer>
References: <20231027155221.977752-1-ovlevin@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027155221.977752-1-ovlevin@salutedevices.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698532508;
 bh=9hAGM6lkAk7YH+/EooHTHPmV4XVGJ0Tql+Ppgw2ETKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g7Fh5oWFZ31pFgeqyDyzd68dsgI8Qphh9on1CwdgcQ775/H10pjwOMndzxtzNKUad
 9p0bYYrWm6hyTjpJL+UO6HTBpaOd9IS3SxY4X9OJbvcQqzeb5VENHwtZXpoLE47Dwk
 XemBDy43pnFAV+KYGwN/d3YO7x5LMt0cKLyxvrx63E9Qf9nKrAb7TU1sXp3+OoCSz9
 +tlFJKXh5afaF57ksdb7gTcdLIHk6dA5zdifYAyguLexZ07BVjJUQH+aLyeWKOYcf9
 QmkX0bBiq1N7i7Pgrw0ySRp3XOfAgk2svAfMr8RN5ZcPgsyyT6NmaTFUOoCbO8S2Sa
 nnECETsjagV/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g7Fh5oWF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: fix
 package build with gcc 4.8
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
Cc: olegartys@gmail.com, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Oleg, All,

On 2023-10-27 18:52 +0300, Oleg Lyovin via buildroot spake thusly:
> python-pycryptodomex uses C99 features like variable
> declaration in for-loop statement, while old compilers
> assumes C89 by default.
> 
> This patch explicitly specifies C99 standard.
> 
> Change-Id: I934211714307cea43541167fbc72ff30fb66ad5f
> Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>
> ---
>  package/python-pycryptodomex/python-pycryptodomex.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
> index 3790aa4787..ee8ce6e069 100644
> --- a/package/python-pycryptodomex/python-pycryptodomex.mk
> +++ b/package/python-pycryptodomex/python-pycryptodomex.mk
> @@ -13,5 +13,11 @@ PYTHON_PYCRYPTODOMEX_LICENSE = \
>  	Public Domain (pycrypto original code)
>  PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
>  
> +PYTHON_PYCRYPTODOMEX_CFLAGS = -std=c99
> +
> +PYTHON_PYCRYPTODOMEX_ENV = \
> +	CFLAGS="$(PYTHON_PYCRYPTODOMEX_CFLAGS)"
> +HOST_PYTHON_PYCRYPTODOMEX_ENV = $(PYTHON_PYCRYPTODOMEX_ENV)

It is weird to use the target settings for the host settings, even if
they appear to be identical. Instead, we prefer duplicating the
assignment; indeed if the target variable gains target-related settings
in the future, they would inadvertently leak into the host variant.

The second issue is that (AFAIU) passing CFLAGS in the environment will
override the other CFLAGS we set in our infrastructure, and we instead
must complement them, see for example how it's done in python-brotli.

So, I've done that, and... the target settings leaked into the host
variable...

So, I've fixed that so that the host and target variant are based of the
TARGET/HOST_CFLAGS, plus -std=c99

Applied to master with the above fix, thanks.

Regards,
Yann E. MORIN.

>  $(eval $(python-package))
>  $(eval $(host-python-package))
> -- 
> 2.42.0.270.gbcb6cae296
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
