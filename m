Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3889AC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 16:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E132A401E1;
	Tue, 28 Nov 2023 16:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E132A401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxa1zoQ98rzp; Tue, 28 Nov 2023 16:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C94DF40214;
	Tue, 28 Nov 2023 16:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C94DF40214
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46C7E1BF3F9
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 16:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2098C81E95
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 16:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2098C81E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjFegj06mcBz for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 16:12:39 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F0E481E98
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 16:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F0E481E98
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:c5a3:8084:a241:9d13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0FA2513F92C;
 Tue, 28 Nov 2023 17:12:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Nov 2023 17:12:34 +0100
Date: Tue, 28 Nov 2023 17:12:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231128161234.GG3177259@scaer>
References: <20231127212822.1060094-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127212822.1060094-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701187957;
 bh=CF0wxfdk1B0QosJL5/sMSXzb0RNF34u4poS7uqEdvec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rc0Nyh1sWFBy+fZTWdsbQF+Lh7oPC/pNkLr1AiAT6X+Eg89MD6OlvBS534+V68n+R
 ZM4h74CjTQFuJRxWyfgE1z89H+sPb8Gb25uMFCgohCUVxy5aOpKXLgDv3L/QJaYKWA
 gmmhVmZOrJBoqsu46iMGjVmAeu7qAhHULq/fPcYixBYy7RDpbpBnnu7suMKbq/txMA
 LJB1QOhO4RaWDMnkN0oR9jHemQElRAb56wuFDh6asHaXwYVaIHbHxKoV98oKHrC2RD
 i2U0gBhHfxjtY7u2DqKt1Jk3M00x7n5bh42sCgkUordeANRjhTIoNUyc7jhw8UdiUV
 JCwi8yRm5SEXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rc0Nyh1s
Subject: Re: [Buildroot] [PATCH 1/1] package/janet: needs MMU
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

Fabrice, All

On 2023-11-27 22:28 +0100, Fabrice Fontaine spake thusly:
> janet unconditionally uses fork since version 1.32.0 and
> https://github.com/janet-lang/janet/commit/4b8c1ac2d2d5c13d7c8592fd6d94b34a6a8b3549
> resulting in the following build failure since bump to version 1.32.1 in
> commit c87abf01a9153a2b2fe6c046fa83c86db92d79a7:
> 
> janet.c:(.text+0x19bbc): undefined reference to `fork'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f0771fc6c9905d3a6d60ce245df585b3c6096f7f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/janet/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/janet/Config.in b/package/janet/Config.in
> index 7b78c14bf4..bb4bf462aa 100644
> --- a/package/janet/Config.in
> +++ b/package/janet/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_JANET
>  	bool "janet"
> +	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
>  	help
>  	  Janet is a functional and imperative programming language.
> @@ -11,4 +12,5 @@ config BR2_PACKAGE_JANET
>  	  https://janet-lang.org/
>  
>  comment "janet needs a toolchain w/ gcc >= 4.9"
> +	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> -- 
> 2.42.0
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
