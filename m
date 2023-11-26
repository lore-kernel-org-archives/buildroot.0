Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AED2C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78AF060BEF;
	Sun, 26 Nov 2023 21:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78AF060BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xA0wJlCaug3K; Sun, 26 Nov 2023 21:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAE2D60598;
	Sun, 26 Nov 2023 21:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE2D60598
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 523EA1BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B8698124F
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B8698124F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzWHvPUi9J7D for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:39:11 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 237CC8124B
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 237CC8124B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 65111780372;
 Sun, 26 Nov 2023 22:39:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 22:39:06 +0100
Date: Sun, 26 Nov 2023 22:39:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231126213906.GI3177259@scaer>
References: <20231126192716.14091-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126192716.14091-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701034749;
 bh=tGuWXx4h+3vpsVI1T7qdA+b303mfdJTLCEJo5KFC53E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cbqjq+DPdDeHkrOhi2XMBoGbUDxGDhAz7hoHn1jNoelAs/AW4icU6PgjukXrfNmQJ
 gvIJMlnc8nx1VsmB6HWHuUydKn7U8JhXRhExQA1USfglFdZhki7KILd6tAA6Lzk/mL
 tlSAH/cSYwuIE9lk/yRn4CAdbJNGeQUD1vBhp5EZYe88LTaYFWCK7lg80gQhLWuIm4
 hTryyMZ7avXfl+j0LLr/U1ck3GfCPEXelKcD3JYIpBxLPJDEt7NF3pJWWTZ1Ju2/k2
 YkpDCy0NVZ0YMzCi6k5mpaXMlIJD8TPYIyF+0AvJKpJ7rcak6VKzWsLvgZG+yI8UpU
 I8YPG8035j0Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cbqjq+DP
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: bump to version
 2023-09-26
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-11-26 20:27 +0100, Giulio Benetti spake thusly:
> With this version we can build with Linux 6.7.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rtl8821cu/rtl8821cu.hash | 2 +-
>  package/rtl8821cu/rtl8821cu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
> index c98fd6234f..3d7a1be9d1 100644
> --- a/package/rtl8821cu/rtl8821cu.hash
> +++ b/package/rtl8821cu/rtl8821cu.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  8e155db366b5a97bc629534131e4fe1e29b455aa0ec9e1f42af23a9b6f610107  rtl8821cu-de36dfeff890086a9f30cd0052715fbaa9554087.tar.gz
> +sha256  5226fefd72d2dd2b8048a8d836f731139ddcb9a34eab68e9b07acee6ee5d8553  rtl8821cu-eb52ece92607394ecc22e96b41671ec3e5b1fa30.tar.gz
>  sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
> diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
> index 09fca49eb3..8f344d518f 100644
> --- a/package/rtl8821cu/rtl8821cu.mk
> +++ b/package/rtl8821cu/rtl8821cu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8821CU_VERSION = de36dfeff890086a9f30cd0052715fbaa9554087
> +RTL8821CU_VERSION = eb52ece92607394ecc22e96b41671ec3e5b1fa30
>  RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
>  RTL8821CU_LICENSE = GPL-2.0
>  RTL8821CU_LICENSE_FILES = LICENSE
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
