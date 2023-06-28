Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9414EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 07:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4687181E22;
	Wed, 28 Jun 2023 07:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4687181E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSKmbYBLYnWY; Wed, 28 Jun 2023 07:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E2E28177C;
	Wed, 28 Jun 2023 07:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E2E28177C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4B71BF3C4
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 07:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F1E6408FE
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 07:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F1E6408FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2LTLbAIOLqqy for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 07:55:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04791408F6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04791408F6
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 07:55:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-313f1085ac2so3039852f8f.1
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 00:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687938917; x=1690530917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dKZOiTHCS1yx3QlX0Vw+t7bilRT4Mcc6OtZBz1f3qEU=;
 b=QHoBrOjicF+H6Xqqj92v3XTb/2XCAEivYMuv4bVZvLVFtcx5q6dRJMDY4rRGXX8wEQ
 VNofL2b2RL8vZLrWYOtzfzCSMP/WmuC1qVjmkdpouT3b30QvlQlWl49E0T9Yz776cHqm
 sJGrCmjl7qB1oMRARDktgaEwTS8DUz2qnVCiJrT0eEleTAvPJ+wRcLQ3ZTDZEHWChYHc
 8ooAvOtxwUUVFy2i3zwn2KdbClE8wK3vTHAJVjtQ/f9AIHa8DInTt4YiRkkY340i/8gB
 7+6UlsaMfh0ReDZ8KlwWOjwS0appAomahRho+gFC+csu1oJr7IdsCaz57t0lGUDgJyFH
 W/wg==
X-Gm-Message-State: AC+VfDxqQTowg/1H/ZR4GCST/rNqM+cY8KNVjfsXgK7vZWu7fbQf8Sqt
 yw0/IUgzifn63+xwyAAJGhGhgIE3+bg=
X-Google-Smtp-Source: ACHHUZ7iye/Qc0BwHkTbORy8v/2Y2wfg4wmxJuiKPWLMFOP0PSzoxkH0a/UH736OIRhwZ0azCd/IEQ==
X-Received: by 2002:a5d:6351:0:b0:312:754b:bd2 with SMTP id
 b17-20020a5d6351000000b00312754b0bd2mr19189301wrw.47.1687938916820; 
 Wed, 28 Jun 2023 00:55:16 -0700 (PDT)
Received: from p1g2 (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr.
 [83.204.213.113]) by smtp.gmail.com with ESMTPSA id
 d13-20020a5d4f8d000000b003063db8f45bsm12586128wru.23.2023.06.28.00.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 00:55:16 -0700 (PDT)
Date: Wed, 28 Jun 2023 09:55:15 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <ZJvnY1izYrShopxk@p1g2>
References: <20230620170922.3722-1-ckhardin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230620170922.3722-1-ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687938917; x=1690530917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dKZOiTHCS1yx3QlX0Vw+t7bilRT4Mcc6OtZBz1f3qEU=;
 b=iSB+YBIx8HN6TLOg8l4qb3NrbiUAwUTLJYnb14ITO+UVKELY3GOEndn7+n4OUxspK5
 Y+4/kDJqA3UPXsQc950SNPZra4phTYoW0CvhGo7059Sj/YbfvkHFqPsevCbwlW2z6A0a
 PndVnKh4+kmFT4LyRrJ6io0YF4kEuROO3AIJdf0bO1F/K279N/KTY7zzEObRSCPu1YuF
 J0eWybb/zjp8PuwsvOxbXZE1esMPLVIPCX6S6BLemfl5PjnGlk4SkLYlU184G7ooCY7/
 pvJkT6VFME1byd+ruSucIvKuNk41ESs59O2RNRym6rG7uEBvICoiCz1NRaVibZDnb2fv
 PXdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iSB+YBIx
Subject: Re: [Buildroot] [PATCH 1/1] package/firmware-imx: ensure the linux
 firmware is installed first
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Charles,

On Tue, Jun 20, 2023 at 10:09:22AM -0700, Charles Hardin wrote:
> There was imx SDMA firmware in the base linux-firmware package at
> one time, but the firmware-imx is updated with the latest versions
> from NXP releases.
> 
> This just ensures a dependency is set so that the imx package will
> always come later in case an overlap occurs again.
> 
> Signed-off-by: Chares Hardin <ckhardin@gmail.com>

The above line seems to be here by mistake, please remove.

> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

With that line removed:
Reviewed-by: Gary Bisson <bisson.gary@gmail.com>

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
