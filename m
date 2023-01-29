Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB55FC61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 20:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C1281461;
	Sun, 29 Jan 2023 20:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C1281461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jn1qFawBIaBf; Sun, 29 Jan 2023 20:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 542CC81457;
	Sun, 29 Jan 2023 20:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 542CC81457
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B6411BF3A9
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 20:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 434144032B
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 20:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 434144032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUetkQHo5dDx for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 20:42:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B8A7400CC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B8A7400CC
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 20:42:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8E1645FFA3;
 Sun, 29 Jan 2023 21:42:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 21:42:49 +0100
Date: Sun, 29 Jan 2023 21:42:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230129204249.GU2632@scaer>
References: <20230129200404.388126-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129200404.388126-1-angelo@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675024971;
 bh=4yL3HlD2C187tEFcYN3t9AcgQ5TXiisOQNCQaikNcJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGSVjzCiBTb43SoOd5ow3T2qbQY31T156aBp3NZPLy7LLIdxLIARkTDTCeaUNIklu
 NeGYGNNAYxuETR9B8eN8LlpqPH2WV2FlbJH9nVbuOTsyHZJPVoPEZHI18++f3zHCri
 5DNyLGEvAtfFr6H/6BdOOkGYh+RKGcOr7GCFCgXZZwtxFpleY91Ij2fjICqnFY+3IM
 W0rCbigDCYVebqZJOjJp6VBv1r6VK9Z0MFcY6bPxQegwmMxPpEwnGuJ5cUmDS+2UHY
 +/KoqYja/fC8y0UJkxJB49GeTZnoWxNxGyDcPbAynHLdNDLK8rnDlmvwtkrjZe4ArE
 TNauouVjR7tNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WGSVjzCi
Subject: Re: [Buildroot] [PATCH] package/mono: bump to version 6.12.0.182
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

Angelo, All,

On 2023-01-29 21:04 +0100, Angelo Compagnucci spake thusly:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mono/mono.hash | 2 +-
>  package/mono/mono.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mono/mono.hash b/package/mono/mono.hash
> index 8b72ae68ed..1010f6d0ab 100644
> --- a/package/mono/mono.hash
> +++ b/package/mono/mono.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  29c277660fc5e7513107aee1cbf8c5057c9370a4cdfeda2fc781be6986d89d23  mono-6.12.0.122.tar.xz
> +sha256  57366a6ab4f3b5ecf111d48548031615b3a100db87c679fc006e8c8a4efd9424  mono-6.12.0.182.tar.xz
>  sha256  923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
>  sha256  fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
>  sha256  2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> index 219effc5d3..b88f2b379e 100644
> --- a/package/mono/mono.mk
> +++ b/package/mono/mono.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MONO_VERSION = 6.12.0.122
> +MONO_VERSION = 6.12.0.182
>  MONO_SITE = http://download.mono-project.com/sources/mono
>  MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
>  MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
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
