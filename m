Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04919C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B333241756;
	Mon,  5 Feb 2024 22:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B333241756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQLq2Mk9z_UW; Mon,  5 Feb 2024 22:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA492416CE;
	Mon,  5 Feb 2024 22:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA492416CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 754271BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B7B660D68
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B7B660D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJ3eG_L09D7d for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:47:29 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84E8F60BB7
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84E8F60BB7
Received: from ymorin.is-a-geek.org (unknown [194.78.211.220])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AE38519F58A;
 Mon,  5 Feb 2024 23:47:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 23:47:23 +0100
Date: Mon, 5 Feb 2024 23:47:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <ZcFlexHTtVJwXb1j@landeda>
References: <20240205203521.201702-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240205203521.201702-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707173247;
 bh=ylv2d3dVOdKQZqlxcoytn8HDF0+658AxKUcSO1XYPXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZuQSRyheVHtsTM4VrC5B+ZZN0FzvYCot0eUUrGRAya11O3q/SReswBiw/8xH6eB14
 VyDbH1VfhyFoRRVg+gXRctGVNYi6ESeIQxIYirWNuOfwTK8Ofg+f0DcLAa5VBABWIm
 wciSZYmyCdWc2nmIoFUpNJS19B3Ku/A4qdMyiH48OFReVrWpKpfyOXjO9E3aT1IS8P
 jfxE/Uxod9nt8342veY1lDAcBjOA4OSYq1jXZ+7y02uRp5bOeZWyaGoo0NScimco4C
 dhz6UIRAxtsOmeF5T7jUM8acG3Q//J7d2FffNCAYkDrFGxuaub15TgzazdTt0f4Cg3
 d/5Xy8ePuzQAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZuQSRyhe
Subject: Re: [Buildroot] [PATCH] package/re2: bump to version 2024-02-01
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

Michael, All,

On 2024-02-05 21:35 +0100, Michael Nosthoff via buildroot spake thusly:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/re2/re2.hash | 2 +-
>  package/re2/re2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/re2/re2.hash b/package/re2/re2.hash
> index 5f590aba6e..543c416087 100644
> --- a/package/re2/re2.hash
> +++ b/package/re2/re2.hash
> @@ -1,3 +1,3 @@
>  # locally calculated
> -sha256  4e6593ac3c71de1c0f322735bc8b0492a72f66ffccfad76e259fa21c41d27d8a  re2-2023-11-01.tar.gz
> +sha256  cd191a311b84fcf37310e5cd876845b4bf5aee76fdd755008eef3b6478ce07bb  re2-2024-02-01.tar.gz
>  sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
> diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> index b81a64f2e9..b962b53e3f 100644
> --- a/package/re2/re2.mk
> +++ b/package/re2/re2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RE2_VERSION = 2023-11-01
> +RE2_VERSION = 2024-02-01
>  RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
>  RE2_LICENSE = BSD-3-Clause
>  RE2_LICENSE_FILES = LICENSE
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
