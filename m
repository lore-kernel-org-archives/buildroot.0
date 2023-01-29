Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65EBC61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 15:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 873A060B49;
	Sun, 29 Jan 2023 15:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 873A060B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XjD36DQOaFHs; Sun, 29 Jan 2023 15:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA43960AED;
	Sun, 29 Jan 2023 15:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA43960AED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA931BF3DB
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 15:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 245D760AED
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 15:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 245D760AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ra2FSIGbvMDi for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 15:33:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC9E460ACA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC9E460ACA
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 15:33:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CAD445FF96;
 Sun, 29 Jan 2023 16:33:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 16:33:24 +0100
Date: Sun, 29 Jan 2023 16:33:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230129153324.GG2632@scaer>
References: <20230129114147.2504-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129114147.2504-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675006408;
 bh=rJl2lnBOazhMzAUmTUR9zjsUZYnYCCwy0tVQ60t0OSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E1iqU17yS9x5c3DE7QQnFZBHqtl+4d3oX8mA3QnUtppn2oPIqtTj2VLK5mj2mU8+q
 8NpTbJuNOpySOYQv9u/DN6cQJni7sWXvcmTYGnjZs81DgRKdBbG9vDlfwhI1U4XFvw
 pi3jkGMTkH+pU58AUdjSM9Jp0rkd1gssYPMKE/hPVAREtGqpUqnFUZPuH0iSAf2DM2
 zTF1U4nk+49pkW7lN8D/tcwbheBF7wiWUw+uxYPIHQrT/FcdEabci6gF6FNiov0Yvr
 /8bsGNd0qBNHR8zQCB55K7uxRD7wnhYFNBxuCBIO0A4gXSV1RBYB3ttBPkSAXxFQSn
 IOiW/onnAwfhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E1iqU17y
Subject: Re: [Buildroot] [PATCH 1/1] package/ttyd: bump to version 1.7.3
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yuanhao, All,

On 2023-01-29 11:41 +0000, TIAN Yuanhao spake thusly:
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ttyd/ttyd.hash | 2 +-
>  package/ttyd/ttyd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
> index a2a933b63a..85bd71ba2d 100644
> --- a/package/ttyd/ttyd.hash
> +++ b/package/ttyd/ttyd.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  edc44cd5319c0c9d0858081496cae36fc5c54ee7722e0a547dde39537dfb63de  ttyd-1.7.2.tar.gz
> +sha256  c9cf5eece52d27c5d728000f11315d36cb400c6948d1964a34a7eae74b454099  ttyd-1.7.3.tar.gz
>  sha256  8b7e100f8311cb428c57609164d93099bada2599f948359045d1ac876a7a625b  LICENSE
> diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
> index 085511b5fd..d17e21d60b 100644
> --- a/package/ttyd/ttyd.mk
> +++ b/package/ttyd/ttyd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TTYD_VERSION = 1.7.2
> +TTYD_VERSION = 1.7.3
>  TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
>  TTYD_LICENSE = MIT
>  TTYD_LICENSE_FILES = LICENSE
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
