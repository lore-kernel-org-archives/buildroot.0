Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D9EC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CCBB402F2;
	Sun,  4 Feb 2024 21:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CCBB402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gp6NsxKpx9oT; Sun,  4 Feb 2024 21:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4219F40420;
	Sun,  4 Feb 2024 21:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4219F40420
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 723111BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43A464055F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43A464055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsoxVzVU4XBC for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:18:57 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2CBB402F2
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2CBB402F2
Received: from ymorin.is-a-geek.org (unknown [194.78.211.220])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3281119F553;
 Sun,  4 Feb 2024 22:18:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 22:18:50 +0100
Date: Sun, 4 Feb 2024 22:18:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb__OlS2XKGMaCff@landeda>
References: <20240204181435.1657162-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240204181435.1657162-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707081534;
 bh=Oexmi8LERVzRxrFqr22V4LWkkT3xI73nTTiL1hMJhwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t4niylcBn9oFHR7DYoSUzzTUwDDOST06399phJI/NCRGi7BZ50sNEdjgbVVzGl4Bs
 123ZUcgskC02eD18lqA7xUd7jzH6whSu0p3miDC/qoedFmoGvftF52H4nNJh2h/4F5
 +V5VUulYTd6w0sVtgZSHRhhYZ1HXUlv4GiWG8qhJ81Lv6JerG4tzy0HPKKrVmqTh7p
 t0xstqsSGpAfjlL8V2PCUZaLAezCW39HBno4jPo1dcKYYKNeJhk5xKcwmduBSdkvdK
 i07Z2CXAi5lPurDKbisVKunpod8BXj89K4x1cgcA0TcBRGRhPxQU3wjoD8lUNbUGAp
 2yAdcW+s4THKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t4niylcB
Subject: Re: [Buildroot] [PATCH 1/1] package/opus: set OPUS_CPE_ID_VENDOR
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

Fabrice, All,

On 2024-02-04 19:14 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:opus-codec:opus is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/6C4EA9AB-4801-48FF-9737-A7C3B368C41B
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/opus/opus.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/opus/opus.mk b/package/opus/opus.mk
> index 15531b521a..cbc07a091b 100644
> --- a/package/opus/opus.mk
> +++ b/package/opus/opus.mk
> @@ -8,6 +8,7 @@ OPUS_VERSION = 1.4
>  OPUS_SITE = https://downloads.xiph.org/releases/opus
>  OPUS_LICENSE = BSD-3-Clause
>  OPUS_LICENSE_FILES = COPYING
> +OPUS_CPE_ID_VENDOR = opus-codec
>  OPUS_INSTALL_STAGING = YES
>  
>  OPUS_CFLAGS = $(TARGET_CFLAGS)
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
