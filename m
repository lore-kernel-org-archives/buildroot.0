Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D06CDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 15:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAB1970A98;
	Sun, 22 Oct 2023 15:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAB1970A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmvDjyZRQO7N; Sun, 22 Oct 2023 15:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14F5861334;
	Sun, 22 Oct 2023 15:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F5861334
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AAF871BF3BA
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 15:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E6B4417BE
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 15:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E6B4417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8t_NOE7mRtq for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 15:23:35 +0000 (UTC)
X-Greylist: delayed 493 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 22 Oct 2023 15:23:34 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BACDF415B8
Received: from libero.it (smtp-18-i2.italiaonline.it [213.209.12.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BACDF415B8
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 15:23:34 +0000 (UTC)
Received: from oxapps-36-168.iol.local ([10.101.8.214])
 by smtp-18.iol.local with ESMTPA
 id uaAgqXfD9Be2fuaAgqj25b; Sun, 22 Oct 2023 17:15:18 +0200
x-libjamoibt: 1601
X-CNFS-Analysis: v=2.4 cv=HJQFVKhv c=1 sm=1 tr=0 ts=65353c86 cx=a_exe
 a=3iLpBvWwvOdkg4efS1Ji/Q==:117 a=uckyPvglDg8A:10 a=IkcTkHD0fZMA:10
 a=CCpqsmhAAAAA:8 a=p0WdMEafAAAA:8 a=YRHvXXt1AAAA:8 a=pGLkceISAAAA:8
 a=TOnI7kW_7jZUqDRwTi0A:9 a=QEXdDO2ut3YA:10 a=nI7p5afTnwjWe6sj9iwW:22
 a=ul9cdbp4aOFLsgKbc677:22 a=9bw_jnHfPby8klRCszyn:22
Date: Sun, 22 Oct 2023 17:15:18 +0200 (CEST)
To: Arnout Vandecappelle <arnout@mind.be>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Message-ID: <240518488.423344.1697987718451@mail1.libero.it>
In-Reply-To: <35a394cd-799f-9a00-68b1-2e2b6e14bdcc@mind.be>
References: <20230817230844.450092-1-romain.naour@gmail.com>
 <20230817230844.450092-4-romain.naour@gmail.com>
 <35a394cd-799f-9a00-68b1-2e2b6e14bdcc@mind.be>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev50
X-Originating-IP: 79.45.223.184
X-Originating-Client: open-xchange-appsuite
x-libjamsun: EMqZHOs6wPOsTOztZty/qDDP5BbLAhfx
x-libjamv: XRe8dG10DP0=
X-CMAE-Envelope: MS4xfBUemWLHSadFz+VI3eHYAV3Mv9oDXKEP+Cn3+8HHvQLuL/Lg2LdfW270iZZ/iXLFkl+hw5bqCKGcUXZXvjdarqBKXGSnpgOTBlw4A94GlnoajW7haUuL
 nAwm+eGT3DRpZLEr9BoIcivg6jBhEexmXWrfiUE8H6qnx7SfvIF8XhvRMZBjNmZrOonslh/TVN5T5ctqEYi7/e3YMc1ViQsnv1lNXQFwF/qVNDMIJ40u4fRE
 xKd2s8xxs6ffXpCSNkn7WRoCCb8n679xRmKe3RSO2nPWGtUukLvWFb+XsWHok7xvJhRhD2MTi199pQeymwHt3A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=libero.it; s=s2021; 
 t=1697987718; bh=vmhCLVCVNuwHY2sc2Ni4QX0renmEaC1LNUQMWR7aX54=;
 h=From;
 b=tUeMcAgjXhiJWXSpu5lrtC/ixYdxEEoSuqdQfnFmT9fIdmFygTDObvGJx89jZE0MM
 5l+4avIWpIji3nW8McK7SKzAYmtT9VY5McwVmkCDNVj5GCspNgFqfrI5P6oBLAQim1
 CSR2Q3OT0n9xMvzuMfvsQTNRMP2kDeR/yQ96Nm/VS0qXIqcG/yBELjIeameDmLkLOh
 S6oYN9Sv5A7gxl4KU7j6I0EtEpJSEB+ptu8oD6mXNYnWVd5e9KLsUCzkupuQVZpwRd
 LzYX0EftdDdMVJR0NSHmOd7KCvzyvTprroYd4CeW4uqKgCmax3f0vUoGgki7Bcz5iF
 z18+eWIicKLuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=libero.it header.i=@libero.it
 header.a=rsa-sha256 header.s=s2021 header.b=tUeMcAgj
Subject: Re: [Buildroot] [PATCH 4/4] configs/avenger96_defconfig: bump ATF
 version to 2.9 for binutils 2.39+ support
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: dariobin@libero.it
Cc: Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All

> Il 20/10/2023 12:07 CEST Arnout Vandecappelle <arnout@mind.be> ha scritto:
> 
>  
> Hi Romain,
> 
> On 18/08/2023 01:08, Romain Naour wrote:
> > This new binutils version break the ATF build due to new linker warnings:
> > 
> >   ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> > 
> >  From [1]
> > "Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> >   of a new warning when linking the bl*.elf in the form:
> > 
> >   ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> >   ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> >   ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> >   ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> > 
> > These new warnings are enbaled by default to secure elf binaries:
> >    - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> >    - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> > "
> > 
> > Bump the ATF custom version to 2.9 for binutils 2.39+ support.
> 
>   Did you test this on the board? I now have an avenger96 board (*) thanks to 
> Embedded Recipes, and I did a quick test of this defconfig and it gives an error 
> in TF-A...
> 
>   Dario, Peter, I believe both of you also had an avenger96 board, did you test 
> it recently?
> 

I don't have an avenger96 board. But ASAP, I will run some tests on the BSH SMM S2 board.

Regards,
Dario
 
> 
>   Regards,
>   Arnout
> 
> (*) Actually I no longer have it, I gave it to my colleague Marleen (in Cc)
> 
> > 
> > Fixes:
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436283
> > 
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > ---
> >   configs/avenger96_defconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
> > index 1f8e7a50d1..adfd7585c4 100644
> > --- a/configs/avenger96_defconfig
> > +++ b/configs/avenger96_defconfig
> > @@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> >   # BR2_TARGET_ROOTFS_TAR is not set
> >   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> >   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
> >   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
> >   BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb"
> >   BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
