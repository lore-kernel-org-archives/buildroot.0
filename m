Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40879C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF62D61122;
	Tue,  6 Feb 2024 14:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF62D61122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 565vwaXUto1i; Tue,  6 Feb 2024 14:04:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5421C60B99;
	Tue,  6 Feb 2024 14:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5421C60B99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17FA31BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52CC41690
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E52CC41690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYEOb9k8zzt2 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:04:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC081415CA
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC081415CA
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 798E013F899;
 Tue,  6 Feb 2024 15:03:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 15:03:58 +0100
Date: Tue, 6 Feb 2024 15:03:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Naumann <anaumann@ultratronik.de>
Message-ID: <ZcI8TvKtgsqGgxjl@landeda>
References: <20240206102144.1831146-1-anaumann@ultratronik.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206102144.1831146-1-anaumann@ultratronik.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707228241;
 bh=R7UTf4HbDm+LhsuYeaIYpKzfDtdWJXdotudRFAecmNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HSfcw/LNUj6EVWaOoV6FLGM40Jdj65MD/CEWhE9aUpww9Kdtt3tMm/HnhIJV4YYRc
 Cmr9WcKzvErKMGuPD4Ish7TrVYekXe36tPbLVgiv5pjaImSJZNjPBIzTY2Y5hDhmPu
 SA/olulkFV+u/jTgqkuYXWnTJnQQXxJ1kFDLu02bVQRkbeJrgLHLF4B6/o5ZUNjgqj
 HWhN1FLnr8ZFpv5giFitmNGHB4baGSz6NNpxjb/PPbzr7e95JPbkI3/uubQviW1l/3
 lC3PsemgxZ5gtuU7k+h9HSPKPy4z5qsadb8IstCqFfXx+sf3If0IGNvHQCSLa0gRPx
 Yf3vIoe85ra8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HSfcw/LN
Subject: Re: [Buildroot] [PATCH 1/1] package/glm: Bump to 1.0.0
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
Cc: fontaine.fabrice@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All,

On 2024-02-06 11:21 +0100, Andreas Naumann spake thusly:
> glm did not install headers since [1], at least in a per-package
> build. Bumping to 1.0.0 fixes that.
> The cmake option to avoid building the lib has changed
> 
> Partially fixes [2], where cegui failed to configure because of
> the missing glm headers.
> 
> [1] 01ad113  package/glm: bump to version 0.9.9.8
> [2] http://autobuild.buildroot.org/results/241/241a60f8ecb6fec5dc122d64dd438dd4249f8c3e/
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

Applied to master, thanks.

Bernd sent an earlier patch to bump to a random git sha1, and I grabbed
the failures from his commit log and added them to this patch when
applying.

Regards,
Yann E. MORIN.

> ---
> note: 0.9.9.8 from 2020 was the latest tag until a 1.0.0 was cut about
> two weeks ago (24th january 2024). I've seen commit 3a4b550 which might
> have been responsible but didnt check since 1.0.0 was available.
> 
> 
>  package/glm/glm.hash | 2 +-
>  package/glm/glm.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/glm/glm.hash b/package/glm/glm.hash
> index c4e21016047..0084bd0930c 100644
> --- a/package/glm/glm.hash
> +++ b/package/glm/glm.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592  glm-0.9.9.8.tar.gz
> +sha256  e51f6c89ff33b7cfb19daafb215f293d106cd900f8d681b9b1295312ccadbd23  glm-1.0.0.tar.gz
>  sha256  62d2d642c7d054d4fb4c9b42faad617d6c88fcd91e317f8035aa9f277cc159c3  copying.txt
> diff --git a/package/glm/glm.mk b/package/glm/glm.mk
> index ef549931f6a..ce8efc11a78 100644
> --- a/package/glm/glm.mk
> +++ b/package/glm/glm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GLM_VERSION = 0.9.9.8
> +GLM_VERSION = 1.0.0
>  GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
>  GLM_LICENSE = MIT
>  GLM_LICENSE_FILES = copying.txt
> @@ -17,7 +17,6 @@ GLM_INSTALL_TARGET = NO
>  # Don't build libraries as GLM is header-only
>  GLM_CONF_OPTS = \
>  	-DGLM_TEST_ENABLE=OFF \
> -	-DBUILD_SHARED_LIBS=OFF \
> -	-DBUILD_STATIC_LIBS=OFF
> +	-DGLM_BUILD_LIBRARY=OFF
>  
>  $(eval $(cmake-package))
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
