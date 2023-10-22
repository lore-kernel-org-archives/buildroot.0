Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97612C0032E
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 14:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C7C2612CA;
	Sun, 22 Oct 2023 14:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C7C2612CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2WILT5m0xRb; Sun, 22 Oct 2023 14:28:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8198C70A8A;
	Sun, 22 Oct 2023 14:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8198C70A8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52FC41BF298
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3893F404B9
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3893F404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMyGvFsK46Nz for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 14:27:53 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA0B640382
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 14:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA0B640382
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CAB845FF3F;
 Sun, 22 Oct 2023 16:27:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 16:27:48 +0200
Date: Sun, 22 Oct 2023 16:27:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231022142748.GO2607@scaer>
References: <20231020154506.30993-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020154506.30993-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697984870;
 bh=DNoEqLBxXzDROe3/9tjzZboMdSj6FbDQ2m509bSPGTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BSn/LM7//WRv86cT7d8mMUNTj4BaoJgzRq/Tq+LTCYFNTXmeeX9tR6oYCy9LZYzfT
 sc7ixolHuod+6zm4QICURybkEl0TOAeaKyZzLdFZX0QwjvADu2Yg0ymRD363un4WoF
 TDhOmYwMjLrewhao9/Xa84x2l4neRCSlgWlocOOtSX9+V/zFvupKf2IN9ljOAm4pyx
 P8inof/CrBkRG/f6ZXX/tJrfI4XBrL6hxvpOY3Y5OoMlJt9w56R+z9PuDSWZV35zLB
 sB4ag8vh6LcpTNAZKuDl5b0am3TNypu0t6nmUw/Ejse+laTvNBHM/8JupaRL/hJBT3
 nOMd3C5c/Eolw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BSn/LM7/
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.117
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

On 2023-10-20 17:45 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-October/003429.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libdrm/libdrm.hash | 6 +++---
>  package/libdrm/libdrm.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
> index 32b39d6a1b..73f3d29f5a 100644
> --- a/package/libdrm/libdrm.hash
> +++ b/package/libdrm/libdrm.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.x.org/archives/xorg-announce/2023-August/003416.html
> -sha256  46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a  libdrm-2.4.116.tar.xz
> -sha512  1287d1896deeb8cfb4532c6750eb43493dcefbfaaa598a73bbb682aa749594eaad3ed1fa2fe73d06280350f365a92a0c20cad8be76f3da2ed59b04aa008de911  libdrm-2.4.116.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2023-October/003429.html
> +sha256  a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b  libdrm-2.4.117.tar.xz
> +sha512  326cf565548fb9d50a321562c13acb2a2f5ad5915ffdc2b08ef812fbac887f5b3d271cb2ce8c483633edddf2c55064d55810ff6697f713c179e2d0c8048eb544  libdrm-2.4.117.tar.xz
>  
>  # Hash for license file
>  sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 70f449037d..b9201e4bd3 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBDRM_VERSION = 2.4.116
> +LIBDRM_VERSION = 2.4.117
>  LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
>  LIBDRM_SITE = https://dri.freedesktop.org/libdrm
>  LIBDRM_LICENSE = MIT
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
