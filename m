Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DA0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 06:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B06FD4163E;
	Tue, 12 Apr 2022 06:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iT-aVVx2PVGv; Tue, 12 Apr 2022 06:06:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B00641635;
	Tue, 12 Apr 2022 06:06:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC4DF1BF335
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 06:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D625641638
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 06:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76HAJk9QCAs3 for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 06:06:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A96B341635
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 06:06:39 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u18so10382227eda.3
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 23:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xJfywTRDmcuF3nV+oZE6aZOxhfY9iPoR8TLRc73D48s=;
 b=fAbn4AXCMdkfcdBn9vSJU47cr093j0mTdYNy4Nej6xp0PlQOq0x5rmO8BKtY6G52WX
 ZKUVO6AvAUJnQAZhUxOJ1ZGQiA4xiebD9OrhLF19czbsX8e7iJkKZdgQf8bKW69jZkcx
 rTA/AF/CdGs/OswkR8z78Nu1B6MvOdnBcd9YutbcLgcPcl5BqSA56JVsKxxTQqWgT3DR
 xPNsrGxZMKeK/A+YVV6bmjOD+wPVj4CY98Ur+7NitmK88lc1pCjPUVBdfnjAIX1P3/Vt
 Wx1xiGYGDC25gZ2J5CFTDnlVf0Yl3Lw+m3v3UPEDnc3dCATCKKERVvE+9uFbfVQDdkJf
 EO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xJfywTRDmcuF3nV+oZE6aZOxhfY9iPoR8TLRc73D48s=;
 b=rC6+EcRQqAVzLN8obliKrkJTj1oSNev2FYvhf5jEIcrVXtGwl3+13vnuPlK28ZPsWU
 F6EcVNEchwzj1v9tlmIZ6GyxBpzWZhZjaS1HlJmeC4/E1vKpo5VzetDraMy2GUdWIBnp
 YZhU/LkcgtgikzRD9ee8+iRVcSaEZWRaR47fJoLO46QOdy6ljIvRv4Ugk75hTbHLpU7n
 L7ZGkfQrXOFVH+Z3w46K8eg1p76PnA7mkcshFoJi8tiKDyKOWQXzrt6s7f1OOsaF3Ymy
 ZmC6sxGRj0klYwvfU5ARjHd8OFKMEc610T89asyU+UTp1kr+7kB/8pfM3MUXol/5MTCS
 N45Q==
X-Gm-Message-State: AOAM533tzzDZWGWcou9HRl7XTTrdvbetPp3lMtZWKtu1Vv2qCzQH1Ffq
 UwJNchyKZg7cRtvfuLtEsWjDltxBRd8JW1K6+M0=
X-Google-Smtp-Source: ABdhPJzS6bCH65YchKMqgvp2HKPGBYM/CntQUwdF55J2ZnX83UXqhvLC5RyH5FjO6SrjXRXGjAJQ/ki+SbEXZxe6cL4=
X-Received: by 2002:a05:6402:518e:b0:419:675b:abeb with SMTP id
 q14-20020a056402518e00b00419675babebmr36871326edd.279.1649743597605; Mon, 11
 Apr 2022 23:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220411221248.609465-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220411221248.609465-1-fontaine.fabrice@gmail.com>
Date: Tue, 12 Apr 2022 08:06:24 +0200
Message-ID: <CAGm1_kv5XD3upSOVM3bX310qmf7Pn10CXO5LcmrKH1CiGfXMzw@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/avrdude: spi needs headers >=
 4.8
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Apr 12, 2022 at 12:14 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> SPI unconditionally uses GPIOHANDLE_SET_LINE_VALUES_IOCTL which is only
> available since kernel 4.8 and
> https://github.com/torvalds/linux/commit/d7c51b47ac11e66f547b55640405c1c474642d72
> resulting in the following build failure since switch to upstream in
> commit 03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a:
>
> linuxspi.c: In function 'linuxspi_reset_mcu':
> linuxspi.c:102:28: error: storage size of 'data' isn't known
>      struct gpiohandle_data data;
>                             ^~~~
> linuxspi.c:110:32: error: 'GPIOHANDLE_SET_LINE_VALUES_IOCTL' undeclared (first use in this function)
>      ret = ioctl(fd_linehandle, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
>                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fixes:
>  - http://autobuild.buildroot.org/results/769021040e5e9293584734e4f461baeaa6dd91cd
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

>  package/avrdude/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
> index 89558a5ff5..cbbd076667 100644
> --- a/package/avrdude/Config.in
> +++ b/package/avrdude/Config.in
> @@ -20,10 +20,10 @@ if BR2_PACKAGE_AVRDUDE
>  config BR2_PACKAGE_AVRDUDE_SPI
>         bool "SPI support"
>         default y # Backward compatibility
> -       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
>
> -comment "SPI support needs a toolchain w/ linux headers >= 4.6"
> -       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
> +comment "SPI support needs a toolchain w/ linux headers >= 4.8"
> +       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
>
>  endif
>
> --
> 2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
