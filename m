Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C4CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9036D405AB;
	Sat,  1 Jan 2022 10:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wp2BMgrVBiun; Sat,  1 Jan 2022 10:04:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95A9B404C5;
	Sat,  1 Jan 2022 10:04:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4E711BF263
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF726401FF
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfhvsTPi0lFT for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:04:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18055401EB
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:04:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9C7B55FF10;
 Sat,  1 Jan 2022 11:03:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641031438;
 bh=i+cA22GXgLhEqQiMZVYaiGGdARJ3QOS05mJDLsa4wi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aVaU7f4A6N2L+ZR9nL458RIjUp4pD0gdy8JTobh5pUt5ONSLR674Rg9FFNMHPoXQu
 f5p+ozuVRSMx4AwJ7IjPt57CV93gV4vNupIpVwlQ8i1U4E+X5ZeHVK0WzPxDDdFLpD
 x0knlsj2Qaj98ugpj8XVGGQ6DabDHuGzgZGp+pB51rabqqdgdomc5eAVHs3lYsUGwf
 CgP2FNZcS6wm311ZAWV+bcL8yGXnCNVDXbZnjRXSZDYLLXf091nwWjmqsm04/zolNt
 zD4L/Nu+yNnVGbJhkHb+UwIxMWZ9QP9uW4WgsXOv7OluUMdnMG68TWDmiO1n+vHKU5
 rtxkDLiWM2KVw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 11:03:52 +0100
Date: Sat, 1 Jan 2022 11:03:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20220101100352.GT3390456@scaer>
References: <20211231230422.955804-1-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211231230422.955804-1-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libimxvpuapi: depend on
 host-python3
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
Cc: Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2021-12-31 15:04 -0800, Adam Duskett spake thusly:
> This package builds just fine with python3.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

I've rephrased the title, and applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libimxvpuapi/libimxvpuapi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
> index a2a3b21105..d8f214b9e0 100644
> --- a/package/libimxvpuapi/libimxvpuapi.mk
> +++ b/package/libimxvpuapi/libimxvpuapi.mk
> @@ -8,7 +8,7 @@ LIBIMXVPUAPI_VERSION = 0.10.3
>  LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
>  LIBIMXVPUAPI_LICENSE = LGPL-2.1+
>  LIBIMXVPUAPI_LICENSE_FILES = LICENSE
> -LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
> +LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python3 imx-vpu
>  LIBIMXVPUAPI_INSTALL_STAGING = YES
>  LIBIMXVPUAPI_NEEDS_EXTERNAL_WAF = YES
>  
> -- 
> 2.33.1
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
