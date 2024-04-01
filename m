Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882D0CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E36240181;
	Mon,  1 Apr 2024 13:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vP-1Ei_4vso; Mon,  1 Apr 2024 13:09:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3222040298
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3222040298;
	Mon,  1 Apr 2024 13:09:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECA951BF232
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D99DA40298
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2O3Xo_aFigS for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:09:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D4F6640181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4F6640181
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4F6640181
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 13:09:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9EDAA13F8BA;
 Mon,  1 Apr 2024 15:09:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 15:09:12 +0200
Date: Mon, 1 Apr 2024 15:09:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zgqx-I0TOpYCWvG4@landeda>
References: <20240331164354.94483-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331164354.94483-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711976955;
 bh=JNxWv0Axrkqfq9Ig/j3bHob3Nf/bCroQcywjYgwhPY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rnRNrBmWIgc3uFHSzN2snpaP4HYlB4XlMs3fgmL1uHjaXfMDGR0JzwAfYhb1ZV/1v
 m/mfaesrAbxcMxGT4GIUzD4hfe3KJmekPuxvcCqB9hbtfbC7xj0JPcG3/InrrEMfSY
 T/5vQ8SuJrvY7/ib2YARECFz9yP//Ohh4E6dr3YPiT5zybu4Brz39tcuIkLwDheeyY
 6zboxXMppMeDn7Gn4VW9cXkGjM9t8ZSAKIwcGYMSeGYbQC86Jf7RtUuuN91UNBLzp1
 6cV6ddaiwDU8XZCZJ4zcGe7CiHWmRRJdoG6DSKDHAK2wGHqTQXJYFqETD60xVx3yrt
 XPurlzGfFlWjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rnRNrBmW
Subject: Re: [Buildroot] [PATCH 1/1] package/giflib: fix host build without
 convert
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-03-31 18:43 +0200, Fabrice Fontaine spake thusly:
> Do not build docs for host-giflib to avoid the following build failure
> without convert on host raised since bump to version 5.2.2 in commit
> f98239dada59270efe19de9d9fae50ec9ab9d28c and
> https://sourceforge.net/p/giflib/code/ci/d565f6fa04be8973425bd7cd3f169908ac9e95c2:
> 
> convert ../pic/gifgrid.gif -resize 50x50 giflib-logo.gif
> make[2]: convert: No such file or directory
> 
> Fixes: f98239dada59270efe19de9d9fae50ec9ab9d28c
>  - http://autobuild.buildroot.org/results/04dd54f5060881cb8aa030de34edb4ceea863fa6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/giflib/giflib.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
> index 770338507b..f37ec8af21 100644
> --- a/package/giflib/giflib.mk
> +++ b/package/giflib/giflib.mk
> @@ -27,7 +27,7 @@ define GIFLIB_BUILD_CMDS
>  endef
>  
>  define HOST_GIFLIB_BUILD_CMDS
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) shared-lib
>  endef
>  
>  define GIFLIB_INSTALL_STAGING_CMDS
> @@ -42,7 +42,7 @@ endef
>  
>  define HOST_GIFLIB_INSTALL_CMDS
>  	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
> -		PREFIX=/usr install
> +		PREFIX=/usr install-include install-shared-lib
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.43.0
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
