Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721D8C4167B
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20119420E5;
	Sat, 28 Oct 2023 19:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20119420E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCTvUmHpCKke; Sat, 28 Oct 2023 19:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4569042115;
	Sat, 28 Oct 2023 19:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4569042115
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5F31BF3C6
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04F8361004
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04F8361004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_h8n12n9PeI for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:32:54 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FE89605E0
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE89605E0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4BE3C2003AE;
 Sat, 28 Oct 2023 21:32:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Oct 2023 21:32:50 +0200
Date: Sat, 28 Oct 2023 21:32:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231028193250.GG2582@scaer>
References: <20231027130738.1939583-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027130738.1939583-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698521572;
 bh=0F7T/BayOKYNOSto58onlc3go2vaoAWcB3oWfoXkdRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ELzR8A2F/zDj2+vf8r2vdpoxOXItCbIHIoeEhUfncKHI91yB7fbgh83q0gXaL59nU
 OU64uuuR/Sxgsl9QRcu0+bu5qatlma4lBKvwHrmqaF3jlF+mtbjCHisvqb8cU7+Z7F
 jK3CrKf7eGloYwzFo/aj7V7YLYwyTNI1FMvGsLpwVh/zuNOjWWiiZ3keNFE2ca3PBk
 gjPbjexGsC92Ttvjo1HxKmQD0arS1k/XjSTa8DnljAeEcAgHHtpTLrgjyKNJYGayx2
 C97P2+LXirzayR9G3ruOCiB1RU5utKheF0n2mL/wZEE8lA7Xzu6g1LggtK9GVcKUxf
 azF9XOZwLj2Sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ELzR8A2F
Subject: Re: [Buildroot] [PATCH] package/dfu-programmer: bump version to
 1.1.0
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

Peter, All,

On 2023-10-27 15:07 +0200, Peter Korsgaard spake thusly:
> The update-bash-completion.sh issue is now fixed, so remove the workaround:
> 
> https://github.com/dfu-programmer/dfu-programmer/pull/91
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dfu-programmer/dfu-programmer.hash |  2 +-
>  package/dfu-programmer/dfu-programmer.mk   | 10 +---------
>  2 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/package/dfu-programmer/dfu-programmer.hash b/package/dfu-programmer/dfu-programmer.hash
> index afa1d97aed..7260dfce0d 100644
> --- a/package/dfu-programmer/dfu-programmer.hash
> +++ b/package/dfu-programmer/dfu-programmer.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  867eaf0a8cd10123715491807ab99cecb54dc6f09dddade4b2a42b0b0ef9e6b0  dfu-programmer-1.0.0.tar.gz
> +sha256  844e469be559657bc52c9d9d03c30846acd11ffbb1ddd42438fa8af1d2b8587d  dfu-programmer-1.1.0.tar.gz
>  sha256  d8fb44c26fecbb2b8a368a6c0ed4f5478a401fab03744325407736a80383af76  COPYING
> diff --git a/package/dfu-programmer/dfu-programmer.mk b/package/dfu-programmer/dfu-programmer.mk
> index 707e143eb3..4e5f2299d6 100644
> --- a/package/dfu-programmer/dfu-programmer.mk
> +++ b/package/dfu-programmer/dfu-programmer.mk
> @@ -4,20 +4,12 @@
>  #
>  ################################################################################
>  
> -DFU_PROGRAMMER_VERSION = 1.0.0
> +DFU_PROGRAMMER_VERSION = 1.1.0
>  DFU_PROGRAMMER_SITE = https://github.com/dfu-programmer/dfu-programmer/releases/download/v$(DFU_PROGRAMMER_VERSION)
>  DFU_PROGRAMMER_LICENSE = GPL-2.0+
>  DFU_PROGRAMMER_LICENSE_FILES = COPYING
>  DFU_PROGRAMMER_DEPENDENCIES = libusb
>  
> -# No update-bash-completion.sh in tarball. Fix sent upstream:
> -# https://github.com/dfu-programmer/dfu-programmer/pull/91
> -define DFU_PROGRAMMER_ADD_MISSING_FILE
> -	ln -s /bin/true $(@D)/update-bash-completion.sh
> -endef
> -
> -DFU_PROGRAMMER_POST_PATCH_HOOKS == DFU_PROGRAMMER_ADD_MISSING_FILE
> -
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  DFU_PROGRAMMER_CONF_OPTS += LIBS=-latomic
>  endif
> -- 
> 2.30.2
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
