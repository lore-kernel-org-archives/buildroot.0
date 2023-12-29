Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112E9C4706F
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9CB7436F6;
	Fri, 29 Dec 2023 21:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9CB7436F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvjvaO1vTvBm; Fri, 29 Dec 2023 21:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C3E3436E5;
	Fri, 29 Dec 2023 21:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C3E3436E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A31E1BF288
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FFFD402BC
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FFFD402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M16W2JeRBu6u for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:18:44 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12F6F402B9
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12F6F402B9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5442CB00548;
 Fri, 29 Dec 2023 22:18:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Dec 2023 22:18:40 +0100
Date: Fri, 29 Dec 2023 22:18:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZY83sNIL1ut21xB2@landeda>
References: <20231226153244.527793-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226153244.527793-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703884722;
 bh=ayT146/NG1W2P0cOgXiMfBV7TI7eHhORl/rBGuVBwG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U26m2mdzXn/csd1JHIMIU+lm1x7H9If2TFyLvcTIOTVCP8B1KZJGJ+j3wl9WYZj6E
 hgwL+yKJlVrBsPXVLDVyv1R6+QKqQFa71x0z81jvfjiKSqVBzrzHoxgn2pnje3gAtw
 1ICN8z6Ab4wP/52OM2XQyfAGFGGooD4SPAVVcO04FW+mpct1njv9KdfCF4awvFoHfo
 /DRONXdI3I4qpb6J+F/eYxQlmpAc6j9TnOcsQxLt92cEfiX5cICogV2IoTA5n5r+tH
 NYXPHrbjmcUpKNf/bofcgD4pfKobRz0dHH2vpqDaKEiEwngTZjKiby/yAzFG/teFKO
 9z/utSBhtRtKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U26m2mdz
Subject: Re: [Buildroot] [PATCH 1/1] package/assimp: bump to version 5.3.1
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

Fabrice, All,

On 2023-12-26 16:32 +0100, Fabrice Fontaine spake thusly:
> https://github.com/assimp/assimp/releases/tag/v5.3.1
> https://github.com/assimp/assimp/releases/tag/v5.3.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, along with all the following patches doing version
bumps, up to and including the wavpack bump. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/assimp/assimp.hash | 2 +-
>  package/assimp/assimp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
> index 86a90927ed..79415706f9 100644
> --- a/package/assimp/assimp.hash
> +++ b/package/assimp/assimp.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  b5219e63ae31d895d60d98001ee5bb809fb2c7b2de1e7f78ceeb600063641e1a  assimp-5.2.5.tar.gz
> +sha256  a07666be71afe1ad4bc008c2336b7c688aca391271188eb9108d0c6db1be53f1  assimp-5.3.1.tar.gz
>  sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
> diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
> index 0b6034fb8e..2765cc7171 100644
> --- a/package/assimp/assimp.mk
> +++ b/package/assimp/assimp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASSIMP_VERSION = 5.2.5
> +ASSIMP_VERSION = 5.3.1
>  ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
>  ASSIMP_LICENSE = BSD-3-Clause
>  ASSIMP_LICENSE_FILES = LICENSE
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
