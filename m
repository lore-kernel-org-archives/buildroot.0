Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC8AEB64DD
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 09:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 709D860EA1;
	Wed,  9 Aug 2023 09:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 709D860EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N1F9dOGhQdUZ; Wed,  9 Aug 2023 09:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4F2560B77;
	Wed,  9 Aug 2023 09:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4F2560B77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1C881BF34B
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 09:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B89384026F
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 09:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B89384026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2h1tDlYlFn1m for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 09:17:40 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E675A400BB
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 09:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E675A400BB
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 85551440852;
 Wed,  9 Aug 2023 12:17:13 +0300 (IDT)
References: <20230809083328.1348-1-nicolas.cavallari@green-communications.fr>
User-agent: mu4e 1.9.21; emacs 28.2
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed, 09 Aug 2023 12:17:14 +0300
In-reply-to: <20230809083328.1348-1-nicolas.cavallari@green-communications.fr>
Message-ID: <87bkfg4lsj.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1691572633;
 bh=WjUJ/7AGYWkDUq+QmDem0XO9GO8gQoaCA69czoMofLw=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=KGDzptcW/S6DDpNL4NTtxD1g4Em94sA1yg9YSNkl/JuA3LX9r9nuWPPqPddTDKB3T
 uu1chsTVE/xTarJG1fgiHbZZjC6CyCADeEHQT83YSRu7B8rG6g4kH41PwxW+Q3SQ9n
 dGxKBbbWnV9DmGGTAxMW2sdUoro6j+KCgD4CYniL/A3HU0oiB90sBVTJQLCOB51TxQ
 9JGFeU03CfP4/TvT4AufLkacBsoqzDTvyIw9peJzlY4G4UePIGEKJkOoA973rgyEAV
 8QICfITGiumtx3UbY9mQex0QK03NRTAGhpHd9yAlBiU1231yr649N6SxGmqYZf7XVB
 BhSeVOZeCtr3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=KGDzptcW
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump to 1.7.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nicolas,

On Wed, Aug 09 2023, Nicolas Cavallari wrote:
> This version makes it explicit that it uses libxdiff, a library which is
> not maintained upstream since 2008.  It now have numerous forks, none of
> them sticking out.  For now, use the one which is bundled in the libgit2
> sources.

Your sign-off is missing.

baruch

> ---
>  package/libgit2/libgit2.hash | 2 +-
>  package/libgit2/libgit2.mk   | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> Tested with test-pkg -a with 12 configurations
> 540 builds, 142 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
>
> diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
> index 4dd6519ca3..1997c3ba8e 100644
> --- a/package/libgit2/libgit2.hash
> +++ b/package/libgit2/libgit2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  d25866a4ee275a64f65be2d9a663680a5cf1ed87b7ee4c534997562c828e500d  libgit2-1.6.4.tar.gz
> +sha256  d9d0f84a86bf98b73e68997f5c1543cc5067d0ca9c7a5acaba3e8d117ecefef3  libgit2-1.7.0.tar.gz
>  sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index 9ddf2374bb..93505f7d85 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGIT2_VERSION = 1.6.4
> +LIBGIT2_VERSION = 1.7.0
>  LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
>  LIBGIT2_LICENSE = \
>  	GPL-2.0 with linking exception, \
> @@ -12,7 +12,8 @@ LIBGIT2_LICENSE = \
>  	BSD-3-Clause (sha256), \
>  	wildmatch license (wildmatch), \
>  	CC0-1.0 (xoroshiro256), \
> -	BSD-2-Clause (basename_r)
> +	BSD-2-Clause (basename_r), \
> +	LGPL-2.1+ (libxdiff)
>  LIBGIT2_LICENSE_FILES = COPYING
>  LIBGIT2_CPE_ID_VENDOR = libgit2_project
>  LIBGIT2_INSTALL_STAGING = YES
> @@ -23,6 +24,7 @@ LIBGIT2_CONF_OPTS = \
>  	-DREGEX_BACKEND=regcomp \
>  	-DUSE_HTTP_PARSER=system \
>  	-DUSE_NTLMCLIENT=OFF \
> +	-DUSE_XDIFF=builtin \
>  	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
>  
>  LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
