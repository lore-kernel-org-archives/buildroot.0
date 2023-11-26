Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462F8C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF2E7404F7;
	Sun, 26 Nov 2023 21:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF2E7404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMMrW87U72Lg; Sun, 26 Nov 2023 21:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 320C3404E4;
	Sun, 26 Nov 2023 21:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 320C3404E4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EAF41BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0720E60BEF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0720E60BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpT2Cl1t2q-3 for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:25:46 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB68660BE7
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB68660BE7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 350BF78035E;
 Sun, 26 Nov 2023 22:25:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 22:25:41 +0100
Date: Sun, 26 Nov 2023 22:25:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231126212541.GF3177259@scaer>
References: <20231126182912.400704-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126182912.400704-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701033944;
 bh=JqNpuN66ROStrFZGDz4HfdN44fOFWnHJ0uFpCzhTwUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B3kCAbtu+Miu3Dkq1pEurOVN7BowOUqcHnhYodB5XcS2iOrRvIU9yxqoUDm1c62PE
 cDGzJ4UuIR1iTFrVgaPQATvLXIhdoTUUSLa6VNHYS5arJpfrZ0TUL/vknywKEaHNHl
 Ki1pz9KP+ITtqeG2JeCXkarI2Urc3jgeq8OeUI+N4mdErcetOu3bWYy6a1ir2pOhH0
 c/vnIYrpWiWuzmqUkwmh9G93mfw8ak90uhuX65df25Y33lSXvYCTDIhvXJ8gxyAnIF
 NniY9ti2EnjzD0bJ3Ps4tLGCFgLqG/it+amhr5C8GNIjOL4xRfOjyOaNwTG4Gotp+p
 CGAKy/gn22TSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B3kCAbtu
Subject: Re: [Buildroot] [PATCH 1/1] package/libpam-tacplus: fix build
 without SSP
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

Fabrice, All,

On 2023-11-26 19:29 +0100, Fabrice Fontaine spake thusly:
> Use --disable-am-ldcflags which is available since version 1.4.1 and

It was not clear to me what this flag would do, nor why it would solve
the issue.

So I rewrote the commit log with a more detailed explanations.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> https://github.com/kravietz/pam_tacplus/commit/b1054ad8bb337ac30ec56434e03bfb976ca14213
> to avoid the following build failure without stack-protector raised
> since bump to version 1.7.0 in
> commit 160f0e4b5f161d1966a70ad36679a9f5e9dfa9d3:
> 
> cc1: warning: '-fstack-protector' not supported for this target
> In file included from libtac/lib/xstrncpy.c:36:
> libtac/lib/xstrncpy.c: In function 'xstrncpy':
> ./libtac/include/libtac.h:71:15: error: called object is not a function or function pointer
>    71 | #define abort exit(EXIT_FAILURE)
>       |               ^~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cc8a7c5cca65e002d40a775f09e3c4577fbab5b7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpam-tacplus/libpam-tacplus.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
> index 044b7207f9..df4d62a0b8 100644
> --- a/package/libpam-tacplus/libpam-tacplus.mk
> +++ b/package/libpam-tacplus/libpam-tacplus.mk
> @@ -17,8 +17,6 @@ LIBPAM_TACPLUS_DEPENDENCIES = \
>  # We're patching Makefile.am
>  LIBPAM_TACPLUS_AUTORECONF = YES
>  LIBPAM_TACPLUS_INSTALL_STAGING = YES
> -LIBPAM_TACPLUS_CONF_ENV = \
> -	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
> -LIBPAM_TACPLUS_CONF_OPTS = --disable-werror
> +LIBPAM_TACPLUS_CONF_OPTS = --disable-am-ldcflags --disable-werror
>  
>  $(eval $(autotools-package))
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
