Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB8FEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 07:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C88AD83C8B;
	Fri, 14 Jul 2023 07:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C88AD83C8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LsBl_w3Ajumw; Fri, 14 Jul 2023 07:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF46C83FEE;
	Fri, 14 Jul 2023 07:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF46C83FEE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7852B1BF36A
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 07:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5079B41730
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 07:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5079B41730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8VROFoFmEWa for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 07:34:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5181417AB
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5181417AB
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 07:34:04 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 18C28A2D6F;
 Fri, 14 Jul 2023 09:34:03 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id ECA9680219;
 Fri, 14 Jul 2023 09:34:02 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id 1A726A01BA;
 Fri, 14 Jul 2023 09:34:02 +0200 (CEST)
To: buildroot@buildroot.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Date: Fri, 14 Jul 2023 09:34:01 +0200
Message-ID: <5848067.MhkbZ0Pkbq@kilian-aisec>
In-Reply-To: <c3191f37-551a-0a9b-6fb0-c8662d6faac2@theobroma-systems.com>
References: <c30c93e29177a1dc15446eff427c7ca8@umbiko.net>
 <6573492.4vTCxPXJkl@kilian-aisec>
 <c3191f37-551a-0a9b-6fb0-c8662d6faac2@theobroma-systems.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 6653
X-purgate-ID: 154282::1689320042-197F8199-D9695BB3/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689320043;
 bh=Vm8v1DlRN1fw5rwRcLex3pCZrMZjQfPonxPWhufuESU=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=SI4SNlQx02atScWyq3a/bMSRq4tg8Fqx8k8vpCv5P2a1CFQAl4mPTAovotTfAw4/L
 8v3xsTIhSatutSXb9G7L72wMmezVfCHa+barZMfQgjheWuxCQKrjB9d8vNTg5l2lQA
 f/0F5nULj1W7rO+XJWRhDKwpKIaWWVUwp+IDXHAYt4bOmtvt3ex7Web1zJ/CI3DoKv
 tBuLbpsZh+hgZDY5OsfhNxtOlB/nV655q5QojZSs3qW99y/Lolf6TmxeAC7U9B7cdF
 eAf0dZkTaRCQW4NwYYPhXnQpvReNAfEHVZKvaQGmdUNG4gEBlFXxFbJFsbS9eHUEsy
 Uy0KuSzU1Om5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=SI4SNlQx
Subject: Re: [Buildroot] [PATCH v3 1/3] package: add rockchip-rkbin package
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Andreas Ziegler <br015@umbiko.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Quentin,

> U-Boot, for all RK3568 and RK3588 based boards, currently requires blobs
> from rkbin. Therefore, to build U-Boot properly, we need this package.
> Since there are publicly available boards based on RK3568, I assume we
> may eventually get support by someone (not necessarily you) for those.
> Therefore, I suggested we remove the mention to RK3588 as this is not
> specific to this SoC from Rockchip. No expectation from me on what
> you're going to do next :)

I think we agree here and as you know the rockchip-rkbin package is now able 
to also be used for other Rockchip SoCs.

> >> I would highly recommend to keep the same file extension to not confuse
> >> people since the OP-TEE binary apparently has different formats which we
> >> can (more easily) distinguish from their file extension (though IIRC,
> >> reading the header may be enough).
> > 
> > Thanks.
> 
> Just to make things a bit clearer here, I commented on bl31.bin file
> extension while saying something about OP-TEE binary, the former is TF-A
> blob while the latter is bl32.bin.
> 
> Also, I was wrong, the file extension isn't used for detecting the file
> format of OP-TEE OS blob, U-Boot tries to detect an ELF, if not, starts
> to parse the blob "header" to detect if it's v1 or v2 format.
> 
> But better keep the same file extension though :)

Yes, I agree: it is still beneficial, if the true file extension is kept, even 
if it is technically not needed. In v6 of the patches I implemented it such, 
that the file extension is kept.

