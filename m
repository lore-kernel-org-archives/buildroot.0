Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401F9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 12:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA92060B26;
	Sun, 17 Jul 2022 12:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA92060B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKS6O6c2mSKK; Sun, 17 Jul 2022 12:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B803A60AFD;
	Sun, 17 Jul 2022 12:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B803A60AFD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1933B1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 12:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E838F83F04
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 12:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E838F83F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuCBoD8vZ-aO for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 12:56:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA46883F03
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA46883F03
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 12:56:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 427E378050D;
 Sun, 17 Jul 2022 14:56:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 14:56:03 +0200
Date: Sun, 17 Jul 2022 14:56:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220717125603.GD2107091@scaer>
References: <20220711131823.116481-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220711131823.116481-1-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658062568;
 bh=PONCUHmOq3GcDg5t3pHjqpDQjj/3aCe5f9PlYs2BkzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IbUjQeZB1bx92+Vpiaz3p9UN5EJ10sk3qzGiJLPArAGxcM0VVkgWX6gdhw+Qluhhc
 LYulWl0PHo1dBVKL35bkwbhSVhi7I99/K24GJXU6p9oIKwSCJI0KRaxMXa0YrZM6yd
 tEOn897/6zxTbWQsGoB3xzKT6gmP0a46fzQ5U16QHUhXacLkGedR0pQhh428mprgU4
 2IUcLQQWFhrdEuek4PT6UGb0w0rwvruTomVzcS1prfWjEVFFxONd/hyu+NYB2TKwC7
 487xfbcQSzqxCnD7FwJXSS+mo/CQ+uh+TBEicDeJuVi8RgLVt7UDrl5u0iNqT6K49c
 ybgHu4zfYys/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IbUjQeZB
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: add explicit
 dependency on libevent if libevent package to be built
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-07-11 15:18 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> The cam application requires libevent. Since there's no Kconfig option
> for it, cam building ability is checked by meson build system by default.
> 
> If libevent is present in the sysroot, cam is built.
> 
> The issue is that there's no explicit dependency on libevent in
> libcamera package. This means that it is possible for libevent AND
> libcamera to be built, but have libcamera be built before libevent.
> Meaning that even if all requirements seem to be fulfilled, cam still
> won't be enabled in some cases.
> 
> This fixes the possible race by expliciting the dependency to libevent
> if the libevent package is enabled. Otherwise, explicitly disable cam
> building as it's already known that it isn't going to build.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> v2:
>  - added -Dcam=enabled when libevent package is enabled, to catch
>  possible additional dependencies to cam in later upgrades,
> 
>  package/libcamera/libcamera.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 41d6a5abef..3f336cb797 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -84,6 +84,13 @@ else
>  LIBCAMERA_CONF_OPTS += -Dqcam=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
> +LIBCAMERA_CONF_OPTS += -Dcam=enabled
> +LIBCAMERA_DEPENDENCIES += libevent
> +else
> +LIBCAMERA_CONF_OPTS += -Dcam=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_TIFF),y)
>  LIBCAMERA_DEPENDENCIES += tiff
>  endif
> -- 
> 2.36.1
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
