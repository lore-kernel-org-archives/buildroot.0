Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4D4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 12:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F472408B1;
	Mon, 21 Feb 2022 12:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G13alb-vAZfe; Mon, 21 Feb 2022 12:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC09400F3;
	Mon, 21 Feb 2022 12:14:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7720F1BF3BE
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 12:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65424812DF
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 12:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tV6YWjvI-TlD for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 12:14:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BB2A812B4
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 12:14:29 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id g20so17282675vsb.9
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 04:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8rwWjD6Wi/CWAYMJA1Yosu1Gv9ZWxxf/PAzdXIIumH8=;
 b=Ykf4dw+CUYv2vQv1XlG2dZlKr/9ZUuMKUX4oRY7U19OKerArzAyae0+aH9NPopOYEU
 zveyVtb22V/q8D9U6qrMLXNYjSMJaq9h/GHP4NoL+2vJwftS0xON0Vckek8p5kGX/cQu
 2RWFxoCi42b0I7wv8W45llaZfMZAyx8BqwNKg7fUzSdMvQS7acKkSjduae3OcuwyCu1p
 oHJ9BEEuU8FKbJIy1UwoOp0rMmuD/SMlfXiYqkgPaglYCBBHoQ0OFOFm2QbAeH8IHiRT
 VPcrIRoIsPQYLeceF6mixtmiO2vkcYmRk+H+3YlKQA/uPoTrHpmrLWINK36lFKstIM5a
 s+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8rwWjD6Wi/CWAYMJA1Yosu1Gv9ZWxxf/PAzdXIIumH8=;
 b=dbdp1eFnyErmM5TU/5P99DW6PkorpcycXunyah5hEh4Zb4ln/ohqGGUyY5exceBjJs
 TRPLcMIZJkzsnQLThPqt4X+ZBhan9/2TRk7pJlVZKkMowsOg8BFqtXewRyw3qUwjDiCq
 KgXL30VH5dPqjBqoF84WsT9UMq6S/qnbqbdV/H4tHDjvOsdP0dmbBAdSzVhI88uWSsFt
 0JYdWYilHS/++5M5IOth1kimwNcMoyE9XuE1FeAcr8c87edlIzbih+6PqBe4MZl7lOdp
 6J58I4luprA/Goo1zVVzQ9izF6LqE6EIdHpxlfvZ8YIpvR/GX1ykv8tbIlQUngALsuJy
 7tyw==
X-Gm-Message-State: AOAM533wx/hCPqTxfKdIOEU4aFZoajCcHhlMBi6kszN3fP7FlbtOmRsG
 /4d+Xq9cxjJx3Jzcu5rmy8N7xVy84DYzVw==
X-Google-Smtp-Source: ABdhPJyIhOXlTUoTYyElkpkqKUkKmSW92FhIiFaccoqRL+dM9h3z/IhSypoofTfJelLIl+q0TBhaNA==
X-Received: by 2002:a05:6102:3f90:b0:31c:5e0b:2197 with SMTP id
 o16-20020a0561023f9000b0031c5e0b2197mr985062vsv.69.1645445667951; 
 Mon, 21 Feb 2022 04:14:27 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id q11sm3589023vsl.14.2022.02.21.04.14.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 04:14:27 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id 4so7875163uaf.0
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 04:14:27 -0800 (PST)
X-Received: by 2002:ab0:6813:0:b0:342:1541:eb3c with SMTP id
 z19-20020ab06813000000b003421541eb3cmr2695292uar.120.1645445666937; Mon, 21
 Feb 2022 04:14:26 -0800 (PST)
MIME-Version: 1.0
References: <20220221120657.4095013-1-tianyuanhao3@163.com>
In-Reply-To: <20220221120657.4095013-1-tianyuanhao3@163.com>
Date: Mon, 21 Feb 2022 04:14:16 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rguyQV6ewf64DRjaED9V6WS-ks+g3p6PWg2W2k_8jmxQ@mail.gmail.com>
Message-ID: <CA+h8R2rguyQV6ewf64DRjaED9V6WS-ks+g3p6PWg2W2k_8jmxQ@mail.gmail.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: remove unused
 sqlite
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Mon, Feb 21, 2022 at 4:07 AM TIAN Yuanhao <tianyuanhao3@163.com> wrote:
>
> Dependency on sqlite has been removed since v17.04.0-ce.
>
> See: https://github.com/moby/moby/pull/30208
>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/docker-engine/Config.in | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
> index 911cbfe428..1f0efb8fcc 100644
> --- a/package/docker-engine/Config.in
> +++ b/package/docker-engine/Config.in
> @@ -9,7 +9,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
>         select BR2_PACKAGE_CONTAINERD # runtime dependency
>         select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
>         select BR2_PACKAGE_IPTABLES # runtime dependency
> -       select BR2_PACKAGE_SQLITE # runtime dependency
>         help
>           Docker is a platform to build, ship,
>           and run applications as lightweight containers.

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
