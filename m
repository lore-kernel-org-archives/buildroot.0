Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F53C0502C
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 09:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D44A60B69;
	Sun, 28 Aug 2022 09:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D44A60B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLius5rddd_B; Sun, 28 Aug 2022 09:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D864E60AF7;
	Sun, 28 Aug 2022 09:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D864E60AF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 457B11BF5AE
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DFFB4046B
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DFFB4046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oAa67Vc8Cxaj for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 09:42:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37FC24040D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37FC24040D
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 09:42:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7795A7804FF;
 Sun, 28 Aug 2022 11:42:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 11:42:16 +0200
Date: Sun, 28 Aug 2022 11:42:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220828094216.GJ37358@scaer>
References: <20220827205219.277331-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827205219.277331-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661679739;
 bh=pJ+xqQUgli6ZrmzNmgHakBGGnmdtU5mcQ16MGxGZ+Ok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XKcqrlznmqKYeXzdcCmZLhDXkmNCnalR0IjpD6ZN5Co2S3jG7NNuEW6A6xnorjBw8
 JNCRWuqfBkUDIirWV/fi56qriwwRRCYoRxra/D6JTHHl2rlr9ZRnjPz2FzwzEGZpeV
 7rVoUvPjvjIL69HyxoPZG4Trxq5Qz35seExlw1LLYBkWf50fRiO/qa41Xid0Z/2els
 maOhR5eChaHFzJHyEg6e2k+9/efJjxcX3sYibGgMBCMDdyX5KZKnxMxDFqCUgFI78Z
 aB6gvxfZCDDjVc5ni0Nia7xRBp8XX3IFYo1df34/Zjr0sXZAGJDF5MpzoiJpgtqVS6
 GYG2B5XDfSbug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XKcqrlzn
Subject: Re: [Buildroot] [PATCH 1/1] package/minetest: add
 MINETEST_CPE_ID_VENDOR
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-27 22:52 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:minetest:minetest is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminetest%3Aminetest
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/minetest/minetest.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
> index 5c007ada5e..6d56c3222f 100644
> --- a/package/minetest/minetest.mk
> +++ b/package/minetest/minetest.mk
> @@ -8,6 +8,7 @@ MINETEST_VERSION = 5.5.1
>  MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
>  MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds), Zlib (irrlicht)
>  MINETEST_LICENSE_FILES = LICENSE.txt lib/irrlichtmt/doc/irrlicht-license.txt
> +MINETEST_CPE_ID_VENDOR = minetest
>  
>  MINETEST_DEPENDENCIES = gmp jsoncpp luajit sqlite zlib zstd
>  
> -- 
> 2.35.1
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
