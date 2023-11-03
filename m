Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12743C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 22:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBA4760758;
	Fri,  3 Nov 2023 22:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBA4760758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9gsgGdyr3ds; Fri,  3 Nov 2023 22:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0521760BD1;
	Fri,  3 Nov 2023 22:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0521760BD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 933451BF5F8
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C8B8822C9
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C8B8822C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxUn4yqOXbuI for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 22:18:59 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71233822C6
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 22:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71233822C6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:207e:5629:5034:6d7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6C225B004FF;
 Fri,  3 Nov 2023 23:18:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 03 Nov 2023 23:18:55 +0100
Date: Fri, 3 Nov 2023 23:18:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231103221855.GF2875@scaer>
References: <20231103201639.85171-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231103201639.85171-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699049937;
 bh=B7cCcfEZxdKYL5uLcq8QgYQz/ORN0L73dg5/9VMXcN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O2re/gAGHGH/8r6zJpL/WoCxVTq413UvozJKILxlgjHSEOqMRMVgM4uWWrS8XfQtr
 VbdRkNxQCQXYW6+IjvDpnopJzxCnwBDnoZaPpHBF50QYKQYkTSg+XLBQpAOpFbObY4
 JzztV/bBEi9yH+rQYTPGyML1LAU8MAtJjF54hyhlCbC6FLaxlPuy4/kupktm/WxSYC
 AM2F/0zp+9huujWETRndyCnW9Q9G8zk17alHeeNTqfwH32PXvXzhRLbvRXT5uLAm9G
 N07YFhMZA8MVAIO1AsURUfX99xtwsaFSGQ9KWLV+3Fc58E3h94CkADXlX15Ot/KYaq
 zaX26tmC2xiZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O2re/gAG
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 20.10.2-Nexus
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

On 2023-11-03 21:16 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
>  package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> index 37e4ca95e2..a7092fa4b8 100644
> --- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> +++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  8f55056838798c6dc39ce1cd611553b65150f6d628e9b3d201d472e93aecf289  kodi-pvr-waipu-20.10.1-Nexus.tar.gz
> +sha256  2326c3ed0e57ef8020c1041ea6f25fa325c619588c24c71b5963d8dda1c97604  kodi-pvr-waipu-20.10.2-Nexus.tar.gz
>  sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
> diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> index e7ec7d6555..0da4620f8e 100644
> --- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> +++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_WAIPU_VERSION = 20.10.1-Nexus
> +KODI_PVR_WAIPU_VERSION = 20.10.2-Nexus
>  KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
>  KODI_PVR_WAIPU_LICENSE = GPL-2.0+
>  KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
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
