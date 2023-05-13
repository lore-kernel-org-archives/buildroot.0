Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFA5C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D75242A6C;
	Sat, 13 May 2023 20:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D75242A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsjEnAbH93AW; Sat, 13 May 2023 20:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F7A142A5D;
	Sat, 13 May 2023 20:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F7A142A5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2E9A1BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A92E64047D
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A92E64047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGlygCGaOqqf for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:31:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C866B4000B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C866B4000B
 for <buildroot@uclibc.org>; Sat, 13 May 2023 20:31:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 26CC7B0054C;
 Sat, 13 May 2023 22:31:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 22:31:06 +0200
Date: Sat, 13 May 2023 22:31:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Luke D. Jones" <luke@ljones.dev>
Message-ID: <20230513203106.GN2582048@scaer>
References: <20230315084624.1665061-1-luke@ljones.dev>
 <20230315084624.1665061-5-luke@ljones.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315084624.1665061-5-luke@ljones.dev>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684009869;
 bh=d95hTqdXI9B0NwpDYCt/yWPpZnJwqMFueBm4jlBxwH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QXYX95MyPixXYthBJaex+chH6Y+4u8SHk9LgmyvY4XyMIcgOwYMJqLVEycZMhInWE
 PQRAsxvMRyvPmO5gjLxrVzXqqzwhOTYrg2sUjMbuaMDMG7JpAwWKAubK6VXWgyISkv
 UAiQzvtJREF1a4mJcG+a3/qoBWtQFfjWsVlixK17pyUeTTbcRWNzE6fnVRMeJZb8Qj
 qrBBd6XuBEFSRX8CpnKJW4nkObup4pDiQQMAG35K/16h1tMgpeiUWuN9NlcnRi9w5u
 2H/L4YWYuMVor4r6oCXC5Ry1z2V1hANd9iuKGgtaWB3UiH1r9NpDj7zRnxglVbIWvL
 t4/Iw1kdrprmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QXYX95My
Subject: Re: [Buildroot] [PATCH 5/5] package/sdl2_ttf: bump version to 2.20.2
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luke, All,

On 2023-03-15 09:46 +0100, Luke D. Jones spake thusly:
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
[--SNIP--]
> diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
> index f859d097fff7..c2c4b660f82f 100644
> --- a/package/sdl2_ttf/sdl2_ttf.mk
> +++ b/package/sdl2_ttf/sdl2_ttf.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDL2_TTF_VERSION = 2.20.1
> +SDL2_TTF_VERSION = 2.20.2

That one too has already been applied with another later patch, sorry...

Regards,
Yann E. MORIN.

>  SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
>  SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
>  SDL2_TTF_LICENSE = Zlib
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
