Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55867C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 17:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EDDF40891;
	Mon, 27 Nov 2023 17:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EDDF40891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nslG6pHcnnjx; Mon, 27 Nov 2023 17:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46340404E2;
	Mon, 27 Nov 2023 17:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46340404E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D32F1BF860
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 17:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0513A405D6
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 17:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0513A405D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mu3PnN0NMlh for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 17:16:22 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1774404FF
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 17:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1774404FF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E59FAB0053E;
 Mon, 27 Nov 2023 18:16:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 18:16:17 +0100
Date: Mon, 27 Nov 2023 18:16:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231127171617.GU3177259@scaer>
References: <20231126225342.324803-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126225342.324803-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701105381;
 bh=Ca9Qa1RTVKN+2pfaGcwP4PWgXBV34kfNqYkZBsASAa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qy+LECnDez9RjnT3m3uZ/bKZ5dP4kNLiRN+LONYXIv2TU0wq2TorarvjuaDS9Mpam
 IFc8NqjJpGoiP9DoliulPa5UfcxrukCFo/br4aAwn58cKqF0TFn3pxZxjaiCppckHg
 jPnZl7fi6YhjeKIPvxJPbNolaFOQEfXarQBrouFx3tGzzF46+4JIn2imliJXaGVPf3
 gJDmnVJiyiVrfKVE81GsJeEnDoiNB4Us2Q5hxyoMLYJNruiE/GsBblQLM/YYNDBZ5X
 2VdeYvr17rYw8MzWG0bHxzVCY7kGDis7BLhiyUyDM3sIv+30jQtLXWIWC44ShjqmfP
 U6y4+9DUfjFlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qy+LECnD
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xwayland: add
 XWAYLAND_CPE_ID_VENDOR
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-11-26 23:53 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:x.org:xwayland is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/6F35318F-48A3-45B0-B70A-F953B7B0A0E8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/x11r7/xwayland/xwayland.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
> index 1b626327ad..17048b4989 100644
> --- a/package/x11r7/xwayland/xwayland.mk
> +++ b/package/x11r7/xwayland/xwayland.mk
> @@ -9,6 +9,7 @@ XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
>  XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XWAYLAND_LICENSE = MIT
>  XWAYLAND_LICENSE_FILES = COPYING
> +XWAYLAND_CPE_ID_VEBDOR = x.org

Welcome to the Wonderful World of Typoes! :-)
    s/VEBDOR/VENDOR/

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  XWAYLAND_INSTALL_STAGING = YES
>  XWAYLAND_DEPENDENCIES = \
>  	pixman \
> -- 
> 2.42.0
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
