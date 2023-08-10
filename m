Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1278C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48B8540564;
	Thu, 10 Aug 2023 19:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48B8540564
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p38TdjRmZi38; Thu, 10 Aug 2023 19:57:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DC8E408D9;
	Thu, 10 Aug 2023 19:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DC8E408D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63BA81BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39082408D9
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39082408D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WfqFzVsgRvc for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:57:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9590440564
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9590440564
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98099FF802;
 Thu, 10 Aug 2023 19:57:50 +0000 (UTC)
Date: Thu, 10 Aug 2023 21:57:49 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230810215749.0f8c9032@windsurf>
In-Reply-To: <ZNPEfiHai0qCigGR@waldemar-brodkorb.de>
References: <ZNPEfiHai0qCigGR@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691697470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdtGKUfpRVkFIuoXUrj4RNvfbA51sk/3smM8/rGZJ5c=;
 b=iF73iRweB+/DeYMwvd8wyYJd8c6Espj77wEGnxNcnjCEnwW0Z/RM5VMy25ypVIu4aAetNm
 heg94x3G/upUr/wMaUTML+OPuv/okpIrPExAINJxsKr3LmiDqIWYmMV1GXmVVNw75FLyNb
 Jw1sHHICVYBMOHQPDKCAyy5sx5/Fr44GDualgvBOfmimASLeOtcoCOnB5Aego2APSQkps0
 LBNBRO54GsR9vRsbeSIZOszOVYwWZuiBoFb8qS0YdaolVmQId2QprQ2WmlWKY0idaBBYsA
 q7KsXMroVb5UKzwJcPjQGGHv5vVqQslurNtbi8KUTqOzPrr/bzVO7qFxLyjr6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iF73iRwe
Subject: Re: [Buildroot] [PATCH] package/batman-adv: update to 2023.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

Thanks a lot for looking into this.

On Wed, 9 Aug 2023 18:53:18 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Older Batman-adv versions fail to build with kernel 6.4.x
> with following error message:
> bat_iv_ogm.c:283:18: error: implicit declaration of function 'prandom_u32_max'; did you mean 'prandom_u32_state'? [-Werror=implicit-function-declaration]
> 
> prandom_u32_max got removed in commit 3c202d14a9d73fb63c3dccb18feac5618c21e1c4
> from the Linux kernel.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/205/2055ac3805d1941c148f1681a224570055dd83cd
> 
> For other changes in this release, see:
> https://www.open-mesh.org/news/112
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/batman-adv/batman-adv.hash | 6 +++---
>  package/batman-adv/batman-adv.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
> index 14a92c231a..6996d41561 100644
> --- a/package/batman-adv/batman-adv.hash
> +++ b/package/batman-adv/batman-adv.hash
> @@ -1,7 +1,7 @@
> -# From https://downloads.open-mesh.org/batman/releases/batman-adv-2022.2/batman-adv-2022.2.tar.gz.sha1
> -sha1  e1829e10fc37ea674a20cb9ba1d6c1483042fbfa  batman-adv-2022.2.tar.gz
> +# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2023.1.tar.gz.sha1
> +sha1  e3d6e8d4db772156d7ad021b9a166832633a2ea5  batman-adv-2023.1.tar.gz
>  
>  # Hash for license files

Weird what we have below are not only hashes for license files.

> -sha256  218ffb534fead1c9b5b0d90ec1b2fba688209cdf00e861bece1cbf469fe69953  batman-adv-2022.3.tar.gz
> +sha256  f46a7286660a5ec3506a1be7ef60b471c51ac70550597d598040479ab7b936b8  batman-adv-2022.3.tar.gz

                                                                             ^^^^^^^^^^^^^^^^^^ Seems wrong here

Could you look into this and send a v2 ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
