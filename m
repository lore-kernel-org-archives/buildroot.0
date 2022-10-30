Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0D9C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9620860B00;
	Sun, 30 Oct 2022 19:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9620860B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSOOD7OtfDV0; Sun, 30 Oct 2022 19:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B67D660AF1;
	Sun, 30 Oct 2022 19:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B67D660AF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 437811BF2A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A5C5402E1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A5C5402E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rR7hif_hs1vH for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:33:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA8F240302
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA8F240302
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:33:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F2442B00571;
 Sun, 30 Oct 2022 20:33:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 20:33:06 +0100
Date: Sun, 30 Oct 2022 20:33:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221030193306.GD1058960@scaer>
References: <20221026175430.3927965-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221026175430.3927965-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667158391;
 bh=YXLnXANQmtphyrQsndhm8V9EVzoKKTMQXwbh3aBm7So=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPnjWLrS/bYTSdiggwFqt1TPB/EG64uHbmrOdbdw9Yz4DE6IaRrxNA+88MUgeET5D
 LjMJcZUzt2auDs15ANVEP608DJX88lebvxAp7IlbTqZxPdsaHUwGyGqBoyx9ilF17c
 WDuJA8z0xPxlu/kgumC9On6p2nmJazKqD7KvWjcRJGap8plmftDwMn7KFmpaTDyWgM
 BggGeljigdmgzFJAYxOKj6/KBfFdwpeMUiA2ynAUBK129/JyKikzvkDv+k3m/r+PWK
 DGJsQOaN0fH7ChTZKLm6ehGYrBCqbbiQxcbZzNoM9/xrnoyM7mx4EY2u7AMnZQjLPO
 P5vfj33R4BCyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hPnjWLrS
Subject: Re: [Buildroot] [PATCH] package/binutils: prevent selecting 2.37
 for AVX512 systems
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-10-26 19:54 +0200, Thomas Petazzoni via buildroot spake thusly:
> Support for the AVX512FP16 instructions was added in binutils
> 2.38. See the binutils 2.38 releases notes [0] that state:
>     X86:
>     [...]
>       * Add support for Intel AVX512_FP16 instructions.
[--SNIP--]
> Also, in Buildroot, we do not distinguish AVX512 in general from
> AVX512FP16 specifically, so our only option is to make binutils 2.37
> unavailable for AVX512 systems even if some of them perhaps don't
> support AVX512FP16 anyway. This seems like a reasonable trade-off, as
> binutils 2.38 is anyway already the default in Buildroot, and
> AVX512-capable systems are fairly recent, and therefore using a recent
> binutils version should not be a problem on these platforms.

ACK

> Fixes:
> 
>   http://autobuild.buildroot.net/results/eb6e28c934654e6d714973415a2fb452f9580279/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/binutils/Config.in.host | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 51802db043..5dd2af2f9c 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -14,6 +14,9 @@ choice
>  
>  config BR2_BINUTILS_VERSION_2_37_X
>  	bool "binutils 2.37"
> +	# AVX512FP16 instructions were not supported before binutils
> +	# 2.38
> +	depends on !BR2_X86_CPU_HAS_AVX512
>  
>  config BR2_BINUTILS_VERSION_2_38_X
>  	bool "binutils 2.38"
> -- 
> 2.37.3
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
