Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DF4C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 08:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7DC409FD;
	Mon,  6 Feb 2023 08:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE7DC409FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBRhpykqxESN; Mon,  6 Feb 2023 08:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD7E7410BD;
	Mon,  6 Feb 2023 08:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD7E7410BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF1781BF329
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C89A2410BD
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C89A2410BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1SEspEDxEQY for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 08:46:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BF70409FD
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BF70409FD
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 08:46:04 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hr39so2428717ejc.7
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 00:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HTCPQByJ3YUYk9tlyJZ8NeRmFj71438xl5rX3aRW6C4=;
 b=Sth4jwYWolOgYNizM1IIuWp/XL6j3w7zggxrSeq2ORkZnuAGQJjOefzipgAonTZJoF
 4P03+JQr91ET7fIkfRrSoe/V6Ua8v+BRtO+JyjHfGRfqA6lu/DzjgktwqS3+SUk1oDYQ
 r/EZwpoVyppX2herOOV51gKCJQqyxd7XE6jHfVxMeuSjL5iX7h0SgHqd+13+RSrdRlyb
 2oaRJQC0r7ZvJKtIWxdfEVHISkfmD0DR8IreTRKijBobvk8kplWMLT3G7QCrr7giT8xb
 +qRDnaq2KX9gRWbscRDgr12Z6nqsdHxqfMfDO6iW8joc9MckkNJgNT+lvurS/w/o/CHO
 gHSg==
X-Gm-Message-State: AO0yUKXTbZ/7R1PVw88uLpizrz2BNFc7rpMCadkyFyUfA+9jb3gXvbwg
 fQOkxt4bPB+wcQrKjS8z4RsRGGO9jTzpgMC1xZumJkC6ox2Qkpz8KUEXlQ==
X-Google-Smtp-Source: AK7set8kSznaq2nprzHvlLQKwL8agaN8zBx4l2F8GkRne3a3iZwgbr2ay7+1q72Ux4MIFlerlPI3te6KjGlLj6u5fMs=
X-Received: by 2002:a17:906:80d1:b0:87b:da77:ffce with SMTP id
 a17-20020a17090680d100b0087bda77ffcemr5393957ejx.217.1675673162440; Mon, 06
 Feb 2023 00:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20230205214132.6941-1-dario.binacchi@amarulasolutions.com>
 <CAFkzVZbvSgv2SA7EZeQPQpuc22TDe-vEGPoXj4GwdLSrMO11jA@mail.gmail.com>
In-Reply-To: <CAFkzVZbvSgv2SA7EZeQPQpuc22TDe-vEGPoXj4GwdLSrMO11jA@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 6 Feb 2023 09:45:51 +0100
Message-ID: <CABGWkvqtN-8TqPJSQ8cwBUSqDm2hqe0Q6g18nsGOTHYoZsX0NA@mail.gmail.com>
To: Scott Fan <fancp2007@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HTCPQByJ3YUYk9tlyJZ8NeRmFj71438xl5rX3aRW6C4=;
 b=PwlIFL+t4C2urBdt/bpgXoXZFfECmgSTMzyw6/ahwHUz1idsWKM2TeN2pGQzw8yZ7G
 2AdxhyULHeBht2LvtmQFgZwzAN8tXUROd3Ui11BVAcMsp4sW3YDyLlS00Ud1sHAveBNC
 f9Jk0+2Av2l3fzLENhN3uUsmiNp5ptBC70LtI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PwlIFL+t
Subject: Re: [Buildroot] [PATCH 1/2] configs/beaglebone: bump Linux version
 to 5.10.145-ti-r54
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
Cc: Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Scott,

On Mon, Feb 6, 2023 at 1:20 AM Scott Fan <fancp2007@gmail.com> wrote:
>
> Could you test it with kernel 5.10.162-ti-r56 ?
>
> https://github.com/beagleboard/linux/releases/tag/5.10.162-ti-r56

Thanks for your suggestion, I will test with kernel 5.10.162-ti-r56 kernel.

Thanks and regards,

Dario
>
> Scott Fan
>
>
> On Mon, Feb 6, 2023 at 5:42 AM Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
>>
>> The previous version failed to boot from sd card with a log reported by
>> the document [1]. In my case it always failed, a 100% failure against
>> 75% reported by the document.
>>
>> Instead of adding the patch to fix the problem, I preferred to update
>> the kernel version as suggested by the document itself.
>>
>> Tested on beaglebone black.
>>
>> [1] https://forum.beagleboard.org/t/5-10-x-beaglebone-black-fails-to-boot-from-sd-card/33297
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> ---
>>  configs/beaglebone_defconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
>> index 639b491e9746..dff7dea422ee 100644
>> --- a/configs/beaglebone_defconfig
>> +++ b/configs/beaglebone_defconfig
>> @@ -20,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
>>  # Kernel
>>  BR2_LINUX_KERNEL=y
>>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.30-ti-r3)/linux-5.10.30-ti-r3.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.145-ti-r54)/linux-5.10.145-ti-r54.tar.gz"
>>  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
>> --
>> 2.32.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot



-- 

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
