Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63598C38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 12:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDD4E409E3;
	Mon, 23 Jan 2023 12:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDD4E409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_v7fZET_rMl; Mon, 23 Jan 2023 12:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18AB6409A6;
	Mon, 23 Jan 2023 12:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18AB6409A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CAED1BF348
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 12:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57F6F81BB2
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 12:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F6F81BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NIg3vM4yXzpj for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 12:04:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5749C81BA9
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5749C81BA9
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 12:04:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0039F2B3;
 Mon, 23 Jan 2023 13:04:11 +0100 (CET)
MIME-Version: 1.0
In-Reply-To: <20230123083508.3041367-1-marcus.folkesson@gmail.com>
References: <20230123083508.3041367-1-marcus.folkesson@gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Date: Mon, 23 Jan 2023 12:04:08 +0000
Message-ID: <167447544877.42371.18235756044763257017@Monstersaurus>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1674475452;
 bh=Re9wPbhuKA/GvLLb82akcnxS+Z6PS7apOKIgGmB7cqU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=CYfUrBf4quWoNlZxQH0F4xrtSu+wYsnPFB/P4fTbJ3fDGdTkFd0DKe/iY85dzFuDK
 LBWivRrBkB8P8kFIsCeTabeoUT7jIO8A4x/Mqgb1GB9nXSYHyg0dKzuGIYtdVNEVhR
 mSDLVfedLfA+1tm4dJcGKvcgoGGjIVY6PCckYER8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=CYfUrBf4
Subject: Re: [Buildroot] [PATCH 1/3] package/libcamera: bump to version 0.0.3
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Marcus Folkesson (2023-01-23 08:35:06)
> At the same time, change site to github in order to fetch the release
> bundles.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 68c9c1f005..13f6c4d907 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e9636986e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
> +sha256  af85008f4e8bf1dc70aba4e5612513371b016788cf3c83343cf2d02483bc64ec  libcamera-0.0.3.tar.gz
>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 9c03d3a3b3..d00f076cea 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = ba6435930f08e802cffc688d90f156a8959a0f86
> -LIBCAMERA_SITE_METHOD = git
> +LIBCAMERA_VERSION = 0.0.3
> +LIBCAMERA_SOURCE = libcamera-$(LIBCAMERA_VERSION).tar.gz
> +LIBCAMERA_SITE = $(call github,kbingham,libcamera,v$(LIBCAMERA_VERSION))

The address github.com/kbingham/libcamera is an *unofficial mirror*. As
in - I arbitrarily (but frequently) push there and store some branches
there.

As I'm currently the release manager for libcamera, it's possibly
reasonable to assume I'll always keep this in sync - but this is not an
official location to obtain libcamera.

If anyone else starts making releases for libcamera, I likely won't
guarantee that I'll keep updating kbingham/libcamera.git


Valid official hosting for libcamera is currently only:
 - https://git.linuxtv.org/libcamera.git/
or
 - https://git.libcamera.org/libcamera/libcamera.git/

Now of course you're free to obtain libcamera from any mirror you like,
but I feel it's important I make that distinction clear.

--
Kieran


> +
>  LIBCAMERA_DEPENDENCIES = \
>         host-openssl \
>         host-pkgconf \
> -- 
> 2.38.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
