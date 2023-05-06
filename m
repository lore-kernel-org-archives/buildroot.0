Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8CFC77B75
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D40E427AB;
	Sat,  6 May 2023 16:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D40E427AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGIwT7ojjdGs; Sat,  6 May 2023 16:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E73784281A;
	Sat,  6 May 2023 16:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E73784281A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 235801BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F103982272
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F103982272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9Ih8h26AunR for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:11:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFBA58216C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFBA58216C
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:11:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4F2FAB0057C;
 Sat,  6 May 2023 18:11:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 18:11:26 +0200
Date: Sat, 6 May 2023 18:11:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230506161126.GT252090@scaer>
References: <20230504072226.3443740-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504072226.3443740-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683389489;
 bh=XVREwJGTWRI6MHiRdtvqwMlt/OI0hU2UbETWBOHMWXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gHe7jm/LAI4e85hN3xvOpBZMknHo7koH2GKZbh2560xaQssIaXEPiUWis6IVEI3oW
 cfmcYjp0FXhuR25KXea3lIQCZihuEVJ2O0QOprqgxDWAxviMWGcPm3bTRdl7NhnHPa
 VnPHqO+fUVYodsPzEZgzaqoB7jNk+he7mGFGwUoZi0BpVD2l+LLej9Fs7jXDTqiHzs
 CXv8dLo/xFGFwHPDA/UQgpy0kZjJbwZNiD75kDwxlJOen53/dZ60cCcoB22ejGF3eA
 2ugTCjbVUUrvWdL3odi1F9loGRfzLmsMKrMtpzlPOUfe0gIDZh1B4OIlsZDEFgI3pI
 dblvW9QzyTtvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gHe7jm/L
Subject: Re: [Buildroot] [PATCH v3 1/1] package/fuse-overlayfs: bump version
 to 1.11
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Chritian, All,

On 2023-05-04 00:22 -0700, Christian Stewart via buildroot spake thusly:
> https://github.com/containers/fuse-overlayfs/releases/tag/v1.11
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> v1 -> v2:
> 
>  - fix filename in hash file
> 
> v2 -> v3:
> 
>  - fix hash in hash file
>  - apologies for all the revisions: was a mix-up between multiple branches
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
>  package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
> index aa5438755e..b8df6c88a5 100644
> --- a/package/fuse-overlayfs/fuse-overlayfs.hash
> +++ b/package/fuse-overlayfs/fuse-overlayfs.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  4351eaed7cf26a5012c14c6e0fc883ef65a7b5dcc95ba129ce485904106c25a9  fuse-overlayfs-1.10.tar.gz
> +sha256  320a411425414679736dcb7f3b05146430ca4af20ded0096c69ac3c7540ebca2  fuse-overlayfs-1.11.tar.gz
>  # Locally computed
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
> index 1633d3bd41..4db2ccd7d5 100644
> --- a/package/fuse-overlayfs/fuse-overlayfs.mk
> +++ b/package/fuse-overlayfs/fuse-overlayfs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FUSE_OVERLAYFS_VERSION = 1.10
> +FUSE_OVERLAYFS_VERSION = 1.11
>  FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
>  FUSE_OVERLAYFS_LICENSE = GPL-3.0
>  FUSE_OVERLAYFS_LICENSE_FILES = COPYING
> -- 
> 2.40.1
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