> >> I can think of two ways of doing this: create a
> >> subdir after each SoC part number in BINARIES_DIR (e.g.
> >> BINARIES_DIR/rk3588/bl31.elf) or have the part number in the filename
> >> (e.g. rk3588_bl31.elf).
> >> This should allow to install the binary blobs from all SoC supported in
> >> RKBIN without having to deal with Kconfig options.
> > 
> > How so? Because we would then copy all blobs at once into the BINARIES_DIR
> > everytime?
> 
> Indeed. Then we wouldn't need to care on the rkbin side which blobs to
> install in BINARIES_DIR. Inside u-boot.mk either, as I would pass the
> proper path as part of BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS like you did here?

I actually don't like copying ALL Rockchip blobs into BINARIES_DIR everytime: 
Imagine this would become the common case for multiple packages. It would 
create a mess in my opinion. And it also is not needed: The package is now 
implemented such, that a user can optionally specify which blobs are needed 
and only those specified binaries are copied into BINARIES_DIR, with a generic 
name, while keeping the original file extension and also uboot now 
automatically identifies the binary, even so that the file extension can be 
different. What's not to like? ;)

> >> Looking at the code above, if we want to keep it a bit automagical,
> >> maybe having the RKBIN binaries called bl31.bin and tee.elf and have a
> >> Kconfig option for the RKBIN package to select which SoC binary blobs to
> >> install would be best.
> > 
> > In the readme of the rkbin repository they present their file naming
> > scheme. However, I don't think I like making use of it:
> > 
> > 1. We introduce a lot of Kconfig code for some logic that adds choices and
> > selects files within the rkbin repository. But in the end the user still
> > has to make the decision, which files are to use, anyway. Then the user
> > can also just directly specify the true filename in the board defconfig
> > or .config.
> What I had in mind was to have a select Kconfig option:
> choice
> config BR2_RK3588
> config BR2_RK3568
> enchoide
> 
> and then in rockchip-rkbin (pseudo-code):
> 
> if BR2_RK3588
>      install bin/rk35/rk3588_bl31_v1.38.elf $(BINARIES_DIR)/bl31.elf
>      install bin/rk35/rk3588_bl32_v1.13.bin $(BINARIES_DIR)/tee.elf #add
> support for tee.bin in U-Boot mk?
>      install bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin
> $(BINARIES_DIR)/ddr.bin
> elif BR2_RK3568
> ....
> fi

I don't like this: This would mean that we basically write down into the mk 
each binary for each SoC. If then rockchip decides to "update" a binary by 
simply renaming it (they have done this before, look at the git history), then 
the package is broken until some maintainer fixes it again. We would produce 
alot of code with imho no real benefit. In my oppinion: Whoever wants to use a 
blob from the repository should simply define which blob is the desired one.

> The important part would be for the destination filename to match what's
> expected in boot/u-boot/u-boot.mk:
> 
> UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
> [...]
> UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
> 
> in that scenario, we wouldn't even need to adapt U-Boot makefile other
> than allowing to depend on rockchip-rkbin rather than trusted-firmware-arm.
> 
> > 2. We add a lot dependency: Rockchip may remove or rename files in their
> > git reblobitory as they like. If we (or any other users) then want to use
> > a newer commit of their reblobitory, e.g., to use newer blobs, and the
> > file name / path scheme breaks, we have to fix that again.
> 
> This is the responsibility of the package maintainer, like for any other
> package. I do agree though that the name of the installed binaries
> should stay consistent between new versions, so that we only need to
> update rockchip-rkbin and not any other package that depends on it.

This takes unnecessary burden on the maintainer, and that is a bad thing in my 
opinion. I really think it is a huge plus, if a package is designed such, that 
it does not need much maintenance and that it is unlikely by design that it 
breaks due to external reasons (e.g., Rockchip unpredictably deciding to 
rename their blobs). After all, you never know, whether there is still a 
maintainer in the future who has time to maintain (or even wants to).

> > 
> > Thinking out loud:
> > 
> > For the rockchip-rkbin package we could feature:
> > 
> > * custom git version option (then defconfigs could freeze the repo
> > version)
> > * option to specify tpl file name
> > * option to specify bl31 file name
> > * option to specify op-tee file name
> 
> Well.. that's one thing I completely forgot about. Maybe people don't
> want to update rockchip-rkbin for their boards... SO yeah, I guess those
> 4 options actually make more sense than trying to be smart and have a
> select for each SoC.

Yes, I like this, too. I implemented it like this in v6 (and v5).

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
