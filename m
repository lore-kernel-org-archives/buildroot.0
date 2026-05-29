Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16647CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA96183A63;
	Fri, 29 May 2026 18:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzM-8BnMd0s5; Fri, 29 May 2026 18:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0964E83A52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780080927;
	bh=WpJeLeZ666GKy704meaZEZ4eDvYQD1jxjCJRrG71ygk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bH1YH0IQ6ssw6JJPt7Syy6WemSM6GJbr7dMD511bjWE6x02xzq+f0GP7+oMPVV6I1
	 lQx1OUqqFF09pYiEbUxy//GmxcLtrf7+IT/FyGKL32jPvYPcHNQ14J+Vkh+KvgoMgy
	 oWXyRQj8LkZX1qb1497Xo18Y7ISwQX91PCm/UVHICZzWVPhxB6SooHf+Nk2xunOJW9
	 pU/Hh06vp+Ynzq8wXo+aGHmsQFF0AGBc/9KEgnDrl7g5AyE2nhmnhg0Gd/p8hj2S/W
	 oTe2MuxdU35rI/BURcgevDbTc/U/zJHyhTTPUtwjl4yG7RVqj9eO8/I4R2XPCdoMbh
	 Ltni3NhGRh2Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0964E83A52;
	Fri, 29 May 2026 18:55:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FD47288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EB8561673
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsVaJkni3b7X for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:55:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7656461505
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7656461505
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7656461505
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:55:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5FCA04E42D90;
 Fri, 29 May 2026 18:55:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2B57E601FA;
 Fri, 29 May 2026 18:55:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0174A10888650; 
 Fri, 29 May 2026 20:55:18 +0200 (CEST)
Date: Fri, 29 May 2026 20:55:18 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
Message-ID: <ahng4UQ0UZvTh7TU@windsurf>
References: <20260505213606.3873472-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260505213606.3873472-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780080920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=AGFUjR0rN7YuEdIi/7z3YWoyLog4XVeMHEkVIH/9bUw=;
 b=fdLvt2jBW7O3spKaTDCQwtsoT7oTnZ5FSgtW2TR2IyaM6eFRJKgpVGyd0yVOygUhj++UZr
 x6UrvVXuMG83Q5ywHeU3K4UtIzC4MiDL43o9cyDRQAZBh3IcvXQGwjYRHtWji5Hi2if5uo
 fMkFpGrSFrbMsIZdQIu9RnMvxEwjkRENxY82f/fUpP51AVr3ZYyGF5ZGlgIWTdIHaCIGqW
 Nw8RM/+pr2YAF2qkdKJECbt4AjTaKb35K/hJv2hePIXDEpdlApUdOB3R8q5vO2JuVxjfvY
 geYsCKE42BQTKQtn7pQy1VhM9m+FptCecLIsjUQXhqq4YCHPEi3P33NXePC1lQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fdLvt2jB
Subject: Re: [Buildroot] [PATCH 1/2] board/pc/linux.config: enable
 CONFIG_EFI_STUB
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, May 05, 2026 at 11:36:04PM +0200, Julien Olivain via buildroot wrote:
> When the Linux Kernel image does not include the EFI stub [1],
> Grub2 EFI linux loader fallback to the legacy i386 loading.
> See [2] [3]. Grub 2.14 enabled the NX compatible for the EFI
> image in [4].
> 
> When booting a Linux Kernel without the EFI stub with Grub 2.14 with
> NX flag, the boot fails before starting the kernel with a EDK2 page
> fault error [5]:
> 
> !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
> ExceptionData - 0000000000000003  I:0 R:0 U:0 W:1 P:1 PK:0 SS:0 SGX:0
> 
> This commit adds CONFIG_EFI_STUB to board/pc/linux.config to make sure
> grub will load the Kernel using its efi loading code.
> 
> This commit is needed with EDK2 with NX protection enabled and
> Grub 2.14 also enabling NX.
> 
> [1] https://docs.kernel.org/admin-guide/efi-stub.html
> [2] https://gitlab.freedesktop.org/gnu-grub/grub/-/blob/grub-2.14/grub-core/loader/efi/linux.c#L532
> [3] https://gitlab.freedesktop.org/gnu-grub/grub/-/blob/grub-2.14/grub-core/loader/i386/linux.c#L675
> [4] https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/f5bb766e688b1180e0ace3417d4947a934957a31
> [5] https://github.com/tianocore/edk2/blob/edk2-stable202602/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ArchExceptionHandler.c#L273
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks a lot, series applied to next. Glad to see all those Grub
patches go! Hopefully the Grub maintainers will now provide more
regular releases fixing security vulnerabilities.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
