Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FD2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 04:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20284098D;
	Mon,  2 May 2022 04:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-TFZIFUzTPn; Mon,  2 May 2022 04:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FC5408E1;
	Mon,  2 May 2022 04:16:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBB371BF408
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 04:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9CCC81332
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 04:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEjNwEwA-RVz for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 04:16:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E30781331
 for <buildroot@buildroot.org>; Mon,  2 May 2022 04:16:48 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 86648440868;
 Mon,  2 May 2022 07:15:53 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1651464953;
 bh=i7N+jeNnU2kzn7/M7RGX6hVMBMwHuA29dUcA4TOQ4z4=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=vCuz1Lrspy9KIz8MIlE6gKuKCed2VAkamxOzwUJ90Sr+9SAMuDxRnPzllpcdNisyv
 QKym1wGGFewuIFgoQHJcxU2rsf8cBvcIhJS/6K/+8MsEKL73Odw0UgC2nLZSfB1Tpf
 cUkyfVR7j8CKV5MG+16oIhrZBfE6SLuCQKYd330Qdlux1Z9UOsLu0PifdsOJI2GaEe
 aw3WUXBBOrVaLho0oFNg3Sf05luBeMoNsU3C8lUjL1oAIYmXM62bnvxMVh5TwjZfrU
 40Xy2mnTHqajvwuaxszihMBfdSAZk1Ar0wybPDEItxC2DwCEUNkvYycWoi+BUNXyYu
 s9kq01wCNOT5A==
References: <20220502040500.93634-1-charles.hardin@chargepoint.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Charles Hardin <ckhardin@gmail.com>
Date: Mon, 02 May 2022 07:13:00 +0300
In-reply-to: <20220502040500.93634-1-charles.hardin@chargepoint.com>
Message-ID: <87mtg0y3f8.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: add
 aarch64 as a hostarch for arm tools
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Charles,

On Sun, May 01 2022, Charles Hardin wrote:
> From: Charles Hardin <ckhardin@gmail.com>
>
> The gcc toolchain is also released for an aarch64 host target and allow
> that configuration to be used as part of the configuration. Tested on
> on a aarch64 linux docker.
>
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

[...]

> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> index 4392205105..0f554953ec 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> @@ -7,6 +7,10 @@
>  TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2021.07
>  TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
>  
> +ifeq ($(HOSTARCH),aarch64)
> +TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-aarch64-arm-none-linux-gnueabihf.tar.xz
> +else
>  TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
> +endif

Maybe just

TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
