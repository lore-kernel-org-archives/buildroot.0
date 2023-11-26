Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC183C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9D2060D5F;
	Sun, 26 Nov 2023 21:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D2060D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFxSnVleCwmV; Sun, 26 Nov 2023 21:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DED4D60D51;
	Sun, 26 Nov 2023 21:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED4D60D51
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 843361BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A730400C1
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A730400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMSzJWjx6XLs for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:46:48 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23BF4400A4
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23BF4400A4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6053D7802D6;
 Sun, 26 Nov 2023 22:46:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 22:46:44 +0100
Date: Sun, 26 Nov 2023 22:46:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20231126214644.GL3177259@scaer>
References: <20231123054359.101121-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123054359.101121-1-fido_max@inbox.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701035206;
 bh=rYGq4kf+JzGq2XToyrMLmMJM1uqAqEquli0v9gwgUX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ppxorYTzEd9DbKG3IU74FGeZC4oU7pizvzdR+Z/aJSZDXT8reusmGIAiZsE0lD9bj
 o5ZltuAmAdf4sc9tJKjz0y3UW2R4qotfDqYIgAkfY2y31Jg/9ihGYXmB1vkVir60wz
 nZBv0ebEjyhhfru3Z3e6KsjhJQgvOuSABED6066b3wKa/scvDnZoltD+WzXD9TzBIa
 781yxQmIAnkg9tkpdiIfOOvcWb7SRqqsZnqRJAeW4UFf9yryPMkS9EV6vPnY0bS+3b
 9v+OkG41nLXtqbP0qiCBi4eaAsS6HD8Pbd6/Z1n6JdaVmhZFDcKdzO8BabVxU5BheZ
 U1zCHEpFfrZ9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ppxorYTz
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.12.1
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

Maxim, All,

On 2023-11-23 08:43 +0300, Maxim Kochetkov via buildroot spake thusly:
> Changelog: https://github.com/libgeos/geos/releases/tag/3.12.1
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libgeos/libgeos.hash | 2 +-
>  package/libgeos/libgeos.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
> index bb433117a5..37fe7d6d23 100644
> --- a/package/libgeos/libgeos.hash
> +++ b/package/libgeos/libgeos.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  d96db96011259178a35555a0f6d6e75a739e52a495a6b2aa5efb3d75390fbc39  geos-3.12.0.tar.bz2
> +sha256  d6ea7e492224b51193e8244fe3ec17c4d44d0777f3c32ca4fb171140549a0d03  geos-3.12.1.tar.bz2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
> index 70f8ca3495..491168324f 100644
> --- a/package/libgeos/libgeos.mk
> +++ b/package/libgeos/libgeos.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGEOS_VERSION = 3.12.0
> +LIBGEOS_VERSION = 3.12.1
>  LIBGEOS_SITE = http://download.osgeo.org/geos
>  LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
>  LIBGEOS_LICENSE = LGPL-2.1
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
