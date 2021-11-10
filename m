Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7D6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 085286109D
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 085286109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5869608F7;
	Wed, 10 Nov 2021 09:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P97zC73Shyht; Wed, 10 Nov 2021 09:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07271608FE;
	Wed, 10 Nov 2021 09:42:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B13D1BF345
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89AB140223
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGnn3cVmR7XW for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:41:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F5A84021B
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:41:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1CD495FF9D;
 Wed, 10 Nov 2021 10:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636537308;
 bh=wVHcvBLqBdWgkn4y+0iYMyhXHEYZ4y0SAZjKgwz2FL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kxDsX5Io0qv1MRf7Zjb/NWfspaeRmOmdXTpI50bzk/o6xRHsyz2mu+UVHb9hHjnSm
 /9xwcGd526K63qqlbidglWP/IHrW5i7ykcuyUCPu1kTFJQ6qBXuqxCzM3q9Yx23dPO
 WiQDxBbqSuk1fFvm/b4Vg6G3qw6v9S7niWk4+kHHxImYQzhTsrYGdwRuFbyQALA2r/
 PtYiOat39J7VUYcCsbXONpTAmHOy72b5cs5taioovA+R+9xVxYb43eqh9yCfamM85H
 WZK5C9C8k77Wd3wpRd/Anv7Mpss0p2JoCjUFAnv4rerejnW8GzZ/h8lC1J6PZlXrQx
 yInPgAT/ikK4g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 10:41:37 +0100
Date: Wed, 10 Nov 2021 10:41:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211110094137.GJ2084998@scaer>
References: <20211109172015.457094-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109172015.457094-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/gpu-amd-bin-mx51:
 don't override dependencies
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-09 18:20 +0100, Fabrice Fontaine spake thusly:
> Don't override GPU_AMD_BIN_MX51_DEPENDENCIES in a conditional
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
> index 5586073712..c99c568f73 100644
> --- a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
> +++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
> @@ -12,7 +12,7 @@ GPU_AMD_BIN_MX51_SOURCE = amd-gpu-bin-mx51-$(GPU_AMD_BIN_MX51_BASE_VERSION).bin
>  else
>  GPU_AMD_BIN_MX51_VERSION = $(GPU_AMD_BIN_MX51_BASE_VERSION)-x11
>  GPU_AMD_BIN_MX51_SOURCE = amd-gpu-x11-bin-mx51-$(GPU_AMD_BIN_MX51_BASE_VERSION).bin
> -GPU_AMD_BIN_MX51_DEPENDENCIES = libxcb xlib_libX11 xlib_libXext \
> +GPU_AMD_BIN_MX51_DEPENDENCIES += libxcb xlib_libX11 xlib_libXext \
>  	xlib_libXrender xlib_libXau xlib_libXdmcp
>  endif
>  GPU_AMD_BIN_MX51_PROVIDES = libegl libgles libopenvg
> -- 
> 2.33.0
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
