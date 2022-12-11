Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59718C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 008418145C;
	Sun, 11 Dec 2022 16:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 008418145C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NyI8AIhA3ZEb; Sun, 11 Dec 2022 16:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 355EC81437;
	Sun, 11 Dec 2022 16:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 355EC81437
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D04941BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4A1B81457
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4A1B81457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u0XqjK5D7G5X for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:56:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 735198141C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 735198141C
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:56:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4CE23100003;
 Sun, 11 Dec 2022 16:56:00 +0000 (UTC)
Date: Sun, 11 Dec 2022 17:55:59 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221211175559.73447189@windsurf>
In-Reply-To: <20221207122133.14860-1-neal.frager@amd.com>
References: <20221207122133.14860-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670777760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOJFUNa0AUWCTc0Ymv+E3e6S4P0Laq+jN+Ur4Nw8cTU=;
 b=cvF16tOsDD3Hm/oehj40RchcKLsn0ng36tr3+YDXFMuToJ/oDB+GBdRvSMG35ygN0ksCqN
 Z+WVqpgMk7HM3SjhaSW/xHD24MFpXEBOOjqP2AUO4BL8jVHyl5T/dm/V6y6MYH2lZC4PKK
 VRK6S9JhprK33SiR2UGUx31jpI//DFdUfAvMiAfGr6jYL3c0ubXHPToDDns7wmmpW4+Ha+
 A+QIx/OyDBAehjReBh3CiHNc32QWVhYP920p2Nf1c0FeBBuj9OFyFAJ3CMYRKAPsN1c0pb
 hu0/TdSmVX/m4KULMg152pU4HOsQKFq/2kneYPc+0/1YwAsFBqkpnnxMiQro8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cvF16tOs
Subject: Re: [Buildroot] [PATCH v1 1/2] board/zynqmp/zcu106/patches: remove
 patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Wed, 7 Dec 2022 05:21:32 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> The 0001-arm64-zynqmp-zynqmp-zcu106-revA-Fix-DP-PLL-configura.patch
> is already committed in the Xilinx 2022.2 u-boot release tag.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  ...qmp-zcu102-revA-Fix-DP-PLL-configura.patch | 40 -------------------
>  configs/zynqmp_zcu106_defconfig               |  1 -
>  2 files changed, 41 deletions(-)
>  delete mode 100644 board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch

This should have been part of the commit updating U-Boot. If you didn't
notice then, then this commit should have been very different: (1) it
should clearly indicate that it fixes a bug and (2) it should point to
the commit it is fixing. I've committed with the following commit log:

    board/zynqmp/zcu106/patches: fix build by dropping U-Boot patch
    
    Since commit
    3c997c457a4ee33d81e6b93e4f6f147bb9e861e9 ("configs/zynqmp_zcu106_defconfig:
    bump to Xilinx 2022.2"), we're using U-Boot version Xilinx 2022.2,
    which already carries the psu_init_gpl.c, causing the build to fail as
    our patch doesn't apply.
    
    Fix this by dropping the no longer needed patch.
    
    Fixes: 3c997c457a4ee33d81e6b93e4f6f147bb9e861e9 ("configs/zynqmp_zcu106_defconfig: bump to Xilinx 2022.2")
    Signed-off-by: Neal Frager <neal.frager@amd.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
