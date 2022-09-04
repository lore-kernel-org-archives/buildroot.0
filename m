Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14150ECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 07:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D9DB408FB;
	Sun,  4 Sep 2022 07:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D9DB408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOEtyGU2ueuN; Sun,  4 Sep 2022 07:26:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139C3408EB;
	Sun,  4 Sep 2022 07:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 139C3408EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 064E81BF2CC
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D52E940527
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D52E940527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3skrNklMszBy for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 07:26:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D603440496
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D603440496
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 07:26:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4ec6:5d03:99e:22c7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 35AE113F8AC;
 Sun,  4 Sep 2022 09:26:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Sep 2022 09:26:03 +0200
Date: Sun, 4 Sep 2022 09:26:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20220904072603.GQ68979@scaer>
References: <20220901212415.2737731-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901212415.2737731-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662276367;
 bh=tBZpO7yt4JH1ve4q4XbXYQAOLmA/w1PsppsCLVgoo3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R3oB9rIKF5dfm9X5Dy/OprW4ykU8/JLQRiMPLSoRzI8+11ZLddWAW5rVaq0+dHr5/
 SIEP7FecCXiXshfxKHlJlYcCUGoOqYhsH53azjtkUoWML3oRDNXmKFVfYIN8nddHSJ
 hC7NNRLUTEZ/3eDO6pZwp53VdcD5ahgkCmsB7b0cKGmcMj1Ui4wcGE5haVT3wCeKB3
 oLZOdEqE1gwTVUecEilCNA4JjGG3MCcmRaAtvGUAoZr6q5NVwj95OXEvxd/O4+pd9e
 0zuY9mjZI6wxkg9kzN6LHwBQLMaJFl/BeAUjBVbEsERe+qOmSLxbYFErN7Y63tyP5e
 NfaovpTzK/IXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R3oB9rIK
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.4.243
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

Dario, All,

On 2022-09-01 23:24 +0200, Dario Binacchi spake thusly:
> The hash of README.md has changed because the link to the zstd license
> has been added:
> 
> - ``
> + `- zstd (Dual BSD\GPLv2 Licenses) is from https://github.com/facebook/zstd`
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

uuu is a host-only package; there were 23 commts between 1.4.224 and
1.4.243, of which 17 actually identified as a fix, and some more
probably a fix but not identified as such, so applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> I have already submitted a bump patch to version 1.4.240, but before it came
> to mainline, version 1.4.243 was out. For this reason I submit this patch over
> version 1.4.224 which is the one currently in mainline.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/uuu/uuu.hash | 4 ++--
>  package/uuu/uuu.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
> index 7291f93c523e..de00c649b12b 100644
> --- a/package/uuu/uuu.hash
> +++ b/package/uuu/uuu.hash
> @@ -1,4 +1,4 @@
>  # locally computed
> -sha256  b8b7fcd0e8eca64a255bf2b964bfb39a97599670e5258858421b27ff86aac80f  uuu_source-1.4.224.tar.gz
> +sha256  9fcfe317c379be1e274aae34c19e1fd57188107f8fd0cdd379fe4473aacc92b1  uuu_source-1.4.243.tar.gz
>  sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
> -sha256  52b1828ddb508a180cf9ad159b61e655c72dfb25ffce67eb0aef761d38a4398f  README.md
> +sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
> diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
> index 647254446fa6..7ed2599598c0 100644
> --- a/package/uuu/uuu.mk
> +++ b/package/uuu/uuu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UUU_VERSION = 1.4.224
> +UUU_VERSION = 1.4.243
>  UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
>  UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
>  UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
> -- 
> 2.32.0
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
