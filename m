Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AABC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD45B40BCD;
	Wed, 21 Dec 2022 15:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD45B40BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5zFgl6f0oV2; Wed, 21 Dec 2022 15:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2778F40BCB;
	Wed, 21 Dec 2022 15:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2778F40BCB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDDD31BF232
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 15:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7B6440BC4
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 15:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7B6440BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLi3M1jESNZZ for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 15:53:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9300B40BA8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9300B40BA8
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 15:53:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B34351C0002;
 Wed, 21 Dec 2022 15:53:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p81Pm-0026J7-By; Wed, 21 Dec 2022 16:53:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221207122133.14860-1-neal.frager@amd.com>
 <20221211175559.73447189@windsurf>
Date: Wed, 21 Dec 2022 16:53:54 +0100
In-Reply-To: <20221211175559.73447189@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 11 Dec 2022 17:55:59 +0100")
Message-ID: <87sfh8pxbh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Neal,
 > On Wed, 7 Dec 2022 05:21:32 -0700
 > Neal Frager via buildroot <buildroot@buildroot.org> wrote:

 >> The 0001-arm64-zynqmp-zynqmp-zcu106-revA-Fix-DP-PLL-configura.patch
 >> is already committed in the Xilinx 2022.2 u-boot release tag.
 >> 
 >> Signed-off-by: Neal Frager <neal.frager@amd.com>
 >> ---
 >> ...qmp-zcu102-revA-Fix-DP-PLL-configura.patch | 40 -------------------
 >> configs/zynqmp_zcu106_defconfig               |  1 -
 >> 2 files changed, 41 deletions(-)
 >> delete mode 100644 board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch

 > This should have been part of the commit updating U-Boot. If you didn't
 > notice then, then this commit should have been very different: (1) it
 > should clearly indicate that it fixes a bug and (2) it should point to
 > the commit it is fixing. I've committed with the following commit log:

 >     board/zynqmp/zcu106/patches: fix build by dropping U-Boot patch
    
 >     Since commit
 >     3c997c457a4ee33d81e6b93e4f6f147bb9e861e9 ("configs/zynqmp_zcu106_defconfig:
 >     bump to Xilinx 2022.2"), we're using U-Boot version Xilinx 2022.2,
 >     which already carries the psu_init_gpl.c, causing the build to fail as
 >     our patch doesn't apply.
    
 >     Fix this by dropping the no longer needed patch.
    
 >     Fixes: 3c997c457a4ee33d81e6b93e4f6f147bb9e861e9 ("configs/zynqmp_zcu106_defconfig: bump to Xilinx 2022.2")
 >     Signed-off-by: Neal Frager <neal.frager@amd.com>
 >     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
