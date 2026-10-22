Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC533606A31D
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lARtOyBT
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7CC740932;
	Thu, 22 Oct 2026 09:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NIH3SIp6xyK; Thu, 22 Oct 2026 09:43:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DB8CD4090E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792662210;
	b=h8Gpuv80mGKsVsmD9qrJf2ognBtNlXzTYWQIT6DIR+SNsNRwwkO7i7A4twFnHeOmCWx/
	 ReXeL1UtiOCXlnTBQ9bmig5fgg9M4n91+V4s1ry0/tS40YOY05FSF0rIdJlLl/he39N/U
	 AGLMxsz3DSoQbA7BTmyi6GrsMXHQRRBt72Yn1HmzfOIydl9ks3OxPMAhAdb2pdTRGVgsh
	 50y0m1SgBH9h/9706r4NcjvRHyARUgyFTyLjCdqj8jIR0f3NztkZmC0l66X50CL1B4kPa
	 9E6n3wa4hMvFpQ4a746DQ6olme3lKVjcHKwxU8nltnW6r3sE8y/css24VIo2kf1ICPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792662210;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mubVS34Yih/7pcsCbGlL8ljleqhhfM0CE2+IY9rARZ0=;
	b=AKnwHg5vFguhnncG5AuoSpf2HUub3wYykfOsRpJGDxjVyjUT/dOnsHCRPPX6jLfULB7x
	 JJtmsirXiKe1M/XwoovG9GL4UO6QRhb7K+Ni8ghO8q3Su6ZExwJyNjT0U6P9VPewjGwwo
	 e7UcKd2jKymg3LkMtCjVBsAq6NhaoknhElDmvdtMt/AZmMQkfje57/sJ3UJbb4oW2wvg/
	 Lyaf2d/IfFa5R95Vpds3lj86WSc8byn6MNpmT/I0YjjzqyH/iute/i4/VYPodYrdwaqoY
	 o7zOf30sHlaxlJ5zKkaBQ3VDfdfNUIn/kSTTbMPlMo1aZPQWNR+n40tO8UVesApDuSA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792662209;
	bh=mubVS34Yih/7pcsCbGlL8ljleqhhfM0CE2+IY9rARZ0=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lARtOyBT61Tf56XSl1qG7ivCs/wa4SgoY1KcxWZbPiRVBCtAfe9PNewBXrZD5ZLsc
	 kP1dyf6fA0x4YL1UN1bHKuHvARkQt5pV7VZvuwHxjxSRx/LYtRqbokXUx67lZYdfQS
	 8of03VFGZzMcgaFj22rT8vIRVjmvFTMFpv9JN9Q9bNQDcEl+599Xt+XeskWQpruyzG
	 GK4Phbs786PzenMqZKPSXOmzRQ8CDcSrGcx1Sf6nzGpC0Kyw1c28YsankJ9U4nIIm8
	 3pXvkRBf9KMsX0NVjzI8mMaGscnGQyNMUAQCMRJqX71kTcZFrW3BjRlF9IT2RyKS+/
	 zw7I0RgpB1btg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB8CD4090E;
	Thu, 22 Oct 2026 09:43:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D4B795C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 731E34090E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKDLWEBZEYXZ for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:43:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6F3444077B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792662207;
 b=HUsmhESH+xCJQjNpdF00zh5F0Qp3Lbx86/s5ZNN1IwDme+ry3RHYUYJOyyqnYpDu0FS6
 y3k888t9OWYRdyvbLcepjeA4omppt5BbBJlxcrqZ2tAQ3tEAJ+UX8jR57EULbdeQaGn7B
 1zzuB4r+iUVO1SmG1VIBXpgWWdFd8ZQ+qVGWSFr0tBP10XytascWevy5hWYthDyrRFV+k
 /+tWf+b8+hkG4xmD5kx2uhp2gPg7hp2ESLQF4RI05fVPMKxHOTcNxRkpCuQoWHTv1uFnm
 Z156DRha2H76xEX99zrxo57pYU6ozF5nBIchnYuKjW9iF6ykgb25Su6LpTqPF2+ukvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792662207;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=kp+xrvjLXTaT8PS0ede7Zz6smPNC3oEixcnWNmieMAg=;
 b=BA6XupUr0UavQ1TrIFfrNKjTmG6SXnCfPbf1Zecl270NSrrht0VufbcxzrpH5IfgzlF+
 4/Bizfz622Cn/6fPtNrLTjeo1xL4bDeGh05LgDpgA0t7ChJwTyUkkjErKAyEhyBeQJgoS
 lpd9shqBUhUUURJXgAfRZ8obzQ5DR3GD8TJERwk38w+AQKj5NLGjhazMaS8pUhbIjmbQO
 GoO5//BErgSIafryrIlaZeI+0nnR4qRQjKpJBtWkRfmKikXXt+w/CV7pJ4GxHni6Hsu26
 lvNN0cIj+TKtxl0U3MHY/YXzU1IwGeg4VL9kKd3esQE1JKRMsk39//jfeaaq691z98g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=tkos.co.il;
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=EoWqjfZI; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F3444077B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:43:26 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id DAABF440609;
 Thu, 22 Oct 2026 12:41:59 +0300 (IDT)
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Arnout Vandecappelle <arnout@rnout.be>,
 Mark Corbin <mark@dibsco.co.uk>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <562ad192-b09a-4470-a02e-e3b0d5b2af00@rnout.be> (Arnout
 Vandecappelle via buildroot's message of "Thu, 22 Oct 2026 11:36:17
 +0200")
References: <20261020202639.1094960-1-ju.o@free.fr>
 <20261020202639.1094960-4-ju.o@free.fr>
 <562ad192-b09a-4470-a02e-e3b0d5b2af00@rnout.be>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Thu, 22 Oct 2026 12:43:23 +0300
Message-ID: <87zew6t6is.fsf@tarshish>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] arch/Config.in: change default target
 architecture to AArch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_PERMERROR autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Arnout,

On Thu, Oct 22 2026, Arnout Vandecappelle via buildroot wrote:
> On 20/10/2026 22:26, Julien Olivain via buildroot wrote:
>> This commit switches the default target architecture in arch/Config.in
>> from i686 to AArch64. AArch64 is now one of the most common
>> architecture on embedded Linux systems. The default CPU for this
>> architecture remains the Cortex-A53 (Armv8.0).
>> While at it, this commit also refreshes the .defconfig to:
>
>  Do we even need this .defconfig file? Isn't that a leftover from very, very,
>  very old Kconfig?

.defconfig seems to be Buildroot specific:

support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch:
Index: kconfig/confdata.c
===================================================================
--- kconfig.orig/confdata.c
+++ kconfig/confdata.c
@@ -30,7 +30,7 @@ static void conf_message(const char *fmt
 static const char *conf_filename;
 static int conf_lineno, conf_warnings;
 
-const char conf_defname[] = "arch/$ARCH/defconfig";
+const char conf_defname[] = ".defconfig";
 
 static void conf_warning(const char *fmt, ...)
 {

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
