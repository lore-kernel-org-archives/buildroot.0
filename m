Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0231FC77B75
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96AED42833;
	Sat,  6 May 2023 16:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96AED42833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3JLTywJZp3an; Sat,  6 May 2023 16:15:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81AB042047;
	Sat,  6 May 2023 16:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81AB042047
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0C0D1BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B984660F3B
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B984660F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7FmP0jmBXqk for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:12:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCEBC60A9A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCEBC60A9A
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:12:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0EE2AB0056A;
 Sat,  6 May 2023 18:12:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 18:12:35 +0200
Date: Sat, 6 May 2023 18:12:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230506161235.GW252090@scaer>
References: <20230504073310.3456839-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504073310.3456839-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683389559;
 bh=hO6oLubUdi5CdJDzKaIYZprmCMUFQdFto08yliI2nXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TKP2yqkbIQ1gjI5XEC4dbJzPI7rdadN13Ss0GBeVTk2z2QEevZE4lB3Sk9jIeq1wJ
 +fbi8K8iHYTmq6rB+sgVj3gNmws4RyvFnE/7fu6RkApFTmNX9Lql+IwsN5sGQwFzPa
 AtwLJNgVbVEOvzVv2GqfoxBYYzoH8tdtSfS+1DLYvcjuolUo4+QzET/PyYTTJBG4Jx
 MrV2gqcxOZbbiDMJZbZlwyd3o4cD1Y8EmC4/lptRPIo0EJhHbfLahBYs33hCETVaYK
 PV0WhroDHZksX2mZTSBGKiB3aqZVCexe5f2+SThFx1LAB169RzPXdzbwcvQSX+Mdw9
 /uJAO6dL9sVuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TKP2yqkb
Subject: Re: [Buildroot] [PATCH v1 1/1] package/moby-buildkit: bump version
 to 0.11.6
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

Christian, All,

On 2023-05-04 00:33 -0700, Christian Stewart via buildroot spake thusly:
> Bugfixes.
> 
> https://github.com/moby/buildkit/releases/tag/v0.11.6
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/moby-buildkit/moby-buildkit.hash | 2 +-
>  package/moby-buildkit/moby-buildkit.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
> index ef927636d9..f7922d7e8f 100644
> --- a/package/moby-buildkit/moby-buildkit.hash
> +++ b/package/moby-buildkit/moby-buildkit.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  b1746575f37715a8a2f2df5bab77ea081ba8436854e241792702109fc9e3653d  moby-buildkit-0.11.2.tar.gz
> +sha256  1efa1c54b299c463c1b039d3df8ba1c68e70fe4de608fd14653fcebf9f27837b  moby-buildkit-0.11.6.tar.gz
>  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
> index a25f676710..91560c1ed1 100644
> --- a/package/moby-buildkit/moby-buildkit.mk
> +++ b/package/moby-buildkit/moby-buildkit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MOBY_BUILDKIT_VERSION = 0.11.2
> +MOBY_BUILDKIT_VERSION = 0.11.6
>  MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
>  MOBY_BUILDKIT_LICENSE = Apache-2.0
>  MOBY_BUILDKIT_LICENSE_FILES = LICENSE
> -- 
> 2.40.1
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
