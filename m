Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C201C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A3360F5E;
	Sun, 29 Oct 2023 08:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A3360F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3SBSUtroRKX4; Sun, 29 Oct 2023 08:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9302560AF1;
	Sun, 29 Oct 2023 08:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9302560AF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC361BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63CF884C1C
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63CF884C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7XJcua6MJhM for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:43:20 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E9EE84C1A
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E9EE84C1A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B354120041D;
 Sun, 29 Oct 2023 09:43:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:43:16 +0100
Date: Sun, 29 Oct 2023 09:43:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231029084316.GL687180@scaer>
References: <20231027050817.17828-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027050817.17828-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698568998;
 bh=sK5IGJjMmGvvg9X9bGvfX6iYFImrOfhT9dI1paXpLR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dfefZ7/vJNTOHXAoPy6LPpRsW1hQ5c1+5FNUi6S/w12WS/8K9WagWs9KJom3LMqSS
 K7OOxU2gf0xNMVAG/cB1kXgBrKTU4YXnOhBLKFQqJU5bRh0AeSA2HFJo1mQOISvkEq
 fns8HmUZUWnw3JQu+zplZfvtE0tQha1h0QYzRZPAbvt3yypB6sJFGOkEb4G9EDggw9
 5vUZ6hDNpVMoT1qpB02u1qo55c3p6J5jnwLwcAWWqkwKxGIRgd5SgMzDnkO1KlPSWB
 AybrMh+u+HBBXdyzlJx00FrhOrSB17Nfz1b9MHycImt13QZRsMN2tj2RbnVLmm2tJA
 2CRod9bQV0J1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dfefZ7/v
Subject: Re: [Buildroot] [PATCH 1/1] package/onevpl-intel-gpu: bump version
 to 23.4.0
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

Bernd, All,

On 2023-10-27 07:08 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/onevpl-intel-gpu/onevpl-intel-gpu.hash | 2 +-
>  package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
> index fa25c507eb..5f7728e5f9 100644
> --- a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
> +++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  9de6bfd17259b7434f2bb4fb6d2874decf9b1d4587ec9b90d91188049921e32f  onevpl-intel-gpu-23.3.4.tar.gz
> +sha256  0939232daa2ef3e35b453e4aa0d25674a9b2376b4ef814fb64712cf587654787  onevpl-intel-gpu-23.4.0.tar.gz
>  sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
> diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
> index c7c557e9e2..8c9275fe75 100644
> --- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
> +++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ONEVPL_INTEL_GPU_VERSION = 23.3.4
> +ONEVPL_INTEL_GPU_VERSION = 23.4.0
>  ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
>  ONEVPL_INTEL_GPU_LICENSE = MIT
>  ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
> -- 
> 2.39.2
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
