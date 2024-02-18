Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3776DC48BF8
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 19:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B739E820E9;
	Sun, 18 Feb 2024 19:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWxZF20ebJfX; Sun, 18 Feb 2024 19:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F000820A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F000820A5;
	Sun, 18 Feb 2024 19:13:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4D611BF83B
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 19:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1AC3820A5
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 19:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8oEun2fvI9vT for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 19:13:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40F3F820A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40F3F820A4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40F3F820A4
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 19:13:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7668613F86E;
 Sun, 18 Feb 2024 20:13:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Feb 2024 20:13:12 +0100
Date: Sun, 18 Feb 2024 20:13:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZdJWyBd5GjwsYC80@landeda>
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
 <20240218184536.1922309-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240218184536.1922309-3-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708283603;
 bh=Qil+4ghEfv3uMWrTp+fpyRersq4uGLhHquEbH85NS6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lyw4EWY8ZmbezqAUoEbxy6WZG9lwHqBCy3esu2xJJUwPWL05kzx+WzfPlyUug2Cgc
 wVNVSfoRWe8oUV8V3nJbu8imShKEyhFnnhA8hOl3g6pcosQIbFxV6AOQZgaxIMM967
 TutEBuFxb3lmN9vP/ITYs/WsUW56GaSzxqjHXRHnfZryo0e6M/5zLZYg6rRI0blByt
 /HqFN2d67FeXGPjpb+MGi2hBifDg5i8/ZFtqNSOCedYXeqX6ZR6SI5mpY8so314ZVT
 4J11Zgf7WaWcCeVhxRGB7xw5leRhEiJdbWjyyOH/wKLkc3UY1lXvN8frWjOyP5lDKB
 rpfLiDs+eq5Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lyw4EWY8
Subject: Re: [Buildroot] [PATCH 2/8] package/gdal: drop nios2 binutils bug
 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2024-02-18 19:45 +0100, Giulio Benetti spake thusly:
> Now that binutils patch has been backported to every Buildroot binutils
> version we can drop nios2 binutils bug 27597 dependency.

What about external pre-built toolchains?

Comment valid for all the patches in this series...

Regards,
Yann E. MORIN.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/gdal/Config.in | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/gdal/Config.in b/package/gdal/Config.in
> index 24a1f06af2..839a1bd7ea 100644
> --- a/package/gdal/Config.in
> +++ b/package/gdal/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_GDAL
>  	# configure can't find proj, when linking statically
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
> -	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
>  	depends on BR2_USE_WCHAR # proj
>  	select BR2_PACKAGE_GIFLIB
> @@ -26,9 +25,8 @@ config BR2_PACKAGE_GDAL
>  
>  	  https://gdal.org/
>  
> -comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 27597, threads, wchar"
> +comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
> -		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
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
