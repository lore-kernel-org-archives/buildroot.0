Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF20C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAB1240012;
	Sat, 20 Jan 2024 23:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB1240012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_GwKsNhrkyy; Sat, 20 Jan 2024 23:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF573400F9;
	Sat, 20 Jan 2024 23:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF573400F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6637C1BF471
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49E0A400F9
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49E0A400F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8B5L-p8UnxdH for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:02:27 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B61540012
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B61540012
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3BB0213F861;
 Sun, 21 Jan 2024 00:02:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 00:02:20 +0100
Date: Sun, 21 Jan 2024 00:02:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Hitz <christian@klarinett.li>
Message-ID: <ZaxQ_Ea2bdNmi62l@landeda>
References: <20240110170759.3966933-1-christian@klarinett.li>
 <20240110170759.3966933-2-christian@klarinett.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110170759.3966933-2-christian@klarinett.li>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705791745;
 bh=ObUR1MOSZz5fGHIivdWwFSUYI1zanQuHxYmxMQn7PSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lc4d7OlHqk8z09nGVK2HuPDs13z0KmYopKJckSjCurr1pRxAvWTYn2WEwwPqBbwmW
 6HPYEzYbvXIJvvGSlXoOYtsBg8PHHv6XvAfDombYovpl17iFY8vfImZetgdlfEghi1
 aZIxBbKZYqMLgh4LuAg+MkP5m9m8S26fORGwNbpvRKyEdJL8mB9/VUXJleJxu8tdB0
 X6ozqiIvs+ceoHDr28BJXWq1LnGwsT6wTyVQOJ27YlVSrPeHAsv32TH44N7U9KJ7KH
 /A2IYG4eEPYczGcjWDMftt9ssigEJEXYZfJHYhdZB8/k7LcGl6DAuVbb+7JESwFVwm
 5/J1E+ZxDlgIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lc4d7OlH
Subject: Re: [Buildroot] [PATCH 2/2] package/qt6/qt6base: add
 QT6BASE_CPE_ID_VENDOR and QT6BASE_CPE_ID_PRODUCT
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
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-01-10 18:07 +0100, Christian Hitz via buildroot spake thusly:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> cpe:2.3:a:qt:qt:6.4.3:*:*:*:*:*:*:* is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/8397D12E-2D77-458E-B9C3-DC7B4775B1A7
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

Applied to master, thanks.

Similarly to qt5, we probably want to propagate that info to all qt6
packages as well. Could you look into it too, please?

Regards,
Yann E. MORIN.

> ---
>  package/qt6/qt6base/qt6base.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 67c705fb93..667dd4133f 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -7,6 +7,8 @@
>  QT6BASE_VERSION = $(QT6_VERSION)
>  QT6BASE_SITE = $(QT6_SITE)
>  QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
> +QT6BASE_CPE_ID_VENDOR = qt
> +QT6BASE_CPE_ID_PRODUCT = qt
>  
>  QT6BASE_CMAKE_BACKEND = ninja
>  
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
