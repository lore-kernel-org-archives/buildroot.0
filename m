Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E6DC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4780D60D63;
	Mon, 22 Aug 2022 09:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4780D60D63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ASlYM8FsaqX; Mon, 22 Aug 2022 09:52:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65483605E0;
	Mon, 22 Aug 2022 09:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65483605E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C626F1BF306
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7288181761
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7288181761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNhou9S-7c7Z for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:52:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13B728175C
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13B728175C
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:52:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 53F1431E03E4; Mon, 22 Aug 2022 11:52:39 +0200 (CEST)
Date: Mon, 22 Aug 2022 11:52:39 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <YwNR5ySvpk0/Q0Lr@waldemar-brodkorb.de>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1661161960; bh=NIAVPQ6ePTe5dRPDVfyf68f0hfbeF1SYX4ZnscGxMeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p4yivIDcK1Out5/14W85E1QL6TshjUXWlJMmYV+svKuNb/fo/dKzdZuEB/dauGPV+
 JW2N3QyX5p6EN7By7bmj2CD4cofvpggVFWnzVXGdHQzW4V89fuY+I86ahNFGnbej5+
 aSooNCZesiSZOkw1h0XQJla7F+tx4PoVaToz0NL4bQhWM9NBqlcDoRpLqfdZ38RBzX
 z81HJP6dQTtLggY6CVy4OvvB7lX1dD1kWJXP8Z5+Xiw9pnMaVICGRWJ9H7GRPwSTgm
 N9B3rsXjobVJFupOFk/3AcCzGmhQ54euXVGI65GbbfMqmfq35MPPsgSEQaz4tlUaJb
 wnPvkurrxJvIA==
Subject: Re: [Buildroot] [PATCH v3 0/8] Add support for FDPIC binaries on ARM
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Ben,

on what hardware or simulator you are testing?
I like to try stm32 hardware, but the toolchain conflicts with
afboot-stm32. 
best regards
 Waldemar

Ben Wolsieffer wrote,

> Introduce support for the FDPIC binary format on ARM. FDPIC binaries
> enable memory sharing between processes on no-MMU systems.
> 
> Changes in v3:
>   * Don't change default binary format
>   * Disable FDPIC support with external toolchains
>   * Enable NPTL if FDPIC is used
>   * Patch libtool to support ARM FDPIC shared libraries
> 
> Changes in v2:
>   * Simplify special casing of FDPIC toolchain target
>   * Add additional patches to fix building Linux and U-Boot with an
>     FDPIC toolchain by passing -mno-fdpic. I have submitted fixes
>     upstream to do this automatically, but they have not yet been
>     accepted and will take a while to end up in Buildroot.
> 
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Ben Wolsieffer (8):
>   Revert "arch: drop now useless support for FDPIC"
>   arch: don't enable FDPIC binaries by default
>   arch: make FDPIC dependent on toolchain support
>   arch/arm: add support for FDPIC
>   boot/uboot: pass -mno-fdpic if FDPIC is enabled
>   linux: pass -mno-fdpic if FDPIC is enabled
>   package/uclibc: enable NPTL on no-MMU ARM w/ FDPIC
>   package/pkg-autotools: patch libtool to support ARM FDPIC
> 
>  arch/Config.in           | 15 +++++++++++++++
>  boot/uboot/uboot.mk      |  5 +++++
>  linux/linux.mk           |  8 +++++++-
>  package/Makefile.in      |  6 ++++++
>  package/pkg-autotools.mk | 17 +++++++++++++++++
>  package/uclibc/Config.in |  2 +-
>  package/uclibc/uclibc.mk |  8 ++++++++
>  toolchain/Config.in      |  4 ++++
>  8 files changed, 63 insertions(+), 2 deletions(-)
> 
> -- 
> 2.37.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
