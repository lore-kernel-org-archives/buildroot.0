Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48968C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2F6C60F2A;
	Mon,  5 Feb 2024 09:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2F6C60F2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0g4xdMCIfqw; Mon,  5 Feb 2024 09:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 342F860F31;
	Mon,  5 Feb 2024 09:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 342F860F31
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D22221BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7C6881E4A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7C6881E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id trBuizsZmVZ2 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:25:18 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69B1882382
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69B1882382
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6E8B713F838;
 Mon,  5 Feb 2024 10:25:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 10:25:10 +0100
Date: Mon, 5 Feb 2024 10:25:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <ZcCpdoR2fzshSSzf@landeda>
References: <20240204201657.33079-1-aleksandr.o.makarov@gmail.com>
 <20240204201657.33079-2-aleksandr.o.makarov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240204201657.33079-2-aleksandr.o.makarov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707125115;
 bh=swOpJrgFNeR2Z4Ovm67mE/Z6GgrczFiXwCfwwh8NAvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TK1UZQykwEzpSSD8gNnZN/6bVUlIXoN0SX2msC1p5AigqcbqeejFskw+3ihmcjPD/
 +Ect+v4qrZr/+8uIvEV+WRcj1Mt1wyCVoet+PJlTgQFdij0CKVKi+Fz43Bmuj8HOKz
 8N2OTRfh6glCKd6TDxLHfXIWZ+HZvabsjrx/1vLE/ekx3fV+C5he2u4JcVNJHWv+Ev
 1CJmZxgI+6AVGPzZA9y0kGhTSTNpv1Kw/1qeo6XVfKYAoVJqBO8qHwVQijJL1Ikcks
 u+pFUZXWkZtqTs86fKXyoA+t3V3LXF2J9PKfty0cn4OYffMdUybLXLBdUjNgjkzhwH
 oLwK16R1tCtpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TK1UZQyk
Subject: Re: [Buildroot] [PATCH v2] package/haproxy: fix runtime 'FATAL
 ERROR: invalid code detected -- cannot go further'
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Aleksandr, All,

On 2024-02-04 22:16 +0200, Aleksandr Makarov spake thusly:
> Setting HAPROXY_CFLAGS on the haproxy build command line overrides CFLAGS
> which were internally set by the haproxy Makefile.
> 
> Among those omitted CFLAGS is -fwrapv. Compiling haproxy without it and
> and then running the program results in runtime error:
> 
> $ haproxy
> FATAL ERROR: invalid code detected -- cannot go further, please recompile!
> ...
> 
> To address this issue, include HAPROXY_CFLAGS in the DEFINE variable instead
> of CFLAGS in haproxy.mk.

You forgot to add your Signed-off-by line here, but I messed up and
applied and pushed.

/me goes fumble with his git hooks to understand why that was not
caught...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2
>   - Drop patch for haproxy program Makefile, make changes to haproxy.mk instead
> ---
>  package/haproxy/haproxy.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index 63a92090f3..61a9ebebe4 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -82,7 +82,7 @@ endif
>  
>  define HAPROXY_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		$(HAPROXY_MAKE_OPTS) CFLAGS="$(HAPROXY_CFLAGS)" -C $(@D)
> +		$(HAPROXY_MAKE_OPTS) DEFINE="$(HAPROXY_CFLAGS)" -C $(@D)
>  endef
>  
>  define HAPROXY_INSTALL_TARGET_CMDS
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
