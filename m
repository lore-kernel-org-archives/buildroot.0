Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A765C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F6260D51;
	Tue,  7 Nov 2023 21:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F6260D51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3PWnIDYNvyd; Tue,  7 Nov 2023 21:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63BA160C2B;
	Tue,  7 Nov 2023 21:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63BA160C2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24C321BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A63641761
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A63641761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_jrkOgXUNyD for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:41:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D870B41741
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D870B41741
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 03CF213F89C;
 Tue,  7 Nov 2023 22:40:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 22:40:57 +0100
Date: Tue, 7 Nov 2023 22:40:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231107214057.GM229059@scaer>
References: <20231031090114.618913-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031090114.618913-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699393263;
 bh=uhStZtviv2MxAiPsf4QK0Ixkg1BOujMsgpwi8gYMxb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ffQL5nFOuxEUm+F8ML5emQhKq7jMrNYfnwyEcJq7cko/kGhiZ90ztT8QRP1uNZHmv
 had6cok8ci8x7g68IwX8zXvzY+fBjQFGIql/kq5AXnotq/O4JnBdzSE3qvPzaCsKC3
 uK5ME3WCGAWsx8WrYhJ6kBU/IBEVKmpPG/CAAVDeQ9/HGV3cDWVqHQmqzkSOp59SAJ
 rNU7DMn17YGRHAl0HDeqM3nmXxjGeRlFnQk7Fmhus//LJD8YqYYO8n7aw5UJuEnePr
 TnFhgMCHvHSY14P4UfY5iR9fSgam5JWVI5DgBMyGy/N8pkEKyPpXGe0mN/Ufo73es3
 8nyGYXyYAcH/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ffQL5nFO
Subject: Re: [Buildroot] [PATCH] package/nodejs: fix additional modules
 installation
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-10-31 10:01 +0100, Giulio Benetti spake thusly:
> At the moment the npm_config_nodedir is set to the build directory but
> npm nodedir must be the one on target to find the expected files. So let's
> set npm_config_nodedir to $(TARGET_DIR)/usr.
> 
> Fixes:
> https://bugs.busybox.net/show_bug.cgi?id=15826
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I have drastically extended the commit log to explain what nodedir is,
and why we decided to set it to...

> ---
>  package/nodejs/nodejs.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 2a8c570932..8f86413049 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -20,7 +20,7 @@ NODEJS_BIN_ENV = $(TARGET_CONFIGURE_OPTS) \
>  	npm_config_arch=$(NODEJS_CPU) \
>  	npm_config_target_arch=$(NODEJS_CPU) \
>  	npm_config_build_from_source=true \
> -	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
> +	npm_config_nodedir=$(TARGET_DIR)/usr \

... STAGING_DIR, not TARGET_DIR.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	npm_config_prefix=$(TARGET_DIR)/usr \
>  	npm_config_cache=$(BUILD_DIR)/.npm-cache
>  
> -- 
> 2.34.1
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
