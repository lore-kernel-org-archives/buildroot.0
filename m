Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19BDEE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 09:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 640B360BE1;
	Sun, 20 Aug 2023 09:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 640B360BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 400T9wzi4u7m; Sun, 20 Aug 2023 09:46:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9218A60BC0;
	Sun, 20 Aug 2023 09:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9218A60BC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC0471BF5E6
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 09:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A204181E97
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 09:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A204181E97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNRD9uxyG5kJ for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 09:46:55 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AA9D81E26
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 09:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA9D81E26
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:73e4:5f06:f514:c64d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5CA3719F55C;
 Sun, 20 Aug 2023 11:46:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 11:46:47 +0200
Date: Sun, 20 Aug 2023 11:46:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230820094647.GH1778688@scaer>
References: <20230817191130.1022405-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817191130.1022405-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692524812;
 bh=UWN8I18AAreKSukbjfnXmsPUg8jWHsTgv00Vj+YkNCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L5s5b8mzxn79ChO4M4z9veuHZw7FOY5QyFRUaZCUwEf3HugLrJuaNGWgGcYalj5S/
 Yq8LGHP29S6jAyD9wmu6Dg/VG7hzUkqmroaOw72FLQgm6XP0sSwL/CcOxvtXD0buYk
 CxVre5Nl+34+xusRvPUn845Qvh4Do5yHXXcfJ/qzeTe/5TV2O0SUJwMW7s9vhiMBVC
 G+HOiEF8olBE/6E9pSUhK44Q1Szd/jZtQZJKadXYlXvMYDr+zGq77VjTwa75vqUU5/
 ujLYnlXlLbFkp7YQ6ZZlgW/p6jM8J6GFutXLZLdJIAwkUYL6FBdx3CKK+ceeTXsKOR
 hIHONp/NbuznQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L5s5b8mz
Subject: Re: [Buildroot] [PATCH] package/nftables: fix the build of the
 pyhon bindings
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-08-17 21:11 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> Instead, we split the pyhon bindings to their own package.
[--SNIP--]
> diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
> index b0a14bd429..aa88203ab5 100644
> --- a/package/nftables/nftables.mk
> +++ b/package/nftables/nftables.mk
> @@ -42,13 +42,6 @@ else
>  NFTABLES_CONF_OPTS += --without-json
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -NFTABLES_CONF_OPTS += --enable-python
> -NFTABLES_DEPENDENCIES += python3
> -else
> -NFTABLES_CONF_OPTS += --disable-python

I moved --disable-python into the unconditional _CONF_OPTS.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> -endif
> -
>  NFTABLES_CONF_ENV = LIBS="$(NFTABLES_LIBS)"
>  
>  define NFTABLES_LINUX_CONFIG_FIXUPS
> @@ -58,3 +51,6 @@ define NFTABLES_LINUX_CONFIG_FIXUPS
>  endef
>  
>  $(eval $(autotools-package))
> +
> +# Legacy: we used to handle it in this .mk
> +include package/nftables/nftables-python/nftables-python.mk
> -- 
> 2.25.1
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
