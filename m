Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34628C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 22:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E10409DB;
	Sat, 14 May 2022 22:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0ieIauz4gN0; Sat, 14 May 2022 22:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D0B240888;
	Sat, 14 May 2022 22:05:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADC8B1BF5F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A7EA828DD
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEYQtC5GinnV for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 22:05:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCF5D828F8
 for <buildroot@buildroot.org>; Sat, 14 May 2022 22:05:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1949:2e37:e3d5:26d2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 966755FF20;
 Sun, 15 May 2022 00:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652565900;
 bh=RhFdF12ulymokDoGD2cyAPhGZLT/YTBMGjjLG7JgiCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VOBN+8wUO0gwbtZPIPoOhzhqbwgwZQY6PfCOCJ6mLCmr9TOQ8NJsyhVfen6dQyucZ
 KYCI9x8H2HHKVntR69jbxSyd8MO6KVUWU+Pi5YFn+WSJWDyu+NfoKuxThbh+6rpVFn
 J2OA7/DYAz7UT1Te1At/wz64mUthQuhuTaF7W5cQ5q+4l0/FSNDoIWn7WnfvM6BRfK
 LvTPBfOO8dlcp/2a5w8wZJtwze5fFqJmHbyR139OySNwOQnv956epqCWTTlYPzl0hi
 MYs7QL36XQ+R8q1LL25+ugQUxz7IZyhSVw9ZI0LXIqUzcYxuIGbYVod1eyhUOwSruJ
 S0IiMQML6y6Pg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 May 2022 00:04:57 +0200
Date: Sun, 15 May 2022 00:04:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220514220457.GF1597494@scaer>
References: <20220514195711.169277-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220514195711.169277-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/python-avro: don't refer to avro-c
 version variable
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-05-14 21:57 +0200, Romain Naour spake thusly:
> Like for other packages sharing the same version number, we
> can't rely on Make variable expansion. It's working by chance
> since avro-c is sorted before python-avro by the Buildroot
> main Makefile [1].
> 
> [1] https://git.buildroot.net/buildroot/tree/Makefile?h=2022.02.1#n533
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>  package/avro-c/avro-c.mk           | 1 +
>  package/python-avro/python-avro.mk | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
> index 262a0fee5f..f55c579656 100644
> --- a/package/avro-c/avro-c.mk
> +++ b/package/avro-c/avro-c.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# When updating the version, please also update python-avro
>  AVRO_C_VERSION = 1.11.0
>  AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
>  AVRO_C_LICENSE = Apache-2.0
> diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
> index 0c4c431777..973107979c 100644
> --- a/package/python-avro/python-avro.mk
> +++ b/package/python-avro/python-avro.mk
> @@ -4,7 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_AVRO_VERSION = $(AVRO_C_VERSION)
> +# Not possible to directly refer to avro-c variables, because of
> +# first/second expansion trickery...

In fact, this is not really a problem with first/secod expansion like I
thought initially.

So, first, the current code does work, because avro-c is parsed before
python-avro, so AVRO_C_VERSION *is* defined by the moment we call
$(eval $(python-package)) in pyhon-avro.mk.

And this is what is important: the _VERSION must be known by the time a
*-package infra is called, becasue _VERSION is used to generate Makefile
code, in the form of rules that boils down to:

    $(pkgname-$($(pkgname)_VERSION): some-stamp-file
        some commands to run

So, if _VERSION is defined after *-package is caleed, that breaks; if it
is defined before, that works.

However, this is still fragile, and we try to avoid it. For example,
mesa3d and mesa3d-headers duplicate the version string. That's because
$(wildcard package/*/*.mk) would sort them in the inverse order we'd
want::

    package/mesa3d-headers/mesa3d-headers.mk
    package/mesa3d/mesa3d.mk

So, mesa3d-headers can't use mesa3d version string (note the other way
around would work).

So, I changed that comment to also point to avro-c when updating the
version (and as I forgot to commit, I had to push a follow-up patch).

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +PYTHON_AVRO_VERSION = 1.11.0
>  PYTHON_AVRO_SITE = \
>  	https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py
>  PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
> -- 
> 2.35.3
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
