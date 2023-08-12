Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AC1C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 18:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32C6D4051D;
	Sat, 12 Aug 2023 18:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32C6D4051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oso-MWOJEqGR; Sat, 12 Aug 2023 18:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CA33404F7;
	Sat, 12 Aug 2023 18:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CA33404F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C68391BF41F
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 18:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A00E9404C8
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 18:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A00E9404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3O3SNIgN3c2z for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 18:35:17 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0A8D40003
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 18:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0A8D40003
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B3E2C780372;
 Sat, 12 Aug 2023 20:35:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Aug 2023 20:35:12 +0200
Date: Sat, 12 Aug 2023 20:35:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230812183512.GP421096@scaer>
References: <20230803201527.19108-1-ju.o@free.fr>
 <20230803201527.19108-2-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803201527.19108-2-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691865315;
 bh=itw09hHJPsnbG6Daa7hDz6zcmUI4rv1Z+pK2HHl4kSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WS8DAlTwi6DEy8Eu1Yv/D5EDtBplx8wtOEZXExqrST6FwdlNf+dnr7ptJgcggHw2p
 hCB2VfcYijZAx5tWZ24Ha81+SdyhCmVWE+WfE+0HjVzfutJHhRmjAcu8IBXFTLXD8P
 3xNaIoLgs/Vai64ZwVqfNxi4UBHY6FejE3tbrtbvh6ZL2FmMlew5pQfis5M1HJpSWo
 5ehA5UEHa2XkZ8W8Ku2wUlcOQ1lHfiCr/RWtVfJ5cDi8Gg4ngX/4JBed+Guecf7m4d
 OZqigjSVsT0Po8+fNsxbSLiou2k/Pn38hxX92O5/H84OdwVowfNw4Hh3vW3tdJProV
 dV3DSXt0Alefg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WS8DAlTw
Subject: Re: [Buildroot] [PATCH 2/2] package/weston: introduce
 _SIMPLE_CLIENTS package option
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-08-03 22:15 +0200, Julien Olivain spake thusly:
> commit "package/weston: fix the configuration of simple-clients"
> fixed the configuration of Weston simple-clients by always enabling all
> supported applications.
> 
> Since it is not desirable to always have all those applications
> installed on target, this commit introduces a new package Kconfig
> option to control this.
> 
> Since there is already a BR2_PACKAGE_WESTON_DEMO_CLIENTS option present,
> this commit also update the Kconfig "help" entries, to clarify the
> difference between those "demo clients" and "simple clients". Those
> clients groups are directly coming from the upstream package (and are
> directly mapped to Meson configure options).
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
[--SNIP--]
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 5f8d915d5a..0974159a9f 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -22,6 +22,7 @@ WESTON_CONF_OPTS = \
>  	-Dlauncher-libseat=true \
>  	-Dtools=calibrator,debug,info,terminal,touch-calibrator
>  
> +ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
>  WESTON_SIMPLE_CLIENTS = \
>  	damage \
>  	dmabuf-egl \
> @@ -37,6 +38,9 @@ WESTON_SIMPLE_CLIENTS += dmabuf-v4l
>  endif
>  
>  WESTON_CONF_OPTS += -Dsimple-clients=$(subst $(space),$(comma),$(strip $(WESTON_SIMPLE_CLIENTS)))
> +else
> +WESTON_CONF_OPTS += -Dsimple-clients=
> +endif

I moved the assignment outisde the conditional block, Indeed, if
BR2_PACKAGE_WESTON_SIMPLE_CLIENTS is unset, WESTON_SIMPLE_CLIENTS will
not be set and thus wil be empty, which is as good an empty list as we
need. ;-)

Applied to next, thanks.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_JPEG),y)
>  WESTON_CONF_OPTS += -Dimage-jpeg=true
> -- 
> 2.41.0
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
