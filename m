Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BE9C53210
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 15:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F178781248;
	Sun,  8 Jan 2023 15:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F178781248
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yxxXck0pOUN; Sun,  8 Jan 2023 15:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40FF580FB2;
	Sun,  8 Jan 2023 15:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40FF580FB2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 992C01BF360
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 736D3408A2
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 736D3408A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGSWlV9OYpDm for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 15:58:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E41440894
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E41440894
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 15:58:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4246E5FF9D;
 Sun,  8 Jan 2023 16:58:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jan 2023 16:58:40 +0100
Date: Sun, 8 Jan 2023 16:58:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230108155839.GE151997@scaer>
References: <20221230180843.521147-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221230180843.521147-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673193522;
 bh=uXG5bqwMvX9QAIHXOjFQ+KTfA5XxHi4lxaPsUdc5dIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ff3HhMoCY1WrFd93kwKTLai03zIawwfHmDxyfQs4INB1wMt9egvoW1Dl2XNQNzYEX
 srPmL0q0BTWGDk86rsfplbDt3nvRWoPWuK0OjFupEC06aldhw6BRcM1XGJhlqle/pD
 8tW0V4MCw+ZRxyGgMUP2oT7bev+qRbSH5S8VCwDZhulBwoNquRiR92aiC6xfacQEnK
 Mbn0H/ikDcb8REgpSU7vAKerXCIrzpZJRsYRbWfUK4bMU84P/x8+zU3tgvqu0lRsMc
 Y5rc3yiCbmJsyhoxf5d8n8pB7PWx1nnBZi9T+itYhtzm5DlKKvk7ovw3QdHWgs4KwG
 NdEmNJ8AGHdpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ff3HhMoC
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: add libgcrypt optional
 dependency
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

On 2022-12-30 19:08 +0100, Fabrice Fontaine spake thusly:
> libgcrypt is an optional dependency which is enabled by default since
> version 1.7 and
> https://github.com/containers/crun/commit/dd310aaf5aee336d0f6236c1c2add7b7cb030482
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after extending the commit log to state that there
are no associated --enable/disable flags, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/crun/crun.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/crun/crun.mk b/package/crun/crun.mk
> index 8c9993993c..fd8bfb0981 100644
> --- a/package/crun/crun.mk
> +++ b/package/crun/crun.mk
> @@ -26,6 +26,10 @@ else
>  CRUN_CONF_OPTS += --disable-caps
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +CRUN_DEPENDENCIES += libgcrypt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
>  CRUN_DEPENDENCIES += libseccomp
>  CRUN_CONF_OPTS += --enable-seccomp
> -- 
> 2.35.1
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
