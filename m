Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F4DC77B73
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 19:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8190C845EC;
	Sat, 15 Apr 2023 19:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8190C845EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nciv0tvsBYUq; Sat, 15 Apr 2023 19:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3E99845E6;
	Sat, 15 Apr 2023 19:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3E99845E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABA521C4027
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 19:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 928A3845D2
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 19:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 928A3845D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FB9QnoRdF8bv for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 19:20:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F06EE845D0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F06EE845D0
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 19:20:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 087E85FF33;
 Sat, 15 Apr 2023 21:20:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 21:20:33 +0200
Date: Sat, 15 Apr 2023 21:20:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230415192033.GT2819@scaer>
References: <20230404185720.123801-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404185720.123801-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681586436;
 bh=r8ym5CkPwSL14aYL6Xj2Whni1NNPKfgbVgmoQsUPl20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rv3x+4RQmgjYObR9pvCfWBJzo8Iq8VsGRj0NYqqgITIjJ9LwsIknRA6jMyjWaEUmY
 3U5OZxUesasafWyB0wzKBZteZ+ZhvX49h+LLOosZcdKQahfZH9WyFcxVGgpvoybzSm
 24X0kyVOadofKvRKF5dk+FocBP6PMx8vLX82N8bZgyEfyBMCxQaDCU0D5Vs8TvWVBZ
 MDgRF0vK+PuUQjkUCEcSt94nEsF2yEsKoAUfYr7Z4kKxqHC2oMz+Yc73wewAEjXe5f
 DdysID5EF186YAPN9ts3Sw3eoMlNDhL+frzFTWVCmUdbQ1LpdcbksFkNsawAez8feV
 hFU94rA4qAebA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rv3x+4RQ
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump to version
 2023-04-04
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

Giulio, All,

On 2023-04-04 20:57 +0200, Giulio Benetti spake thusly:
> This versions fixed build failure on Linux 6.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mali-driver/mali-driver.hash | 2 +-
>  package/mali-driver/mali-driver.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
> index 5d32c1af8a..de3b6e69f0 100644
> --- a/package/mali-driver/mali-driver.hash
> +++ b/package/mali-driver/mali-driver.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  761e3f000b4c546cbd35baf34f5a0d1090f048dd44ee543773674192fd95f6b3  mali-driver-87c13e6994b20b5068e3a5e4f4c1b64db666a4c8.tar.gz
> +sha256  763d3cf76eb03584df6a13986a2877dc0ae5f310fc3d91e8a498fc5f89271dcc  mali-driver-c90627f78d58567a2acb7cbf77d565e03a131294.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
> index bdc9fedeb4..8e059fe8bd 100644
> --- a/package/mali-driver/mali-driver.mk
> +++ b/package/mali-driver/mali-driver.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MALI_DRIVER_VERSION = 87c13e6994b20b5068e3a5e4f4c1b64db666a4c8
> +MALI_DRIVER_VERSION = c90627f78d58567a2acb7cbf77d565e03a131294
>  MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
>  MALI_DRIVER_DEPENDENCIES = linux
>  MALI_DRIVER_LICENSE = GPL-2.0
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
