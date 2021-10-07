Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AD7C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:05:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC50610C8
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AC50610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2403E606CC;
	Thu,  7 Oct 2021 20:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HgUv1N_4blWo; Thu,  7 Oct 2021 20:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78942606C0;
	Thu,  7 Oct 2021 20:05:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 653281BF84C
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5351C4014E
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9ZxTSiZQl0X for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:05:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BBB64011D
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:05:51 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YZeImyov0nxSqYZeImfNvO; Thu, 07 Oct 2021 22:05:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633637150; bh=LdcA+zzs/Sp9wWCcVN9wiAQSkD4MWu1rSpds94CLfzI=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=IDxHYP3kfE/6PeOAwviYr6ZEuli0OW4dpy7suK4Zce8w5C0CKE6joPKlcshM3TPfV
 GjsqbxzWCuPcwOKOsCIGZR43Wdzqy29uX9g8mMFaHIVNqdlSbgdZR0DfWD5h36GU4B
 YlJE4CsK+HZwebu27rtuVlGdNAQrSuxZp5f1Dp+F2Fw25ogaEmAZOahk0yFjh1LYkJ
 oTBhCHrW3hXCbBylD6IWJ+kHmdp4C63vV+uw1OpFBw7ZxglUB5TxooI9tRkZquwGCE
 gmOnHtvSfRKroSSMICLj8AvsqMqkUy9fe9sgCwvmRHylO2FoXI8TQjGoqwtUxqGPxn
 hyPEyxhrRJ2Gg==
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, buildroot@buildroot.org
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
 <20211007095147.688449-3-kamel.bouhara@bootlin.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <2681298a-d25f-0767-a7ac-47e17423adc5@benettiengineering.com>
Date: Thu, 7 Oct 2021 22:05:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007095147.688449-3-kamel.bouhara@bootlin.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFGGiO5VJqit3YCCZaAfy4Ot3fGaZ4X2HzeHIK+cbHtMe+2QCzpduVT6fqDhdaUrcWO8B7kGE8tBA+M5jsRIMG4wWfmMb55TWnGX9A8qqE5Q7fcFQ0cM
 yg7igMMZhbADfoVc3dN9Mf/I2ix399M7IwPJQSypO+LdcUzCHNxSEg/aF8YcuxC2P8GbYe83ncSCOe8QIGoZnOv+bk+AAYGjdZjRH7R6oHXVHiWQASw5/K3L
 6vN53wxh49QPfSswqdiWOwnnOc2APIExHwlm88Cu+ykSUBj0Rgn82SnClu6juCBCDwq6n1F3/yGO3bs7G3eK0ItvR70vW2/YM+4fg5SiK48=
Subject: Re: [Buildroot] [PATCH v3 3/7] package/sunxi-mali-mainline: bump
 version
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kamel,

On 10/7/21 11:51 AM, Kamel Bouhara wrote:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Bumps the sunxi-mali-mainline upstream version to 418f55585e76f375792dbebb3e97532f0c1c556d
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

> ---
> Changes v1 -> v2:
>   - Updated package hash
> 
>   package/sunxi-mali-mainline/sunxi-mali-mainline.hash | 2 +-
>   package/sunxi-mali-mainline/sunxi-mali-mainline.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
> index e1c18fd4f7..96d8251f16 100644
> --- a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
> +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  72969ecf470b9e5ce787c2f8f36242926e1e892af0891924ee59a2cd206de39f  sunxi-mali-mainline-d691cb93884ca8ac67860502117bbec283dc19aa.tar.gz
> +sha256  b5e7e8f9f2886ed0b273f72ea16ae4868711726fe33e3d80ef24e86269c90fd2  sunxi-mali-mainline-418f55585e76f375792dbebb3e97532f0c1c556d.tar.gz
>   sha256  8a06bcae44a41a886f339b4338422415a786787f113e9ed6456ae117104a0b6a  EULA_for_Mali_400MP_AW.pdf
> diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> index 701a1fbbb4..b46f572311 100644
> --- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SUNXI_MALI_MAINLINE_VERSION = d691cb93884ca8ac67860502117bbec283dc19aa
> +SUNXI_MALI_MAINLINE_VERSION = 418f55585e76f375792dbebb3e97532f0c1c556d
>   SUNXI_MALI_MAINLINE_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
>   SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
>   SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
> 

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
