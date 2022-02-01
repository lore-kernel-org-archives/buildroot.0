Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69D0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836EA4162B;
	Tue,  1 Feb 2022 23:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9PiSji8qesYU; Tue,  1 Feb 2022 23:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D06234162E;
	Tue,  1 Feb 2022 23:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 493191BF2BD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4588083260
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JM-ADV4OnlDC for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:25:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCD2083252
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:25:02 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2WDnnf9fks1JF2WDnXjKA; Wed, 02 Feb 2022 00:25:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643757901; bh=aMHPCPq2Gadoj1e39konBgkqmrhlw9trwi8c+9to+UA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=b1iLjyOcb+id8Bg+B8t2OKuKQoIy1zgUphCskz3OU6x1YvAeRB/MQSZCkmWc2tEee
 FYoaLa0mBc3tlGYm5FOX18R1e9zlSl9zBspaqu2/UbUVUrjRgrdpL2V/EWVL0jhedH
 MUyMjfVsHWMcA6Tpe30YncuufzsQXffHzxysekhEeBd4Jg4FuUh2tXQa9PDI7PSs3Z
 ezMg0sWLnGOh3PrN1TTU0yZ6E4+rteUB/phFzvbNd9QIWhnCyisJlbpNJtE/uts7An
 jTxH4eMmMvjoUVaoVIyrr2JvaM1gJvxcpo4Fk7aQ5cjA1HzNZjPhJx8g5mDFVUuawS
 x49cQwIq2Ls/g==
Message-ID: <bebd284f-c72e-c6bb-bde4-96d6838b2c10@benettiengineering.com>
Date: Wed, 2 Feb 2022 00:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220201232203.333403-1-giulio.benetti@benettiengineering.com>
 <20220201232203.333403-2-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220201232203.333403-2-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4wfNDWES/VuBuF7a/ltBkD1O2rOpazt3BHQ8e1OzkjtLkTs7ZFP3s7OxZurqOKQtmo7IvmwshK7zS0WL/ZhQIl++X9TQthZoTbMghvzHDd+018sijQr9QW
 Ks9GX54XD4MjtH0lDSXFwQL2BOlT3r/W6vFUwIlCQ3w7sMTmugNAKSUcPgjMCkm5ucXY8xjLuq2cHuiMoH3qtD1wUcr5dphJWHbIGaDpab40OEKHvI2ygy1n
 V6lwQ92AtTu/t7luD4k94OEq6H8Pq5vPPM9lm11fye5eQ8LGbn+Ax+WGTs+jx9ODkoWKxMwaQCdw6ERCHqKH2w==
Subject: Re: [Buildroot] [URGENT 1/1] package/util-linux: fix host build
 failure
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/02/22 00:22, Giulio Benetti wrote:
> The UTIL_LINUX_FIX_DISK_UTILS_COMPILE workaround is needed for host
> building too. So let's add it to HOST_UTIL_LINUX_POST_PATCH_HOOKS.
> host-util-linux is used a lot, so this patch fixes a lot of future
> builds.

I was too fast...

Fixes:
http://autobuild.buildroot.net/results/b8c/b8cb40efc036a01802c914544cd4fc29dfd67af6//

and others that are coming out.

Best regards!
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/util-linux/util-linux.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index e59ef7dadc..5a4ff64d01 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -41,6 +41,7 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>   	touch $(@D)/disk-utils/raw.8
>   endef
>   UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> +HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>   
>   HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
