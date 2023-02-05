Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9079FC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 15:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 356C760760;
	Sun,  5 Feb 2023 15:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 356C760760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mdz0r9zzE4A0; Sun,  5 Feb 2023 15:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA83606EB;
	Sun,  5 Feb 2023 15:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA83606EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FDDC1BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 15:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1721F606EB
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 15:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1721F606EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QMG8ziMVstrG for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 15:05:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1577D606E7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1577D606E7
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 15:05:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8FCDF13F8CD;
 Sun,  5 Feb 2023 16:05:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 16:04:59 +0100
Date: Sun, 5 Feb 2023 16:04:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230205150459.GQ2960@scaer>
References: <20230205145036.654667-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205145036.654667-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675609504;
 bh=vM9g5DPhkkNTcHIBvT1hN+WldCkTzmBICcFTOy73Kws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XVTlCLmeTDEbMkfMy0PY7Qw/I3ng7+awJbCk9BLSH/QBggDMg65TjliDj/KOF7FfJ
 D/7rSsKP4hqozvRmxRgAa8y41sVK5zzZUyPkNzebJdAR0Dvzp8R6XhQkkpREfs/g5K
 +ytODVlj8AOLgIBmEYx5D+2PAFSD0xJRq89eo3w8JEDkp48htDhBf6R8K4LKB/eywk
 El/qhlJ1A8PqEDQPUzPO51fvgQH41FjHNRh6mjO26Q3i+S65vvRWffT/SJAI1tORPR
 H73HFjgEQ10EMxtjP+VwU+SEs3mKU9CuNb6fyyjqx4TF67k9Rxs4PeiZmMLJKTPHvd
 fuErOwYjjqzew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XVTlCLme
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix openssl
 dependency
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-02-05 15:50 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483:
> 
> Makefile:576: *** libopenssl is in the dependency chain of fluent-bit that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9c3b8e19063f7587877fdb0598739b55abccb3e8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Nice catch, applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fluent-bit/fluent-bit.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> index 879437e5f4..13077e53cc 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -10,7 +10,7 @@ FLUENT_BIT_LICENSE = Apache-2.0
>  FLUENT_BIT_LICENSE_FILES = LICENSE
>  FLUENT_BIT_CPE_ID_VENDOR = treasuredata
>  FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
> -FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml libopenssl
> +FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
>  
>  FLUENT_BIT_CONF_OPTS += \
>  	-DFLB_DEBUG=No \
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
