Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647F2C77B75
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A05194192B;
	Mon, 15 May 2023 19:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A05194192B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhVTcW_5OLmI; Mon, 15 May 2023 19:57:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 683704195C;
	Mon, 15 May 2023 19:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 683704195C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 414281BF4D6
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 19:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A1206145D
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 19:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A1206145D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxAT45-CG__Y for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 19:57:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE48961438
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE48961438
 for <buildroot@buildroot.org>; Mon, 15 May 2023 19:57:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a7a1:441c:4e0f:17e6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A8768780510;
 Mon, 15 May 2023 21:57:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 May 2023 21:57:31 +0200
Date: Mon, 15 May 2023 21:57:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230515195731.GM2582048@scaer>
References: <20230418213241.28635-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230418213241.28635-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684180655;
 bh=Pxzj8IjuzrIwu0PgoiQqk9BMIX9CXD49G5C425eYEHo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GbpH5Kd6BJOxt+9gSsCLLxMv32xZFZgrqihQi6ZofKKqkY0X+JwUuFn4RU3kf2j3y
 FCl4NrPU2SPfZ0P8ggiH4qwcKRRoYYKZ5chxxttuMhDn/+V+KouLUwILTczGtCUxN2
 /PDWwfBKBJ7P0KiR7X6YIRbHs2duZKsNv9blrmk+5gfpNi3+k4dRM9wop2AN789T8+
 tJ0VFGm+S2XUm22kQFHAjbS3PMgJSuadR9cBkdhUxa872VDflhISkJx23Eh9gq2x8+
 x/oFahnikVtnKaQeCBP0ENcMWzW43NP4SYVdxqNWPuC6G74Pl9xQPO14f89/n4LZ91
 p4ijYnY9kjBWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GbpH5Kd6
Subject: Re: [Buildroot] [RFC v1] package/python-babel: add purge locale
 data support
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-04-18 23:32 +0200, Peter Seiderer spake thusly:
> Add purge loacle data support (inspired by BR2_ENABLE_LOCALE_PURGE
> handling in Makefile) to reduce target space allocation by the
> python-babel package, e.g. from 32MB to 24K for
> target/usr/lib/python3.11/site-packages/babel/locale-data with
> BR2_ENABLE_LOCALE_WHITELIST="C en_US de_DE".
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/python-babel/python-babel.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
> index 890a8b02b9..ea383e9c05 100644
> --- a/package/python-babel/python-babel.mk
> +++ b/package/python-babel/python-babel.mk
> @@ -12,5 +12,17 @@ PYTHON_BABEL_LICENSE = BSD-3-Clause
>  PYTHON_BABEL_LICENSE_FILES = LICENSE
>  HOST_PYTHON_BABEL_DEPENDENCIES = host-python-pytz
>  
> +# purge locale data (if enabled), keep special en_US_POSIX data by default
> +ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> +define PYTHON_BABEL_CLEANUP_LOCALE
> +	for i in `ls $(TARGET_DIR)/usr/lib/python3.11/site-packages/babel/locale-data/*.dat`; \
> +	do \
> +		i_base=`basename "$$i" .dat`; \
> +		echo "$(BR2_ENABLE_LOCALE_WHITELIST) en_US_POSIX" | grep -qw "$$i_base" || rm "$$i"; \

Why do you force keeping the en_US_POSIX locale specifically?

If there is the need that at least one locale be present, then can we
keep a more generic one, like 'C', or 'POSIX', or whatever is not
specific to a country?

> +	done
> +endef
> +endif
> +PYTHON_BABEL_POST_INSTALL_TARGET_HOOKS += PYTHON_BABEL_CLEANUP_LOCALE

Like for the toolchain locale purge, it should be a target-fnalize hook;
    PYTHON_BABEL_TARGET_FINALIZE_HOOKS

(Note that the systemd locale purge is done as a ROOTFS_PRE_CMD_HOOKS,
but that is wrong, IMNSHO, and it too should have been a target finalize
hook.)

Regards,
Yann E. MORIN.

>  $(eval $(python-package))
>  $(eval $(host-python-package))
> -- 
> 2.40.0
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
