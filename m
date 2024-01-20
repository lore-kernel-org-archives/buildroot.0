Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97CEC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7030940012;
	Sat, 20 Jan 2024 23:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7030940012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WInVWuOBwjPj; Sat, 20 Jan 2024 23:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AAE0400F9;
	Sat, 20 Jan 2024 23:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AAE0400F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0F131BF471
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B27EF41F6A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B27EF41F6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9yKYvyKu95EI for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:01:28 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5A1E416D0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5A1E416D0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ECBBB13F88E;
 Sun, 21 Jan 2024 00:01:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 00:01:20 +0100
Date: Sun, 21 Jan 2024 00:01:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Hitz <christian@klarinett.li>
Message-ID: <ZaxQwEvl-DSqswqA@landeda>
References: <20240110170759.3966933-1-christian@klarinett.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110170759.3966933-1-christian@klarinett.li>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705791687;
 bh=cgSC+bQE9ck6nUZAHtpHnj/oD5B3GjRW01ryzOU+1a8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a6GBQ06XqKPK6JuZ7jkP20YpPfKDmQFlT93EQBaHkQqrjryvXXEQIiYzYXMJ/ACIv
 0JaSo4XeSwslmTp+fSKsS47tlE1x+9qkuVZLeVD/X4J1U8WiRt2c9RJeKd8FTi95Gb
 FXdmfXjE+DM7ssXpijOOj0dp0r6nxoKCWhPNnK1bsQ5oNv26RKgeSXhL66A9lba0fr
 xaz1c/736Wg72y98i1ENZlo44Gl9E3B9x9qtQ5cZOukASB/2Cw7dnReR23zlCvqEIz
 mVkbTK0WyzKcw2KBzaPjeqVHv9vMglbdcZiGDXp+8VW+lf7xB/s0b8TD6ERdy2HAYa
 ovynEEBZgaFfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a6GBQ06X
Subject: Re: [Buildroot] [PATCH 1/2] package/qt5/qt5base: add
 QT5BASE_CPE_ID_VENDOR and QT5BASE_CPE_ID_PRODUCT
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Hitz <christian.hitz@bbv.ch>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-01-10 18:07 +0100, Christian Hitz via buildroot spake thusly:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> cpe:2.3:a:qt:qt:5.15.8:*:*:*:*:*:*:* is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/3A753A6D-0AFE-4E62-9C2F-58C8B630830C
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

Applied to master, thanks.

We probably want to have this defined in all qt5 packages, too. Could
you send a followup patch doing so?

Regards,
Yann E. MORIN.

> ---
>  package/qt5/qt5base/qt5base.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index cc29f5523f..91891a2ec2 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -7,6 +7,8 @@
>  QT5BASE_VERSION = e44097b63d17ba3178a637df7fac51ddc51cb48b
>  QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
>  QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
> +QT5BASE_CPE_ID_VENDOR = qt
> +QT5BASE_CPE_ID_PRODUCT = qt
>  
>  QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
>  QT5BASE_INSTALL_STAGING = YES
> -- 
> 2.43.0
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
