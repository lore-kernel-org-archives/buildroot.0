Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05011C77B72
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 19:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4412E81F28;
	Mon, 17 Apr 2023 19:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4412E81F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztCJrvazIFDk; Mon, 17 Apr 2023 19:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FD9E81F0C;
	Mon, 17 Apr 2023 19:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FD9E81F0C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1D6A1BF2CA
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89D2D41619
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D2D41619
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAYDgXxEr5tz for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 19:39:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E99AB41558
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E99AB41558
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 19:39:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id ACEF55FFB9;
 Mon, 17 Apr 2023 21:39:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Apr 2023 21:39:24 +0200
Date: Mon, 17 Apr 2023 21:39:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20230417193924.GM2819@scaer>
References: <20230417191447.2439214-1-pevik@seznam.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417191447.2439214-1-pevik@seznam.cz>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681760370;
 bh=Grkvggrok3/qOYYjHmXCRplBopJvez7hFvRTh82cx0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AA012Tl93bgCMhy6bDk673iofLWBN27SbMSYNDzhcKZNof65o6O/pKvcvpX2+EnrV
 KJ/eUSsNrw5xwr0Ct3BxZcqazcGayM+eDiJGwni7xonYcwJgxEAA60xGVJgaRAKZpt
 eM3rZVXKqNXWIPcPAUztTAIOAIGKdIF4mLM5Pyv1/0S4EFc8CbaQPv7BdcpV2T4oOG
 95jWRN7FcuoFaN8f6NO4BB45DjanllqDxvHxuu0uPPDQbwyh52F8Ax+dhvTExRJMFf
 sUngEkJg4LBCK8Y7LViYyYVogG21JtU47jpINt/T78w51Tb4n0oucbaBvN4OXG/jcH
 5CmeZVSDY6qQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AA012Tl9
Subject: Re: [Buildroot] [PATCH] package/ltp-testsuite: remove 5.11 headers
 requirement for musl
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Anders Roxell <anders.roxell@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petr, All,

On 2023-04-17 21:14 +0200, Petr Vorel spake thusly:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> 5e1c238b72 ("package/ltp-testsuite: require 5.11 headers for musl")
> added a 5.11 headers requirement for musl, which contains fix
> a85cbe6159ff ("uapi: move constants from <linux/kernel.h> to <linux/const.h>").
> 
> This effectively disables LTP on all musl based toolchains from
> toolchain-configs.csv:
> 
>       bootlin-armv7-musl [ 7/45]: SKIPPED
>     bootlin-riscv64-musl [19/45]: SKIPPED
>      bootlin-x86-64-musl [26/45]: SKIPPED
> br-i386-pentium-mmx-musl [31/45]: SKIPPED
> 
> But these toolchains are based on 4.9.255 kernel headers, which have
> backported fix as 834d8b96cd85 in 4.9.250 and LTP can be compiled with
> them. Because there is currently no way to specify also older stable
> releases with fix, it's better to remove this requirement. If people are
> really using unfixed kernels we can reintroduce the workaround which was
> removed in 5e1c238b72 or even ask upstream to carry it.

There is no way to know whether a toolchain with headers earlier than
5.11 wil have the fix or not, as we do not have dot-release information
for the headers version. E.g. 4.9 covers the whole range of kernel 4.9,
some with the fix, some without. The only kernel headers version we know
for sure has the fix, if kernel 5.11 and alter.

There are also toolchains with a lot of backported *features* (that's
especially true among chip-co provided toolchains), where some features
of later kernel headers are in fact present in older versions.

We can't have a lernel headers check that is more lax than the actual,
official, major kernel it was released in.

So, I still think that what we currently do is absolutely correct:
building ltp-testsuite requires kernel headers 5.11.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> I'm sorry for not checking the build properly. v1 and v2 of LTP update
> were without this because I did check them properly and saw that 5.11
> version requirement for musl was not needed (thanks to Thomas, who in
> the past after my asking for that had found a time and updated toolchains).

So yes, Bootlin is now provided updated toolchains, but it does not
prevent people from using previous ones without the fix, even with an
updated Buildroot.

It also does not prevent people from having built their own toolchains
in the past, with headers without the fix (or with it, we can't know),
and keeping using those toolchains, becasue they have qualified them in
their environment, and rebuilding those is just not possible.

So, NACK from me.

I'll leave it open for other maintainers to have a look, in case one has
another opinion and decides we want it.

Regards,
Yann E. MORIN.

> Kind regards,
> Petr
> 
>  package/ltp-testsuite/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
> index b42082e2cc..272c2ede37 100644
> --- a/package/ltp-testsuite/Config.in
> +++ b/package/ltp-testsuite/Config.in
> @@ -12,7 +12,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
>  	bool "ltp-testsuite"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	depends on !BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
>  	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
>  	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
> -- 
> 2.40.0
> 

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
