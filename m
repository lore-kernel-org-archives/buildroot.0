Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CED3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B58340436;
	Thu, 12 May 2022 20:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9og_fMKogm0s; Thu, 12 May 2022 20:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED96740412;
	Thu, 12 May 2022 20:18:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E29301BF398
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0F1160B30
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J0n2A-WjwFdO for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:18:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8A4460B22
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:18:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 77DA219F57B;
 Thu, 12 May 2022 22:18:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652386734;
 bh=ClIOLxHtuRAxzSIHvwOeAj7H/p1RVRXHfBsSRVirm8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=htgOjQjOu1AvkohbhaTiJK/+C9uv42unQKOac3uW1BmyO0bO01Nf4juhmKOxk2za6
 P2evcuAvSujO2SUO4p6eckbVdPLZl0t8Cec1m1ULwDKH34zOs7rExaqkChY3WeH0i1
 8LSYFdvCEdmKvbeR1kIW0fVOIpH+kacprMqAwN0Por71TkF933xqWItUxOCucq+mHS
 lszMK78/RY9AHvEHhDMaDS4ST1MO8iNw80wRswsEPUHXj8eyOOz4k1LDNrreDlLxld
 x3gVbNsviO5tNCprvxcv2ktKH+S7av4wMHrOgbGJvVtcic7RrP9gOcNa8fTDuFpHjL
 zZI10XakZI4bQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 22:18:52 +0200
Date: Thu, 12 May 2022 22:18:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220512201852.GI1597494@scaer>
References: <20220512121217.176652-1-arnout@mind.be>
 <20220512121217.176652-2-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512121217.176652-2-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/nodejs: use ninja for build
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

Arnout, All,

On 2022-05-12 14:12 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Not only is ninja much faster, it also avoids the following build
> failure:
> make[3]: printf: Argument list too long
> 
> This failure happens when the output directory is about 6 levels deep.
> It's due to the make generator of gyp that uses some crazy shell
> processing for splitting up paths on /. The ninja generator does no such
> thing.
> 
> While we're at it, remove redundant parenthesis in
> HOST_NODEJS_CONFIGURE_CMDS.

Thank you! \o/

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/nodejs.mk | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 909347eb2e..70febca74f 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -10,6 +10,7 @@ NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = \
>  	c-ares \
>  	host-nodejs \
> +	host-ninja \
>  	host-pkgconf \
>  	host-python3 \
>  	host-qemu \
> @@ -20,6 +21,7 @@ NODEJS_DEPENDENCIES = \
>  HOST_NODEJS_DEPENDENCIES = \
>  	host-icu \
>  	host-libopenssl \
> +	host-ninja \
>  	host-pkgconf \
>  	host-python3 \
>  	host-zlib
> @@ -37,7 +39,8 @@ NODEJS_CONF_OPTS = \
>  	--without-dtrace \
>  	--without-etw \
>  	--cross-compiling \
> -	--dest-os=linux
> +	--dest-os=linux \
> +	--ninja
>  
>  HOST_NODEJS_MAKE_OPTS = \
>  	$(HOST_CONFIGURE_OPTS) \
> @@ -82,7 +85,7 @@ NODEJS_CONF_OPTS += --without-npm
>  endif
>  
>  define HOST_NODEJS_CONFIGURE_CMDS
> -	(cd $(@D); \
> +	cd $(@D); \
>  		$(HOST_CONFIGURE_OPTS) \
>  		PATH=$(@D)/bin:$(BR_PATH) \
>  		PYTHON=$(HOST_DIR)/bin/python3 \
> @@ -96,7 +99,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
>  		--shared-zlib \
>  		--no-cross-compiling \
>  		--with-intl=system-icu \
> -	)
> +		--ninja
>  endef
>  
>  NODEJS_HOST_TOOLS_V8 = \
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
