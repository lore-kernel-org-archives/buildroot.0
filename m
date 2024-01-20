Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E04C47DAF
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 21:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A97C042233;
	Sat, 20 Jan 2024 21:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A97C042233
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhNCZdl70GHU; Sat, 20 Jan 2024 21:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C721642207;
	Sat, 20 Jan 2024 21:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C721642207
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F63B1BF346
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15B084013F
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15B084013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zH49XVtQe1nI for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 21:45:24 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4F4140012
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 21:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4F4140012
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D058513F899;
 Sat, 20 Jan 2024 22:45:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 22:45:19 +0100
Date: Sat, 20 Jan 2024 22:45:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <Zaw-71RHMeYgH6yO@landeda>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
 <20240117225049.28443-3-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117225049.28443-3-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705787121;
 bh=65XrTu2ssZc7K0ntYr4r0kqLsl5UQjBMlHtF+6Minxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N4CnCzzOmt6RtZUOUunAi/nQ/EN3PObMg8umHs1LN7Pet11noyBnN72gORhzpWrMp
 uucfhG4+Rk27fM/maLiIq8jPk9tVQSdEah7uRUFA00ZqSYZJLyBaFOPUwtGNskO0Jl
 f25RESPFVuApb9xZqcb8TxjKmMJZKBiqGcWkpn7b2/ASoWrmx4DVMTgT66PjgCO+xJ
 jmu+1hWFOnQzb36KUVUa2yK0A4LqRAQWJX+ArEhM6N8oYHId/jyyBfEHSbGxhmZDgF
 g/moOtulRZrULHTRsT4jMauaN5z2XUODCZOHh1t3YDel9GsHPuvwVUCEJsV/1HBZZu
 1XVQ0JuSW6zYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N4CnCzzO
Subject: Re: [Buildroot] [PATCH v3 02/10] package/depot-tools: bump version
 to 8d14454ba4a35fd9d2483842b08815a2357ec86f
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

Adam, All,

On 2024-01-17 15:50 -0700, Adam Duskett spake thusly:

The comments you provided in the cover letter really belonged to this
commmit log, so I copied that as-is (apart for line-wrapping).

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/depot-tools/depot-tools.hash | 2 +-
>  package/depot-tools/depot-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
> index 2109096901..70218e4658 100644
> --- a/package/depot-tools/depot-tools.hash
> +++ b/package/depot-tools/depot-tools.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  8e0bccdd6b1231f58d5453dc14a5e1d195295ac8d466dec34961e951e946b50b  depot-tools-4e87f5bfe244e903f712408ea68dc3c3a6fe2d00-br1.tar.gz
> +sha256  5da23d7558975093c6a732f5743c7f224d16dd3f878a6a1b577b1b127a4098cc  depot-tools-8d14454ba4a35fd9d2483842b08815a2357ec86f-br1.tar.gz
>  sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
> diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
> index e3b840f29a..634258ffbb 100644
> --- a/package/depot-tools/depot-tools.mk
> +++ b/package/depot-tools/depot-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
> +DEPOT_TOOLS_VERSION = 8d14454ba4a35fd9d2483842b08815a2357ec86f
>  DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
>  DEPOT_TOOLS_SITE_METHOD = git
>  DEPOT_TOOLS_LICENSE = BSD-3-Clause
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
