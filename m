Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BF5C5ACB3
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7518418BF;
	Sat, 18 Nov 2023 14:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7518418BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FeePhZCDOLCD; Sat, 18 Nov 2023 14:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0395B417CF;
	Sat, 18 Nov 2023 14:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0395B417CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2DA1BF25F
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75EAC81F31
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75EAC81F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ploDQJenSJuU for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:20:58 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 846E681D16
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 846E681D16
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id ACB6478032A;
 Sat, 18 Nov 2023 15:20:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 15:20:52 +0100
Date: Sat, 18 Nov 2023 15:20:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231118142052.GW996011@scaer>
References: <20231115203118.3578238-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231115203118.3578238-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700317256;
 bh=Q66dZ8RDlDFKkA1I5duFwQ8KGJX488yPCPNRc0Mn1fU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z3+/aqtOEEAAxtxWanpofvYKvqKNRBXFAPKDGGwagNeq8yyVyNgepv/4x9J8K8Jjc
 R7LrrZoVqlNzxonqvJKxPUPOdyybvTUzf559Q0H0pK0LGpnVniRYfaPHC2EMz+KQU+
 y0aM+iOTbBUrO6iQonZdk4UUzEOnQuUTOFA0I5bnD+0eRNemVXzSCkEzB+wmc41heZ
 yxrEENJ3Ye4NILQcyOEQLXwyTa1CrrqIzQW2P04Mf37/WS4lvb4OOgoxlv3VSp4x2E
 xEE+ADss+5TTEBgQn4D1IFotw+oc9klJwG/gqUMqHRyJ/hNltftffujRogQM4EngiZ
 SAbSz1hdj3Jww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z3+/aqtO
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to version
 2023-11-13 on branch 5.11.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-11-15 21:31 +0100, Giulio Benetti spake thusly:
> It supports up to Linux 6.7.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

both Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rtl8192eu/rtl8192eu.hash | 2 +-
>  package/rtl8192eu/rtl8192eu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
> index 8528689670..e27acba124 100644
> --- a/package/rtl8192eu/rtl8192eu.hash
> +++ b/package/rtl8192eu/rtl8192eu.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  665a8f857b3881554edd6d5e5e6c8f058b8ecfecf921817993e861d48e214d36  rtl8192eu-ac8517206e14f70babbeed68e136ee23c85cba3d.tar.gz
> +sha256  2326902c27aee022bd1f6e49e8dbf789b08613e660385c23ded8038074d7929b  rtl8192eu-a928f08c1dd4f9a1e84d85811a543e974551bc4f.tar.gz
> diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
> index 9ae29d9940..a2fde6fef0 100644
> --- a/package/rtl8192eu/rtl8192eu.mk
> +++ b/package/rtl8192eu/rtl8192eu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8192EU_VERSION = ac8517206e14f70babbeed68e136ee23c85cba3d
> +RTL8192EU_VERSION = a928f08c1dd4f9a1e84d85811a543e974551bc4f
>  RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
>  RTL8192EU_LICENSE = GPL-2.0
>  
> -- 
> 2.34.1
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
