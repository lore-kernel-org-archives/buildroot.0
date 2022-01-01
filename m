Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A863DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5901E8142E;
	Sat,  1 Jan 2022 10:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMnZvPaCArQc; Sat,  1 Jan 2022 10:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F46813FC;
	Sat,  1 Jan 2022 10:22:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43A781BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 319AE60D93
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6IMIenRycqQ for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:22:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D79D60D80
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:22:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6CFA75FF3F;
 Sat,  1 Jan 2022 11:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641032532;
 bh=cm3oEmUUlV2pptDdf0iEgoma5KQUO2G+KwSY5jGJXeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pB9O5UHDhtx2Z+gYe2anPqv1Xo0EqO5UP+IUFmyFI6vRvJa/go1WO3pkXBi5BPiRP
 STkLeLXDtpu3Z/QcCuSPTNMquG9e7+/OSMYJsh8d68FcLATIxqnEZdbiq7DoFzBd1D
 xmbwoKOx72XF1tsGPBZUITXqSyt4SOmpbQzVZXhPEk9nTLxtgfXu4Oynn9iHD/1IlB
 RLW72Poj8iAEui8Bnd9Wu92FT1G/yvkFpLe48uIs7gElJyxWHCRJ65pb7A9Y9EXhBX
 4EgQwyo+jQmJL4uaYWUjEnNZiMTZ8ObLcdUiLH0um0SAB3WhR+m+2tzTL2JbjiJQNM
 Tuin3KXgR7Ucg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 11:22:06 +0100
Date: Sat, 1 Jan 2022 11:22:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20220101102206.GB3390456@scaer>
References: <20211230225719.31728-1-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230225719.31728-1-abrodkin@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/openjdk: Make sure for ARC only
 Zero is selectable
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

Alexey, All,

On 2021-12-31 01:57 +0300, Alexey Brodkin via buildroot spake thusly:
> As of now for ARC we only have fully-interpreted mode AKA
> "Project Zero" and so all the JIT'ed modes must be explicitly
> disabled for ARC. Doing it now as it was not done in the initial
> submission
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I've slightly reworded the commit log to adde the actual reference to
the initial commit, and applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openjdk/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
> index b6eb2d7818..8b7fd4653e 100644
> --- a/package/openjdk/Config.in
> +++ b/package/openjdk/Config.in
> @@ -126,19 +126,19 @@ config BR2_PACKAGE_OPENJDK_FULL_JDK
>  
>  choice
>  	prompt "openjdk variant"
> -	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !BR2_powerpc
> +	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !(BR2_powerpc || BR2_arc)
>  	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_powerpc
>  	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_arc
>  
>  config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
>  	bool "client"
> -	depends on !BR2_powerpc
> +	depends on !(BR2_powerpc || BR2_arc)
>  	help
>  	  Quick loading, but slower run-time performance.
>  
>  config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
>  	bool "server"
> -	depends on !BR2_powerpc
> +	depends on !(BR2_powerpc || BR2_arc)
>  	help
>  	  Slower loading, but faster run-time performance.
>  
> -- 
> 2.25.1
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
