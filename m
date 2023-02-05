Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A13C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 111D5605E3;
	Sun,  5 Feb 2023 12:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 111D5605E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9dSUs-WuCEC; Sun,  5 Feb 2023 12:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF29605DB;
	Sun,  5 Feb 2023 12:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFF29605DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7D661BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82ACB4010C
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82ACB4010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kscZFsggO4Qj for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:36:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2923D40106
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2923D40106
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:36:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.17])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8C4542003DC;
 Sun,  5 Feb 2023 13:36:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 13:36:06 +0100
Date: Sun, 5 Feb 2023 13:36:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230205123606.GD2960@scaer>
References: <20230204203750.513283-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230204203750.513283-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675600571;
 bh=SSfOy2akVEXyx9LWlOoJ7NzqaRzCMa8KZzoFLLBmF6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DbJiNypxcBXHGN3bq3jO0pXVJkgiK97DoPa69IJ3KdEn++LHXc+9aOtnQGLiyvm2e
 e2lyTssNETOvgeVNJjQFRhlsUbFXcxH/7z65P8uB86tX/Eqzo9pFb9T0IMw6rgT53x
 Q+9gbR659x9FKtRguuzOUft2lq9uIpet57x6zC27RY1xoiSi/1LVLfw5ezRjuh017K
 VKRHxhkMUvqJ5kh4ztPTGNEPmHSE8xIzR4nWf16TGUNXMgVkPSM0r4Vjy4Dd7agaFe
 5WQrUExWyJTpVgAD1UCIdq2XdAss3UcGQFhBCw/Yea327XJWS72/0lS1SQtKYYAK24
 CH6uLAALiwVsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DbJiNypx
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.13.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-02-04 21:37 +0100, Giulio Benetti spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/a98/a984d275d949e8dc989870d2d2b6f6c7168d52bb/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfuse3/libfuse3.hash | 2 +-
>  package/libfuse3/libfuse3.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
> index 691bfbc9d6..f697f4ad3f 100644
> --- a/package/libfuse3/libfuse3.hash
> +++ b/package/libfuse3/libfuse3.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated sha256 checksums
> -sha256  224544214204eb348b548d6faa7a9bc91b053aacfc92e8b5da3f478c76ae4a03  libfuse3-3.13.0.tar.gz
> +sha256  96399b09b91bc717a9e96ffea660d611e6a342547c1abd4d0e858b3dca9d5a13  libfuse3-3.13.1.tar.gz
>  sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> index d94f7d3d3a..a2e9775868 100644
> --- a/package/libfuse3/libfuse3.mk
> +++ b/package/libfuse3/libfuse3.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBFUSE3_VERSION = 3.13.0
> +LIBFUSE3_VERSION = 3.13.1
>  LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
>  LIBFUSE3_LICENSE = LGPL-2.1
>  LIBFUSE3_LICENSE_FILES = LICENSE
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
