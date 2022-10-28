Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350ECECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 03:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 741A460E3C;
	Fri, 28 Oct 2022 03:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 741A460E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8jY0J--cBhZ; Fri, 28 Oct 2022 03:04:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA520607C7;
	Fri, 28 Oct 2022 03:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA520607C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C44B51BF3A3
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 03:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACDAC81422
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 03:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACDAC81422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfVn8ib2PfjB for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 03:04:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB17F813CD
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB17F813CD
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 03:04:11 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d24so3705067pls.4
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 20:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hxFgW8d+W5kzYr9HIAa1bsvvETU58pJfjRVDOIxV+yM=;
 b=iTOGe/fMRka+y+uY30rjppOs2tddNnvPac8iKZKYiVRKUrkHZH+6ZKQlw53EFB/m3O
 MU60R7vPHuIhq7/YuS5Zf3Uftj+E8TMHof3YO94HnjCLu/4LQu4CZRkGN6REMniq1SUV
 M8Rg0VgcXmLUTLWCNiEJH59xO9ULZK/ypbezKjFlyD0HJPZNN4fY4MCXI7DTQhsM6FxN
 GGoIWSZLQ2pVTENVH+qfPBDAQ7rVn7zwIH2zbdml+VeInAmPmVuqkU9JFHllBd3KpUvN
 B4RntqSCbc/KvQ2CDxClu8EMgrahI8r864YmSM+efjeFiIfPRbhA0VexfPGbxcq889sE
 lOzg==
X-Gm-Message-State: ACrzQf3MmyN3Jp0958LolPsOxWeXfNAgTz1VCucoUrw4CGTNEDnSNuZv
 LpdqMaGcb9Ra24dJ+EC2Jp4/UH0rPpXtI0DE8/TRKEuG
X-Google-Smtp-Source: AMsMyM53VNMinSqrKdu3IboDAcB7QwZeORjFmNTLwBOZZnFeUxWSCUf4Nj53VAKOywvI0F78JgN788gc/0u5XtwlJhw=
X-Received: by 2002:a17:90b:4a0d:b0:213:587b:206a with SMTP id
 kk13-20020a17090b4a0d00b00213587b206amr12576107pjb.195.1666926251117; Thu, 27
 Oct 2022 20:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221022142040.625468-1-ju.o@free.fr>
 <CAOMZO5CxFizBnnyTf-bW=mJ=kO-cdrchN8xDgm6HaGr3+sKPMA@mail.gmail.com>
 <877d0ls30z.fsf@tarshish>
In-Reply-To: <877d0ls30z.fsf@tarshish>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 Oct 2022 00:03:59 -0300
Message-ID: <CAOMZO5ARKCNBFoJUcD_C5No=aZYCCkUpGpXdNH26ZigctehWzQ@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hxFgW8d+W5kzYr9HIAa1bsvvETU58pJfjRVDOIxV+yM=;
 b=VCTPeZjgWmWrD0GClpwTQi6datLTPqysvOD+dLBmSHABGQ7PmM+gZhoqsTXe6l4f0A
 e7EHP4klpDEawjWQktNePf4OL5TidK6Cw2Q1eq2PpxVwOdSs4nRxRmBhVx+dNP7fo1YZ
 bZa0xSsuMyb/F/2m4qpMOcL7bXc9NIKqwLMBRIgAtzO5yi85rC/eJT0Uq3Jh4HotzMMe
 xxKcmgilravvC7o1NWPOQCQ5TbSBDlxGCJsQGAbiwOYCV27rlFQ+EhbZ+6BCBMHRlyK0
 zIZc0fF1bgz/RavsQ7rsfYs7mBe1Az0GSY9wESDpyzkXBNB2uX+jTstQQX0wx9Jz1BOe
 LAzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VCTPeZjg
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8{m, mm}pico: disable ATF SSP
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
Cc: Julien Olivain <ju.o@free.fr>, Heiko Thiery <heiko.thiery@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

On Thu, Oct 27, 2022 at 12:24 PM Baruch Siach <baruch@tkos.co.il> wrote:

> The global fix might be this:
>
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index 5070849d9b43..a9b9bbcc5a1f 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -212,7 +212,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
>
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
>         bool "Build with SSP"
> -       default y
>         depends on BR2_TOOLCHAIN_HAS_SSP
>         depends on !BR2_SSP_NONE
>         help
>
> Commit cf176128ec4 ("boot/arm-trusted-firmware: add SSP option")
> mentions that not all platform implement the require hook for SSP. So I
> think that enabling SSP by default is not the right choice.

Yes, that is a proper fix.

Thanks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
