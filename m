Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D8CCCF9F8
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 20:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06B986086B;
	Sun,  9 Nov 2025 20:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7vBXQ0ZxjOW; Sun,  9 Nov 2025 20:43:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2716660870
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2716660870;
	Sun,  9 Nov 2025 20:43:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CE6FFA
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 20:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AFB0406DF
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 20:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbRnwhlgVpRJ for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 20:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 376F1406DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 376F1406DD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 376F1406DD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 20:43:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2D25C5FFC0;
 Sun,  9 Nov 2025 21:43:42 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Nov 2025 21:43:42 +0100
MIME-Version: 1.0
Date: Sun, 09 Nov 2025 21:43:42 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251108105905.2713315-1-dario.binacchi@amarulasolutions.com>
References: <20251108105905.2713315-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a3063f6b395a568ce5bf56c64228bb87@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762721023;
 bh=FalReUJAA2RVdXjJaKLSqwEV427cxlAzPfTi/EGTTL0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eR8FWiSZTXhQmdN0ERR8BzApYSwlisuG6HTZ+HTDi5A4Xwn+ZoKKGKgKOzKdqWM4x
 //izmvkCb7dLRpviHGKl5y8ZeDA8Wug9CFlOdz0GJckaRjue5U/Ppg88g583o8ZhY9
 scSoO1clBQRer8PTweIeu9OQzjET7WJ9pAlkVjPbfJxy0RphLPRYWBC39dV0f79Yt9
 Zrr2HczWJyxmyCy9VdrFoB2l12jlXuTFRHXL5a+jl28PCdLjgMphXCpe3dpidX43BQ
 l6yzuecKGUN+4pRa05CWf3udURt8WKtv5FDfNgCMmhtniqTGDOWZdFnP3HSV4deQo4
 g+fMZQL7dhQ4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eR8FWiSZ
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump to version to
 6.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 08/11/2025 11:59, Dario Binacchi wrote:
> For release notes since v6.10, see:
> https://github.com/kdave/btrfs-progs/blob/v6.17/CHANGES
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
[...]
> diff --git a/package/btrfs-progs/btrfs-progs.mk 
> b/package/btrfs-progs/btrfs-progs.mk
> index 273c7e37f2b9..220ea80c7192 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -BTRFS_PROGS_VERSION = 6.10
> +BTRFS_PROGS_VERSION = 6.17

This new version seems to prevent btrfs rootfs to boot in Buildroot. 
See:
https://gitlab.com/jolivain/buildroot/-/jobs/12025863112

The target tests.package.test_btrfs_progs works, though.

Could you have a look, please?

>  BTRFS_PROGS_SITE = 
> $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
>  BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
>  BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
