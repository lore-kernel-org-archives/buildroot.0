Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B9CC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAE5E60767;
	Sun,  5 Feb 2023 14:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAE5E60767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFM4OoKZMWyl; Sun,  5 Feb 2023 14:27:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66EA60776;
	Sun,  5 Feb 2023 14:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66EA60776
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5719B1BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3204540124
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3204540124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mM_-S3TVZYmB for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:27:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 415964010D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 415964010D
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:27:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 19E4F13F88E;
 Sun,  5 Feb 2023 15:27:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 15:27:05 +0100
Date: Sun, 5 Feb 2023 15:27:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230205142705.GJ2960@scaer>
References: <20230205140602.161881-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205140602.161881-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675607229;
 bh=WqAaFDUTbo17aGDUzL44vvKQL/DoQubD9VGRDKoKLzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=myLXrTCwrpHiGCOumDa89BYRpTFDfbIUdN8bgWV8SuXZEmzg0OBpHZ4NWm46k0EYL
 24Tn6rFlpiJK07QsSbM8tpIWxTzJ1HRv3Waquna+ZKRJl8hg6wDd1mhJb8wNonDGi4
 Nwj1I1ln0Qa1QoHI0ujQDpMcvWIslekt+oFDZkydmjXBq4i6YCzI+2ZEgDC1pCVjAV
 PHKmcix/smdpzRLrvZ/F0A9c/ymWpr3fXNf+KKWKxnme6MzUjdnKpltVVxszr61UH8
 1ubi9cPjeYpWbbLWK6+UnRadXvntF4DPy/+JRDqBcjnaKhueO3mvS+XryIKKjQ0+Jz
 2Fq2td9A8DRaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=myLXrTCw
Subject: Re: [Buildroot] [PATCH 1/1] package/upx: security bump to version
 4.0.2
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

Fabrice, All,

On 2023-02-05 15:06 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2023-23456: A heap-based buffer overflow issue was discovered in
> UPX in PackTmt::pack() in p_tmt.cpp file. The flow allows an attacker to
> cause a denial of service (abort) via a crafted file.
> 
> Fix CVE-2023-23457: A Segmentation fault was found in UPX in
> PackLinuxElf64::invert_pt_dynamic() in p_lx_elf.cpp. An attacker with a
> crafted input file allows invalid memory address access that could lead
> to a denial of service.
> 
> https://github.com/upx/upx/blob/v4.0.2/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/upx/upx.hash | 2 +-
>  package/upx/upx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/upx/upx.hash b/package/upx/upx.hash
> index 9f7c40c819..7c24906152 100644
> --- a/package/upx/upx.hash
> +++ b/package/upx/upx.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  77003c8e2e29aa9804e2fbaeb30f055903420b3e01d95eafe01aed957fb7e190  upx-4.0.1-src.tar.xz
> +sha256  1221e725b1a89e06739df27fae394d6bc88aedbe12f137c630ec772522cbc76f  upx-4.0.2-src.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/upx/upx.mk b/package/upx/upx.mk
> index ef346b2310..6018b0a63d 100644
> --- a/package/upx/upx.mk
> +++ b/package/upx/upx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UPX_VERSION = 4.0.1
> +UPX_VERSION = 4.0.2
>  UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
>  UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
>  UPX_LICENSE = GPL-2.0+
> -- 
> 2.39.0
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
