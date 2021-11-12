Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C294EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:36:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA8360F5B
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CA8360F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 444E76061C;
	Fri, 12 Nov 2021 13:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljiROMHCSC5c; Fri, 12 Nov 2021 13:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AD7B60658;
	Fri, 12 Nov 2021 13:36:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD6C61BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8D7360755
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTz7fmVXnTyC for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:36:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 677E860682
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:36:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 39FF219F58D;
 Fri, 12 Nov 2021 14:36:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636724203;
 bh=eIw6fJXhgt1OpshpBEnbqERgOfae7/5TSKjyFoZ+oXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ePSfrQkvrBf+ObHay1geZLoU+Jl6gRB/4/jeLPdLo90PMixLYX7V+YEeCK0gaSqXr
 EaJDS4RLmRgjsvkVY4Y+aRenMphO0YklkZd9Wef2o8qW+r4li5Mw0TY4ZDkl5L1Sry
 wZcoLazlufQoHaIumTLzAGIfv6Ql7JF7rFaqz1dy9eKWWJZg2ZwnoG6D9ePYMjjSsf
 Rp53lyRfSRdm/1Sw05J/oM9u+yrnuaPsREDoY2u0G/aRGDBPQWLaKvid90uYoWMulr
 RrrK4FgmJ1U84ZGtLzvpTweY+/stD1SYazJsmZ31yGQiHP4QpHMZ45UU/c6svAc8wB
 snrg/xXFVDe/A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 14:36:36 +0100
Date: Fri, 12 Nov 2021 14:36:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211112133636.GM2609@scaer>
References: <20211112104724.3308539-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112104724.3308539-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire-media-session: needs
 alsa-lib-ucm
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-12 11:47 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the
> package in commit 51f30f47cd04efe494c8da37077bea860d3fbe14:
> 
> ../src/alsa-endpoint.c:34:10: fatal error: alsa/use-case.h: No such file or directory
>    34 | #include <alsa/use-case.h>
>       |          ^~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bbf54d1bdb0f8f2d4f675ffdcbcbbf56562c3d7b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pipewire-media-session/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pipewire-media-session/Config.in b/package/pipewire-media-session/Config.in
> index d025cd4d75..affbc00c1a 100644
> --- a/package/pipewire-media-session/Config.in
> +++ b/package/pipewire-media-session/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION
>  	depends on BR2_USE_MMU # dbus
>  	depends on BR2_PACKAGE_PIPEWIRE
>  	select BR2_PACKAGE_ALSA_LIB
> +	select BR2_PACKAGE_ALSA_LIB_UCM
>  	select BR2_PACKAGE_DBUS
>  	help
>  	  Build pipewire media-session support
> -- 
> 2.33.0
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
