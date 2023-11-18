Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C0AC5ACB3
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA264176C;
	Sat, 18 Nov 2023 14:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA264176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0FTKKroSPgS; Sat, 18 Nov 2023 14:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71274416BF;
	Sat, 18 Nov 2023 14:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71274416BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96F531BF25F
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D3C2416BF
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D3C2416BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HaVxhpiaQUTq for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:31:46 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E065410A4
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E065410A4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C88EF780372;
 Sat, 18 Nov 2023 15:31:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 15:31:42 +0100
Date: Sat, 18 Nov 2023 15:31:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231118143142.GY996011@scaer>
References: <20231116061229.13306-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231116061229.13306-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700317904;
 bh=eafRJ6pUYJQRtBQrGfj7KHHrdtVTUnq3/WskvQ/9yrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dg1RQ8WtCQqWg+lMq/qkkF8n6R8W3lOdry7VgR0ylTmhm3BA00TnExEVIY2htd/aG
 bRyGrit8IFEKI48MCLwPHUgCM02io3+FixzvrpNzYk7OARaD4lrjvVOFhr7B/36WKx
 KoTG7eW7pBoAi01Pzy1xgACS3R3hmijPI7GAG0hzQV/O4o9BLHk+VBhDc+AKhfuIzt
 lNTktkEWBCEwwLVOaR2JpdsV663V+I1fwXfAq1+cTLukU6nbmwec1+JxWFQY7rDU2B
 0lkumLYRgWX26QdE2b0pAfjUk8AZXzDBQb6R7nUSylZv7rEKUozz5Y8FqxHNf+vlk4
 DqYiQjur5/AWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dg1RQ8Wt
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-hts: bump version to
 20.6.5-Nexus
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

Bernd, All,

On 2023-11-16 07:12 +0100, Bernd Kuhls spake thusly:
> Changelog of this bugfix release:
> https://github.com/kodi-pvr/pvr.hts/blob/Nexus/pvr.hts/changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

(yes, master, as this is a one-code-commit bug fix release.)

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
>  package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
> index 4a0ccb2467..046d234d71 100644
> --- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
> +++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  bce8fe803665121ab7cb20d13e76515a96cf9ef342ef109611e2df2ab144d3b5  kodi-pvr-hts-20.6.4-Nexus.tar.gz
> +sha256  bd58fc85543447f918ee567192c87a3beb3f6e2c3fc116abe1f584514d202ada  kodi-pvr-hts-20.6.5-Nexus.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
> index d9bf682b38..7e667ae1aa 100644
> --- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
> +++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_HTS_VERSION = 20.6.4-Nexus
> +KODI_PVR_HTS_VERSION = 20.6.5-Nexus
>  KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
>  KODI_PVR_HTS_LICENSE = GPL-2.0+
>  KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
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
