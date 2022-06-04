Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA74CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 08:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D04941CAE;
	Sat,  4 Jun 2022 08:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSlMwzPkJOkY; Sat,  4 Jun 2022 08:23:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10FC741CA0;
	Sat,  4 Jun 2022 08:23:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45A3A1BF41F
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 08:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41F9460EBF
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 08:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fa5knwO6dEk4 for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 08:23:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 474B760AF4
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 08:23:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A2C9E5FFBD;
 Sat,  4 Jun 2022 10:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654330999;
 bh=8WV7Wbml6gQp8azXX2IPi1+eoTceuajDZLo3avwRVP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UgX11aWeywq3ZTXQQhI+KH3hD23s0+csoo7JROgz7lKOa11AruSvKkmg42PBN7Aqx
 Mqwl9i6TcMhhfgUdC4h3irEdBMEF2P4op+oIpXTM7MbkwbdGLxfEYPhFwXJODBXo0D
 myeSIq2+yajxWjeyN6dtXkrG4FIb9CogrGnrlSsWRbjUM40Hy6NH0BSvxJXpsiLIdF
 KTEm1oMMPE8qjqA14Lfyef3/7uLb09lsji46CLcjq+UUce7UnmkQwOm/fl5oNfzUUA
 /R/Xdsnyx2b1IF/1oMuzwTiDE6DO11QlFyUVuhkObkQXPqyJNqAixj5FBJTTG+qSD6
 YLZh4iPfiI5lA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 10:23:17 +0200
Date: Sat, 4 Jun 2022 10:23:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20220604082317.GE427639@scaer>
References: <20220602210421.426648-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220602210421.426648-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] linux: disable -Werror when building host
 tools
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
Cc: Anders Pitman <buildroot@apitman.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2022-06-02 23:04 +0200, Yann E. MORIN spake thusly:
> gcc-12 is starting to trickle down to some distros, like Archlinux.
> gcc-12 has new warnings, and detects more cases of isues, like new
> UAF cases, which is causing build issues in code that was previously
> building fine, as reported in 14826:
> 
>     In file included from sigchain.c:3:
>     In function 'xrealloc',
>         inlined from 'sigchain_push.isra' at sigchain.c:26:2:
>     subcmd-util.h:56:23: error: pointer may be used after 'realloc' [-Werror=use-after-free]
>        56 |                 ret = realloc(ptr, size);
>           |                       ^~~~~~~~~~~~~~~~~~
>     subcmd-util.h:52:21: note: call to 'realloc' here
>        52 |         void *ret = realloc(ptr, size);
>           |                     ^~~~~~~~~~~~~~~~~~
>     subcmd-util.h:58:31: error: pointer may be used after 'realloc' [-Werror=use-after-free]
>        58 |                         ret = realloc(ptr, 1);
>           |                               ^~~~~~~~~~~~~~~
>     subcmd-util.h:52:21: note: call to 'realloc' here
>        52 |         void *ret = realloc(ptr, size);
>           |                     ^~~~~~~~~~~~~~~~~~
> 
> In that case, the kernel has already fixed their code, which is part of
> 5.17:
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=52a9dab6d892763b2a8334a568bd4e2c1a6fde66
> 
> However, we can't easily carry that patch, because we don't know
> whether the kernel the user uses already has the fix ir not.
> 
> Instead, we can just tell the kernel to disable use of -Werror when
> building host tools.
> 
> As a consequence, we can drop it from the perf-specific setting.
> 
> Fixes: #14826
> 
> Reported-by: Anders Pitman <buildroot@apitman.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to masteri (with typoes hopefully fixed), thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/linux.mk                            | 3 +++
>  package/linux-tools/linux-tool-perf.mk.in | 1 -
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 5aed47fee7..0d0cfcac50 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -147,11 +147,14 @@ endif
>  
>  # We don't want to run depmod after installing the kernel. It's done in a
>  # target-finalize hook, to encompass modules installed by packages.
> +# Disable building host tools with -Werror: newer gcc versions can be
> +# extra picky about some code (https://bugs.busybox.net/show_bug.cgi?id=14826)
>  LINUX_MAKE_FLAGS = \
>  	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
>  	ARCH=$(KERNEL_ARCH) \
>  	INSTALL_MOD_PATH=$(TARGET_DIR) \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	WERROR=0 \
>  	DEPMOD=$(HOST_DIR)/sbin/depmod
>  
>  ifeq ($(BR2_REPRODUCIBLE),y)
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index 4e28129f50..d82d45973c 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -20,7 +20,6 @@ PERF_MAKE_FLAGS = \
>  	ARCH=$(PERF_ARCH) \
>  	DESTDIR=$(TARGET_DIR) \
>  	prefix=/usr \
> -	WERROR=0 \
>  	NO_GTK2=1 \
>  	NO_LIBPERL=1 \
>  	NO_LIBPYTHON=1 \
> -- 
> 2.25.1
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
