Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD791C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69D18400C1;
	Wed,  7 Feb 2024 09:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKDfpPS57CV2; Wed,  7 Feb 2024 09:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0189640297
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0189640297;
	Wed,  7 Feb 2024 09:56:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D87D1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ADDE833CB
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0r76SnmM9Lbt for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4926783339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4926783339
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4926783339
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:56:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8DAA313F8D6;
 Wed,  7 Feb 2024 10:56:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 10:56:10 +0100
Date: Wed, 7 Feb 2024 10:56:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZcNTut8WZPcPbLfl@landeda>
References: <20240206175330.570115-1-dario.binacchi@amarulasolutions.com>
 <20240206175330.570115-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206175330.570115-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707299775;
 bh=o6bC80vEiIJUNPdsFlYEnXisHCAFuI1VQm/n9XTCMmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CWgtaSvjkVxitLDSTT2hplLOzWkGpK/OsRvvyMruNEJ5agw89rcN7rthemCaaDZQO
 5EtXzJ3FwVYv9CbwYjKLSjNrQWGjTAX3+UmZgLFKB9VkCxLdBwHefYbBJ+ChnFQOGT
 CnFHsuHUWyhgSOb1kMIMH34YGF+o449npMuuSDzCINsPVHIdA/h8Zev9Su++0t2tzF
 ITZVQgtI8Rd8K3ZtHVL0suDFftca8SnQuWbKbQoGXEtqvpLhAMxCDXL6GZjhzGYoAw
 mgODMZjVvgbZSmKh2dlR3B+9aGfWbFB5pCssQmJHY7KnvwBvROJR4Ds3ylySHMBVDJ
 NDp4FQHXuu8PA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CWgtaSvj
Subject: Re: [Buildroot] [PATCH 2/2] package/uuu: bump to version 1.5.165
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-02-06 18:53 +0100, Dario Binacchi spake thusly:
> It requires the host-tinyxml2 package.
> 
> The hash of README.md has changed because a reference to the tinyxml2
> license has been added:
> 
>     + - tinyxml (zlib license) is from https://github.com/leethomason/tinyxml2

Thanks for explaining the hash change. :-)

I wonder if it really makes sense to keep using the README file as a
license file in Buildroot. Indeed, the licensing terms are for
third-party libraries uuu links to, and even though they are bundled in
the source tree of uuu|mfgtools, they are not used by Buildroot as we
use the ones we build.

Thoughts?

> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.163
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.165
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/uuu/uuu.hash | 4 ++--
>  package/uuu/uuu.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
> index 20816b5081db..c231d5d729f0 100644
> --- a/package/uuu/uuu.hash
> +++ b/package/uuu/uuu.hash
> @@ -1,4 +1,4 @@
>  # locally computed
> -sha256  6972c7a1e76d60a22212913a8867b737104410c2a47ad88c8af460bd4885ec09  uuu_source-uuu_1.5.141.tar.gz
> +sha256  6e65fc028afacc94b805ae376e3da3864dcb2570d425037820e716207ab70373  uuu_source-uuu_1.5.165.tar.gz
>  sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
> -sha256  2d872c6e5aaea15ec1932bfb378fb62e24ee7ec399fe7f998f03d9b728215335  README.md
> +sha256  1b3d030a1824d633f75194743bd92bc1ed2d9a4bf1915bc11e49bf4c0c54012d  README.md
> diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
> index 93c748ee46d8..d1bae61f528e 100644
> --- a/package/uuu/uuu.mk
> +++ b/package/uuu/uuu.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -UUU_VERSION = 1.5.141
> +UUU_VERSION = 1.5.165
>  UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
>  UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
>  UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
>  UUU_LICENSE_FILES = LICENSE README.md
> -HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd
> +HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd host-tinyxml2
>  
>  $(eval $(host-cmake-package))
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
