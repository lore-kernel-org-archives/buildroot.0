Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F324C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 17:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE7E980BCD;
	Sat, 31 Dec 2022 17:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE7E980BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFEQQmHndmOR; Sat, 31 Dec 2022 17:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1405F80BC1;
	Sat, 31 Dec 2022 17:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1405F80BC1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DAF21BF33F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 494B3403A9
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 494B3403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5gNdU9wa3er for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 17:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4731F40190
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4731F40190
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 17:43:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:37e6:2c2e:a294:8f1b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2634613F87F;
 Sat, 31 Dec 2022 18:43:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Dec 2022 18:43:39 +0100
Date: Sat, 31 Dec 2022 18:43:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221231174339.GT2498764@scaer>
References: <20220918212144.427007-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918212144.427007-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672508622;
 bh=3XrLNj/RqQZe+Nnrp1wfRhwfaJVqeVcoE26xccwyCUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zn9Sm5GCTX1YpIom4FPdio1f0BX062CRBr5a4unTnjTjbEc/nS8yGukLxc/3CWZjk
 5EPYSz6Io5Hh4y45RTSNFfWW6HKlMJ6dCH6znzeJdIJNjbP2vGZAnhQAjaer0A8a1E
 pVAJXz8C8aJwre91+JL0br9MxqNIHL0itMhaqgArnIUQToSmMcWcEqRRScimMUlasD
 OiKk0udo+gsmhfc2GtvRsDskn+b3/ydLpiKlpKZbcXREz058yMdMddYd/MGq0pPJSS
 KDBkHLQf41Fs6Ns6jR+ABxSDZsiqFTbWUtzBBQ9YOivoJfFG76oY3kY3KJSe6FeQ0K
 IRUGeBqihMc8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zn9Sm5GC
Subject: Re: [Buildroot] [PATCH 1/1] security hardening: add support for
 glibc _FORTIFY_SOURCE=3
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

Julien, All,

On 2022-09-18 23:21 +0200, Julien Olivain spake thusly:
> A new _FORTIFY_SOURCE=3 level was introduced in glibc, in commit:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=c43c5796121bc5bcc0867f02e5536874aa8196c1
> 
> This commit was first included glibc 2.33. At that time, it was only
> supported by llvm/clang 9, and not by any released gcc version.
> 
> To support _FORTIFY_SOURCE=3, the needed gcc features were introduced
> in version 12. The gcc 12 support was added in glibc commit:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=86bf0feb0e3ec8e37872f72499d6ae33406561d7
> This commit was first included in glibc 2.35.
> 
> Buildroot updated to glibc 2.35 in commit:
> https://git.buildroot.org/buildroot/commit/?id=68d0aede597d32816c5b2ff32de0ce33cc14eb93
> 
> Buildroot introduced gcc 12 support in commit:
> https://git.buildroot.org/buildroot/commit/?id=0f1ad4fc93286adaba852c99d6e1c2565b5c4258
> 
> Support for _FORTIFY_SOURCE=3 can now be added.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in           | 9 +++++++++
>  package/Makefile.in | 2 ++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 3c57c591a8..cd26c9f102 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -929,6 +929,15 @@ config BR2_FORTIFY_SOURCE_2
>  	  Also adds checks at run-time (detected buffer overflow
>  	  terminates the program)
>  
> +config BR2_FORTIFY_SOURCE_3
> +	bool "Extended"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	help
> +	  This option sets _FORTIFY_SOURCES to 3 and even more
> +	  checking is added compared to level 2. Extends checks at
> +	  run-time that can introduce an additional performance
> +	  overhead.
> +
>  endchoice
>  
>  comment "Fortify Source needs a glibc toolchain and optimization"
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 43d214bcbe..7f1b00ba24 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -160,6 +160,8 @@ ifeq ($(BR2_FORTIFY_SOURCE_1),y)
>  TARGET_HARDENED += -D_FORTIFY_SOURCE=1
>  else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
>  TARGET_HARDENED += -D_FORTIFY_SOURCE=2
> +else ifeq ($(BR2_FORTIFY_SOURCE_3),y)
> +TARGET_HARDENED += -D_FORTIFY_SOURCE=3
>  endif
>  
>  TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -- 
> 2.37.3
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
