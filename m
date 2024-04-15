Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D842CC4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 16:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A31D980FB0;
	Mon, 15 Apr 2024 16:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmOEiFTQinJz; Mon, 15 Apr 2024 16:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 918268100D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 918268100D;
	Mon, 15 Apr 2024 16:29:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D31AB1BF298
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFB8A8100D
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtLdcugzfv6H for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 16:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 738D080FB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 738D080FB0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 738D080FB0
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 16:29:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E9CB413F8AD;
 Mon, 15 Apr 2024 18:29:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Apr 2024 18:29:06 +0200
Date: Mon, 15 Apr 2024 18:29:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <Zh1V0mefvmCh8RCj@landeda>
References: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
 <20240414130520.3647875-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240414130520.3647875-3-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713198551;
 bh=z3kAoVLYO0p4FJsv3rqGFPOYSb2JyyoxFIB2y90kRww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JUPkmAWX0xj0ublnER4P7vQP29F/oQPtwkBtEC5Wy/f58NtRQtumkiKn6KcM4PgIl
 pgGeJLq3o9TlLsJT+q6wVldjy+UkmUjiso8jIcRpZ7zDYeuvSPhblOsQHi+qWgEKtI
 xTdf8ONiGRAsxjyrOHBRZoB4AezSsZ1x7AVuwPB+raFGP43Ist6z4ONbvsi1zM3brg
 fB+kC9L45Xm9YeWK9Gdmv7eXSRWCS89mJxsPJonzZaSub5Z+VIPtF+kBnoRjQSo544
 NquILGTg5AwYOQOadeMRiRvskxXG3Nd4zEP1uT0Y984ji68hqxEwM34kIXuLy85gou
 NKa+JEjTIwGTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JUPkmAWX
Subject: Re: [Buildroot] [PATCH v2 3/3] package/bmap-tools: bump to version
 3.8.0
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
Cc: linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-04-14 15:05 +0200, Dario Binacchi spake thusly:
> Note that, although not explicitly specified in the changelog, version
> 3.7 renamed the file COPYING to LICENSE, requiring corresponding changes
> in Bildroot related to the license file (specifically, the name and hash).
> 
> Release notes:
> 
> - bmap-tools 3.7:
>   * Use GitHub Actions for CI (#109)
>   * Add `poetry` for dependency management and `black` for code
>     formatting (#104)
>   * Add functionality for copying from standard input (#99)
>   * Switch from gpg to gpgme module (#103)
> 
> - bmaptool 3.8.0:
>   * use 'df -P' for POSIX portable output
>   * bmaptool has new maintainers
>   * bmaptool has a new home
>   * bmaptool is now only called 'bmaptool' and not one of a dozen such
>     variations
>   * switch to use an X.Y.Z versioning number scheme
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Whole series of 3 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Changes v1 -> v2:
> - Refactored based on the changes applied to version 2 of the previous patch:
>   v2-0002-package-bmap-tools-rename-Kconfig-prompt-to-bmapt.patch
> 
>  package/bmap-tools/bmap-tools.hash | 4 ++--
>  package/bmap-tools/bmap-tools.mk   | 6 ++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmap-tools/bmap-tools.hash
> index 82a570ecacdb..28a68e8b8ebb 100644
> --- a/package/bmap-tools/bmap-tools.hash
> +++ b/package/bmap-tools/bmap-tools.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  0658afb972e7221aa16fece3f84e29e5102e901c929253d7fb6040bde28243f7  bmap-tools-3.6.tar.gz
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  3c741ccdd5049b5cb6983bc186f7be8040a132ed7e9c2afda4d9e7390888163c  bmap-tools-3.8.0.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
> index 69a22c4745ab..3455063e218c 100644
> --- a/package/bmap-tools/bmap-tools.mk
> +++ b/package/bmap-tools/bmap-tools.mk
> @@ -4,11 +4,13 @@
>  #
>  ################################################################################
>  
> -BMAP_TOOLS_VERSION = 3.6
> +BMAP_TOOLS_VERSION = 3.8.0
>  BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
>  BMAP_TOOLS_LICENSE = GPL-2.0
> -BMAP_TOOLS_LICENSE_FILES = COPYING
> +BMAP_TOOLS_LICENSE_FILES = LICENSE
>  BMAP_TOOLS_SETUP_TYPE = setuptools
> +BMAP_TOOLS_DEPENDENCIES = host-python-poetry-core
> +HOST_BMAP_TOOLS_DEPENDENCIES = host-python-poetry-core
>  
>  $(eval $(python-package))
>  $(eval $(host-python-package))
> -- 
> 2.43.0
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
