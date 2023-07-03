Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71221C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BB2281769;
	Mon,  3 Jul 2023 19:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BB2281769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gixFtjFcURcH; Mon,  3 Jul 2023 19:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C75C8139A;
	Mon,  3 Jul 2023 19:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C75C8139A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DEDA1BF951
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06E0E81351
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E0E81351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTLj0NoSKyVX for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:54:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8CF381D3A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8CF381D3A
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:54:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d686:7886:a85d:fb8a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1837A200594;
 Mon,  3 Jul 2023 21:54:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jul 2023 21:54:00 +0200
Date: Mon, 3 Jul 2023 21:54:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703195400.GI2510@scaer>
References: <20230702123319.3012714-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702123319.3012714-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688414044;
 bh=ZgEa9lC9h7hPESLmxe1v33HkUT4zG2pi9EGCnh7M7w4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1aQSMSR8fHGqUZrq3WhJQT6WA7Y9t5dSphc4EcSH3tad3BR02Kxw2rf1G6pj3QqW
 GuFfESFPEKfS/Z9ch4p89j8/UzehI34Lrrn0vhI2HaWsnyIcKygvjM2Yj2nkiCcZvS
 A+9OSmHmC6wwme1mdIGn5fxeDqhy83xecYKlOLVbGBqpqy5q2HcdRjePgOC7HUaXBF
 E4nFvP4EZMSCyzSgnKrCf1Meq6tgXXrmN6Sc42dhQI62ljwxXey0+ZUYn9+e61F+il
 /CeA8FENhOjtn1X3UZciHbj062DZ+aMUYG9Gy0ZW9G3OxomQXuGDFG/YjnOqj9TMtt
 eEZLZ2ZIDu4xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X1aQSMSR
Subject: Re: [Buildroot] [PATCH 1/1] package/mpir: force arm mode instead of
 Thumb mode
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
Cc: Semyon Kolganov <semenak94@mail.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-07-02 14:33 +0200, Bernd Kuhls spake thusly:
> Fix the following build failure:
> /tmp/ccuwJnnt.s:124: Error: selected processor does not support `umull ip,r6,r2,r1' in Thumb mode
> /tmp/ccuwJnnt.s:159: Error: selected processor does not support `umull ip,r0,r7,r1' in Thumb mode
> 
> Fixes:
> http://autobuild.buildroot.net/results/610/61094bc7b7eb1d1e49bf8fcd1864b5cd3d7c4499/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mpir/mpir.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
> index 91f704d30c..5dbd760aa1 100644
> --- a/package/mpir/mpir.mk
> +++ b/package/mpir/mpir.mk
> @@ -36,4 +36,8 @@ ifeq ($(BR2_powerpc64le),y)
>  MPIR_CONF_ENV += MPN_PATH="generic"
>  endif
>  
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +MPIR_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.39.2
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
