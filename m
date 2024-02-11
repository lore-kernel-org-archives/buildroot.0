Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77918C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 12:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0458081336;
	Sun, 11 Feb 2024 12:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i9usfXivR3Ac; Sun, 11 Feb 2024 12:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FBBE81D9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FBBE81D9F;
	Sun, 11 Feb 2024 12:25:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4F021BF33A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 12:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 855D881D9F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 12:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a4iQq-3M20pf for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 12:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A49C881336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A49C881336
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A49C881336
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 12:25:00 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id E9D3D240CDD;
 Sun, 11 Feb 2024 13:24:58 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id CBB52A03C3;
 Sun, 11 Feb 2024 13:24:58 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 54FE5240A5A;
 Sun, 11 Feb 2024 13:24:58 +0100 (CET)
To: kilian.zinnecker@mail.de, buildroot@buildroot.org
Date: Sun, 11 Feb 2024 13:24:57 +0100
Message-ID: <2172310.irdbgypaU6@laptop>
In-Reply-To: <8f6baf1d-3caa-4b47-aad9-a34fa0761058@benettiengineering.com>
References: <20231204231212.36450-1-kilian.zinnecker@mail.de>
 <20231204231212.36450-3-kilian.zinnecker@mail.de>
 <8f6baf1d-3caa-4b47-aad9-a34fa0761058@benettiengineering.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2946
X-purgate-ID: 154282::1707654298-D9D2D878-739A8257/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707654298;
 bh=TSw3OzdHuYxIVKYg/Pl/tjP98XuwRX5Yv37G/VUkJm4=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=FmaTpeLHZ6ftlKTBlkzwOZfTrOZP7C3LS5ZxvympyT3AiRVvcDyh7+RI6H3D/Was8
 Fux7zOYtAR7DiCdcLMuFkC3svU3frp7e+ibG58GERzzv7xuwZT4dXV/FLWdLAj4/dX
 bo2J/w4WzqmoTicaZMltBYUbc4JCEJjiLJgCogw6UM9nt/69QE5Js8uGP/fHRqKqEG
 a0v0C5pe/G242Bqcl7vX8AWal5M7Nu6k5g7xkZgVbRA4kfZloyER6P4WIP/DPMvDCP
 WPtu94eVHCK8pt4J4wLzoSyVNuZ2+NdoBXuum4JUSkuyBgYF4xGC7TgqaVBOxRcbLa
 qiarwfylAaXTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=FmaTpeLH
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/beaglev_ahead: new defconfig
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio, all,

> > This patch adds board support for the BeagleV-Ahead. It uses a
> > custom kernel for the board's SoC. As the SoC has an outdated and
> > currently not supported version of the RISC-V vector extension, the
> > vector extension is disabled.
> 
> can you please provide an URL to the product page?

Yes, I added an URL into the commit message of v3.

[--SNIP--]
> > --- /dev/null
> > +++ b/board/beaglev-ahead/post-image.sh
> > @@ -0,0 +1,6 @@
> > +#!/usr/bin/env bash
> > +set -e
> > +
> > +cp -r ${BUILD_DIR}/linux-custom/arch/riscv/boot/dts/thead/overlays/
> > ${BINARIES_DIR}
> linux-custom should substituted with $(LINUX_DIR)

I tried $(LINUX_DIR) and ${LINUX_DIR}, but both resulted in an empty string 
and as a consequence in a wrong path and broke the build. So in my v3 I kept 
it as it is for now. Should I try something else?

> > --- /dev/null
> > +++ b/configs/beaglev_ahead_defconfig
> > @@ -0,0 +1,44 @@
> > +BR2_riscv=y
> > +BR2_riscv_custom=y
> > +BR2_RISCV_ISA_CUSTOM_RVM=y
> > +BR2_RISCV_ISA_CUSTOM_RVA=y
> > +BR2_RISCV_ISA_CUSTOM_RVF=y
> > +BR2_RISCV_ISA_CUSTOM_RVD=y
> > +BR2_RISCV_ISA_CUSTOM_RVC=y
> 
> With commit cbd91e89e43d600172c62fd1cbd33aa74d0a851a all "_CUSTOM" have
> been dropped, so can you please replace all the:
> BR2_RISCV_ISA_CUSTOM_*
> occurences with:
> BR2_RISCV_ISA_*
> ?

I fixed it, thanks.

> > +BR2_GCC_VERSION_13_X=y
> 
> I think there is a reason you force using gcc 13, can you describe it in
> the commit log and here?

Yes, there were problems. I am not 100% sure, but as I remember it: the 
OpenSBI used has an old version and in its build, it does not define certain 
flags, which are needed by GCC 12 to activate the needed zifencei and zicsr 
extension. Those extension where redefined to be in some other extension pack 
of RiscV (or something like that, I don't remeber this exactly). Anyway it 
threw an error in GCC 12, and I thinkt to fix that, one would have to touch the 
old OpenSBI version. Switching to GCC 13 (where it works out of the box) seems 
then to be cleaner for me.

[--SNIP--]
> > +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beaglev-ahead/uboot.fragmen
> > t" +BR2_TARGET_UBOOT_FORMAT_BIN=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-with-spl.bin"
> 
> Here you need to add:
> BR2_PACKAGE_HOST_DOSFSTOOLS=y
> otherwise it fails to build under buildroot/utils/docker-run

Added dosfstools to the defconfig, thanks!

> > +BR2_PACKAGE_HOST_MTOOLS=y
> > +BR2_PACKAGE_HOST_GENIMAGE=y
> > +BR2_PACKAGE_XUANTIE_BINS=y
> 
> After enabling BR2_RISCV_ISA_ options it builds successfully using
> buildroot/utils/docker-run

I build the image with buildroot/utils/docker-run and it boots. Thanks for the 
hint, I will use buildroot/utils/docker-run in the future as well!

Thanks for your review and best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
