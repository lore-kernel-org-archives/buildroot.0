Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FFEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 21:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28A084098A;
	Thu, 20 Jan 2022 21:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39j_lrcm0jhQ; Thu, 20 Jan 2022 21:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2DD240519;
	Thu, 20 Jan 2022 21:29:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40E611BF2B5
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39D204011D
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ByhZhi8K1_I for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 21:29:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FB3A400D6
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 21:29:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9c35:7598:9514:be6a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 032F6B00535;
 Thu, 20 Jan 2022 22:29:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642714192;
 bh=NNs9DK4kmwW+J9UQew9F1CcP8qVLbLSMZNMSiiNZeEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rMp/BNoupXMdhwNBf/PWQROeTH12pm2P5IQ+ZIwZufY0lRHMwAcnyA1y1gDHUZJDf
 dLWI1aEbxr/TvaS9HBzY9nOUHZ6KUQwhWXUzMN/ChYo4DpiqjvXZTsG/x2to1R8SvD
 Uu+jPrxAFj9EcgumLON7xzDcdLrwDA5sC5Za5wGxAGo1EsrFLw8K+cS9FYW70pCFtX
 hg3zDAFnZ80s+J6AKq0rWsw1uVm/WhE3gaZfpsbvnKnUBWI7rEBY6103D5yIcUrnY1
 oXL5sqNWV9CTC6UFx2vy3nAzLIezzkjY3HkeXm/GIPZ1MnlQNtL0HB4xVxXeCwZsq1
 ReCv7u3wYho/A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 20 Jan 2022 22:29:48 +0100
Date: Thu, 20 Jan 2022 22:29:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220120212948.GE3252931@scaer>
References: <20220120174939.27055-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120174939.27055-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/hwloc: bump version to 2.7.0
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
Cc: Steven Noonan <steven@uplinklabs.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-01-20 18:49 +0100, Peter Seiderer spake thusly:
> For details see [1].
> 
> [1] https://github.com/open-mpi/hwloc/blob/hwloc-2.7.0/NEWS
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/hwloc/hwloc.hash | 4 ++--
>  package/hwloc/hwloc.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
> index e207a6bb1a..ca77e3301c 100644
> --- a/package/hwloc/hwloc.hash
> +++ b/package/hwloc/hwloc.hash
> @@ -1,4 +1,4 @@
> -# From https://www.open-mpi.org/software/hwloc/v2.4/
> -sha256  392421e69f26120c8ab95d151fe989f2b4b69dab3c7735741c4e0a6d7de5de63  hwloc-2.4.1.tar.bz2
> +# From https://www.open-mpi.org/software/hwloc/v2.7/
> +sha256  028cee53ebcfe048283a2b3e87f2fa742c83645fc3ae329134bf5bb8b90384e0  hwloc-2.7.0.tar.bz2
>  # Locally computed
>  sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
> diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
> index 2a5a82cea4..04543a7e64 100644
> --- a/package/hwloc/hwloc.mk
> +++ b/package/hwloc/hwloc.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -HWLOC_VERSION_MAJOR = 2.4
> -HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).1
> +HWLOC_VERSION_MAJOR = 2.7
> +HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).0
>  HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
>  HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
>  HWLOC_LICENSE = BSD-3-Clause
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
