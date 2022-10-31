Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA55CC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 748DD60B51;
	Mon, 31 Oct 2022 10:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 748DD60B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyk0ouuwOOG0; Mon, 31 Oct 2022 10:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB57560B3D;
	Mon, 31 Oct 2022 10:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB57560B3D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC3CF1BF20F
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4E0D80D80
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E0D80D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFZ76BlNQ5i6 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:59:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D270980BA2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D270980BA2
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:59:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1923AB0051E;
 Mon, 31 Oct 2022 10:59:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 10:59:14 +0100
Date: Mon, 31 Oct 2022 10:59:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221031095914.GR1058960@scaer>
References: <20221030215046.461380-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030215046.461380-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210358;
 bh=E9kN6Ee1clTBj/9o2DS2TP5yAKx0Xs9dcxJ/EoAfljg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U5iIZ7e7yNbJKwhkZZFjOJeWxV9pS4DzrIWRAp4AFg9mQ3YwrkKC32a3qURVslwM2
 eOYog78smrnJmCUpLNNLNiVGBqO0ycLdgLaFma8j481MED7nIBMtN1KlZ/gfuKdymf
 tZd8t0EZzyFirLGnMG5uTz78hEopex+uCMJVcGPb2+tCdSEz0b303auym4U/LpgX38
 r/PIFMNvx6JCrWwxBydb10WZkV1ND5R1cX/xHTb99xxYlmGTjo0ivw0zWYeS3Z2WJ0
 AezahRIjj4VrknjvOwNPYQp2zcUSiUU7txdOqjAvoSFqSlR7Eq9PGw2H3Cmp3fylfX
 LE0a8c7D3R4xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U5iIZ7e7
Subject: Re: [Buildroot] [PATCH 1/2] package/exfatprogs: drop host-pkgconf
 dependency
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

On 2022-10-30 22:50 +0100, Fabrice Fontaine spake thusly:
> host-pkgconf is not a dependency since bump to version 1.0.3 in commit
> fbad745139125ea0995a436fd81ce7ea233638c0 and
> https://github.com/exfatprogs/exfatprogs/commit/843124cd9a2087281e00bd1b9d710db59acfbced
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/exfatprogs/exfatprogs.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
> index 2911d21f4f..44679c7d60 100644
> --- a/package/exfatprogs/exfatprogs.mk
> +++ b/package/exfatprogs/exfatprogs.mk
> @@ -9,8 +9,6 @@ EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
>  EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
>  EXFATPROGS_LICENSE = GPL-2.0+
>  EXFATPROGS_LICENSE_FILES = COPYING
> -EXFATPROGS_DEPENDENCIES = host-pkgconf
> -HOST_EXFATPROGS_DEPENDENCIES = host-pkgconf
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.35.1
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
