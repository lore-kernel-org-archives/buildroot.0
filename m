Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99146CF34C3
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 21:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 395A840983;
	Thu,  3 Oct 2024 21:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOmpTsKtiJUb; Thu,  3 Oct 2024 21:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4B5640BD2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4B5640BD2;
	Thu,  3 Oct 2024 21:05:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B6C11BF34E
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 21:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48E4660627
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 21:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yc4u1HkP8qXW for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 21:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A9596060D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A9596060D
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A9596060D
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 21:05:28 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 93408240F0C;
 Thu,  3 Oct 2024 23:05:26 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id 6BF14240A25;
 Thu,  3 Oct 2024 23:05:26 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id B413D240A21;
 Thu,  3 Oct 2024 23:05:25 +0200 (CEST)
Message-ID: <b6f8a2cd-b2e6-4075-9e41-ef4344a40681@mail.de>
Date: Thu, 3 Oct 2024 23:05:22 +0200
MIME-Version: 1.0
To: Niklas Cassel <niklas.cassel@wdc.com>, buildroot@buildroot.org
References: <20241003204515.403551-1-niklas.cassel@wdc.com>
 <20241003204515.403551-3-niklas.cassel@wdc.com>
Content-Language: en-US
In-Reply-To: <20241003204515.403551-3-niklas.cassel@wdc.com>
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2110
X-purgate-ID: 154282::1727989526-06CCF779-2804A18D/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1727989526;
 bh=DY8W+eoYaspZTRpkwqiLqL1rERNGW/AULCwQ1MWMnKU=;
 h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
 b=lnrzrODM4UucU/Q+TwTfVtfShbAB31qN1kX4VeoR8AIMUN83ai2VVXtDSWan8hNod
 DrvinHXgnZIiXqK59BWVvDtoo8oqHaiaPC/ZriCQXuDu68XIrVr31qMTKzy/p1uY77
 OwxN1jCo84qOuSDmMQw2mdkIXs1kUS09HXQvo5qTYmHQ6LDtF4mVXu9S4Z+ItsNDr6
 T2N2DPbPmvDTCidBwd0mDGa/Ua7tSKAfi3/t5C2LvUthX1OJe+0ltprZadNsqsZNHq
 QSlPt6JIN9khlBP8hGprMghXEofsFY3035TF4v1FT9fwFx+gcIldHuceOaEtqfc+8L
 iJ+baQzQFaSBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=lnrzrODM
Subject: Re: [Buildroot] [PATCH v2 2/4] configs/rock5b: update to uboot
 2024.07
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
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas,

thanks for your patch!

On 10/3/24 22:45, Niklas Cassel via buildroot wrote:
> From: Niklas Cassel <cassel@kernel.org>
> 
> Newer uboot versions contain commit ebb0ad4eef0a ("arch: arm:
> mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588"),
> which enables BOOTSTD_FULL for RK3588, making it easier to figure
> out issues with the bootflow, if any.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>   board/radxa/rock5b/patches/uboot/uboot.hash | 2 +-
>   configs/rock5b_defconfig                    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
> index bc999536af..fe9b4f53dc 100644
> --- a/board/radxa/rock5b/patches/uboot/uboot.hash
> +++ b/board/radxa/rock5b/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
> +sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index c0c6877d81..bdf3c5a27f 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -30,7 +30,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y

I also successfully used uboot 2024.07 on the board to boot the mainline 
ATF (which now also features the RK3588) instead of the rockchip-rkbin 
binary blob:

https://lists.buildroot.org/pipermail/buildroot/2024-September/764512.html

So at least for uboot 2024.07 in combination with the mainline ATF:

Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
