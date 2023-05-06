Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3457C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 898B461162;
	Sat,  6 May 2023 14:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 898B461162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNea7e940u2r; Sat,  6 May 2023 14:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A01E160E72;
	Sat,  6 May 2023 14:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A01E160E72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 503051BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36E3A405B0
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36E3A405B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4G4OZVmtFUw for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:50:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42CA940514
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42CA940514
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:50:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 56D07B0053D;
 Sat,  6 May 2023 16:50:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 16:50:24 +0200
Date: Sat, 6 May 2023 16:50:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230506145024.GN2661@scaer>
References: <20230323214727.3228-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323214727.3228-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683384626;
 bh=j9N8WCRhYqTR+8gqK3LeP2AixpcEQwzDDxAqEahLqI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rUr58T/QBVHUHVvc6yfEVZM7dBiY0v0zz0/pAGvaLc+E/fzz0DU9EZlsqg4eMiVXP
 Na7b1tVhRpt+hONyRMgsJH8SaDIm31rYHEdWXuZQGU4XOiQFkojZkjoBpuLCjF+SQd
 M1YDy3iA2veb45prcIPB4QrRUCCAgF1Y9sEoSXxYDmNQKkgBve7/Tn2oZDVlstdNAY
 nycb9ntRoaQaPTZr7oK3wJp16XfXR0GjTMpYQIdfKxU7GjeQN7vCY0BDUozVx00WPg
 cpb2YLu/ko85b0ClW5SA2D5sq8Deo1i5JvnYj0i3WD2AgAeeoBz496V0iypuPlMMH1
 OAd9hLMr1UHIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rUr58T/Q
Subject: Re: [Buildroot] [PATCH v1] package/mtools: bump version to 4.0.43
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

On 2023-03-23 22:47 +0100, Peter Seiderer spake thusly:
> For details see [1].
> 
> [1] https://lists.gnu.org/archive/html/info-gnu/2023-03/msg00006.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mtools/mtools.hash | 2 +-
>  package/mtools/mtools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
> index b81830a7d2..412d67a328 100644
> --- a/package/mtools/mtools.hash
> +++ b/package/mtools/mtools.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  40a98fd9bcc865997866015013c3c64a304d98c2892fe4ab892ffd6ac3dd9bae  mtools-4.0.42.tar.lz
> +sha256  997ffe4125a19de1fd433ed63f128f7d54bc1a5915f3cdb36da6491ef917f217  mtools-4.0.43.tar.lz
>  
>  # Locally calculated
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
> index 407ac1a2c6..96d8e43ea2 100644
> --- a/package/mtools/mtools.mk
> +++ b/package/mtools/mtools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MTOOLS_VERSION = 4.0.42
> +MTOOLS_VERSION = 4.0.43
>  MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
>  MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
>  MTOOLS_LICENSE = GPL-3.0+
> -- 
> 2.39.2
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
