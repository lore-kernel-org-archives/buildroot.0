Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF33C001E0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 18:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 131C5405A9;
	Sat, 12 Aug 2023 18:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 131C5405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0-rC2-v1PnI; Sat, 12 Aug 2023 18:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3325A40583;
	Sat, 12 Aug 2023 18:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3325A40583
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA2A1BF41F
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 18:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50BCA405A1
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 18:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50BCA405A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YyjWernx0sYT for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 18:33:58 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D978340227
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 18:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D978340227
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D3932780344;
 Sat, 12 Aug 2023 20:33:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Aug 2023 20:33:51 +0200
Date: Sat, 12 Aug 2023 20:33:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230812183351.GO421096@scaer>
References: <20230803201527.19108-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803201527.19108-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691865235;
 bh=Kenn2XMNjCIs9U/WxnSM5pSucNaFSURmrb4d+4Ji0R0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IjzJZ6Hivq7t2DY+mpsvHKlpylh6MDEvo6/OtNxgU0j9hBDOWuR9pDJVCTPoi7558
 N5pIfbiPcpSu+dIvGYaMPPw4UplncK40BEmwFRySJ/907N/qxyuZW65flmnTL30ROU
 cgNm+3oBZsx8GVqCkTDuxD+zaAJymNIUfbsOXoJToKn0YajngcZMaE2BCkOMBAIEAH
 KQ8zbz7O0n/1J1zhN+x9CB2gySkePArDGxBf40iWR5Yis0RTrG0HngNS3JR3qyMui6
 Lajl15VJi/sxGe/67rO1zfOxhbat5vHEOm0vyc+Wcr4hSmeR++DiYikFWR5Wgq70jZ
 YhZh6ET0LrXtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IjzJZ6Hi
Subject: Re: [Buildroot] [PATCH 1/2] package/weston: fix the configuration
 of simple-clients
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
> commit 7329a0db442026c6b856e76ea964107fa3c730f3
> "weston: disable v4l simple dmabuf for headers < 3.8"
> disabled dmabuf-v4l-client when kernel headers are older than v3.8.
> This commit was made at the time the weston package was at version
> 1.10.0, using the autotools package infra.
> 
> commit e672eb5c39fa626f8e924269cec2056be9e14ded
> "package/weston: bump to version 8.0.0"
> replaced the package infra to meson (since upstream deprecated
> autotools). This commit changed a disable of dmabuf-v4l-client in
> autotools, by enabling it only if supported. The end result is that
> the current meson package recipe disable ALL simple clients, or just
> enable dmabuf-v4l-client when supported. In all cases, all other
> weston simple clients are disabled. This behavior is not convenient
> since some of those simple clients are useful to test the correct
> operation of Weston and the rest of the graphic stack.
> 
> This commit fixes this issue by enabling all supported simple clients.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/weston/weston.mk | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 437c6f2e38..5f8d915d5a 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -22,13 +22,22 @@ WESTON_CONF_OPTS = \
>  	-Dlauncher-libseat=true \
>  	-Dtools=calibrator,debug,info,terminal,touch-calibrator
>  
> -# Uses VIDIOC_EXPBUF, only available from 3.8+
> +WESTON_SIMPLE_CLIENTS = \
> +	damage \
> +	dmabuf-egl \
> +	dmabuf-feedback \
> +	egl \
> +	im \
> +	shm \
> +	touch
> +
>  ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
> -WESTON_CONF_OPTS += -Dsimple-clients=dmabuf-v4l
> -else
> -WESTON_CONF_OPTS += -Dsimple-clients=
> +# dmabuf-v4l uses VIDIOC_EXPBUF, only available from 3.8+
> +WESTON_SIMPLE_CLIENTS += dmabuf-v4l
>  endif
>  
> +WESTON_CONF_OPTS += -Dsimple-clients=$(subst $(space),$(comma),$(strip $(WESTON_SIMPLE_CLIENTS)))
> +
>  ifeq ($(BR2_PACKAGE_JPEG),y)
>  WESTON_CONF_OPTS += -Dimage-jpeg=true
>  WESTON_DEPENDENCIES += jpeg
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
