Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB073C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 18:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A673D83DC3;
	Sat, 27 Jan 2024 18:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A673D83DC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSCXKido2i04; Sat, 27 Jan 2024 18:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F098883DF7;
	Sat, 27 Jan 2024 18:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F098883DF7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D71841BF388
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0CDE60A61
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0CDE60A61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28Ny3dBVGXhz for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 18:08:14 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB7B360A4F
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 18:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB7B360A4F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A3AB113F88F;
 Sat, 27 Jan 2024 19:08:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 19:08:07 +0100
Date: Sat, 27 Jan 2024 19:08:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <ZbVGh4OQOOV8R0Nb@landeda>
References: <20240121195014.3560982-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240121195014.3560982-1-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706378891;
 bh=o6VflasOkJmkkSj7V8olVxDQra3LYQi6ck/N+oihvgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MmwlddPokC+LLf4goou6N97ktwwvfS+IDtD/RWnzLgVlY620wn3aHnM49LLH0NxY8
 dMdcPIDWBloerhsJjW/6JZUJcT0WeKEJsjG84wHBf1sfCjX8H0syPElUwsUjQYltDI
 tE0BkOBhhT4dDYcs3U2TNxnJpL/0bLQaZ2QRc5dpCxvJdMLFQ8sPUmndPDojQTxONT
 cJ80C31d+cEz2Mh+sbJFEj7p/L9RJjdWEM5le2oQj1WwaY/X8nQvPE2kyTgDLVbm7d
 3gMKxI34xoAmS3BzAOcEB2bX9ufSYkjgf3LFPfnYUlXM2ZxprWTNFE+nYAN/KgaSuH
 FYn29K8MX4zxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MmwlddPo
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: install
 rtlwifi/rtl8188fufw variant
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joachim, All,

On 2024-01-21 20:50 +0100, Joachim Wiberg spake thusly:
> Adds support for the rtl8188fufw firmware variant, for 802.11n, as
> covered by the mainline rtl8xxxu kernel driver since Linux 6.2.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/linux-firmware.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index c09dbc523e..ee51ecc930 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -134,6 +134,7 @@ LINUX_FIRMWARE_FILES += \
>  	rtlwifi/rtl8192sefw.bin \
>  	rtlwifi/rtl8188efw.bin \
>  	rtlwifi/rtl8188eufw.bin \
> +	rtlwifi/rtl8188fufw.bin \
>  	rtlwifi/rtl8192cufw_A.bin \
>  	rtlwifi/rtl8192cufw_B.bin \
>  	rtlwifi/rtl8192cufw_TMSC.bin \
> -- 
> 2.34.1
> 

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
