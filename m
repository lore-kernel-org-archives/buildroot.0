Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41735C7EE25
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 06:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94ABD40A9B;
	Fri,  9 Jun 2023 06:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94ABD40A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 91zrAAKlSIzD; Fri,  9 Jun 2023 06:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90C7C40A06;
	Fri,  9 Jun 2023 06:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90C7C40A06
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9941BF409
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 06:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DC2960F49
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 06:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DC2960F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3yBikY71XwN for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 06:35:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13AC960F01
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13AC960F01
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 06:35:49 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 356A3A036A;
 Fri,  9 Jun 2023 08:35:47 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 19F3B80151;
 Fri,  9 Jun 2023 08:35:47 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 7517A100129;
 Fri,  9 Jun 2023 08:35:46 +0200 (CEST)
From: Kilian Zinnecker <kilian.zinnecker@mail.de>
To: buildroot@buildroot.org
Date: Fri, 09 Jun 2023 08:35:45 +0200
Message-ID: <5942184.lOV4Wx5bFT@kilian-aisec>
In-Reply-To: <80f02657-9cfa-f12c-e5ed-4c1e55e0f280@benettiengineering.com>
References: <12221308.O9o76ZdvQC@kilian-aisec>
 <4834301.31r3eYUQgx@kilian-aisec>
 <80f02657-9cfa-f12c-e5ed-4c1e55e0f280@benettiengineering.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 4782
X-purgate-ID: 154282::1686292546-5CFFF7B6-121C652C/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1686292547;
 bh=jrmXSX1WTQ2t7hDbcZdIV/mK1wUx0DgXXu3HGBhfELA=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=fnsgvb0Hr6v1tK5SOZ4Mg6XslENwZlLYoJs1jXCtQGFH3ZcjFKvJaZbj29oPyB5ZR
 yhqdprrzhd1hHzr3IYiGyigUXM0Cp3g7amnH4BQgcvKrrqA5JF+QfbNyA7ETGUQ3p1
 nuFYXVsbPrx6f9IEccvhxTBENE4cCj+zjB99Re23KM8Xbkbl35SIf+5jQiJ9WlYV1b
 F4asOD/LDcIMqsCGB9YnQGIGnKs/HmsHklDkl3CpG1CfViDR263iIpVgIT2s+gIU4u
 m1cRDwmAsJP5dyZYFpdh0i+tx6maYhiPCIxrWlJpZ8SK1X8fhRfd8DzzZlumuBHgVB
 4gj1ZswXKMw7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=fnsgvb0H
Subject: Re: [Buildroot] Interested in board support for Radxa Rock 5b
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio

thanks again for your very helpful answer!

> To begin is ok, but I see U-Boot supports this board, this is the defconfig:
> https://source.denx.de/u-boot/u-boot/-/blob/master/configs/rock5b-rk3588_defconfig
> that uses this dts file:
> https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/rk3588-rock-5b.dts
>
> So I would go with mainline uboot.

Yes, absolutely correct, and the changes to support the Rock 5b's ethernet in
U-Boot are also mainline already:

https://source.denx.de/u-boot/u-boot/-/commit/
bcbb64b1990cc1f3f8137c05fbc49b13fcb320ff

Thank you, I actually did not realize this and used Collabora's gitlab
repository. I just compiled the mainline U-Boot and tested the tftpboot and it
works just fine!


> For example there are already boards with RK3399 that is similar to
> R3588. Take a look here at this defconfig:
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/
rockpro64_defconfig

As far as I see the rk3399 is actually a different case: For this particular
SoC the ATF is released as source and part of the ATF repository, see here:

https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/plat/
rockchip.rst?plain=1#L12

This is different for the rk3588, which is the SoC on the Rock 5b: For the
rk3588 Rockchip did not release the ATF source code, hence one needs to use 2
ATF blobs for U-Boot, see also the U-Boot documentation about this:

https://source.denx.de/u-boot/u-boot/-/blob/master/doc/board/rockchip/
rockchip.rst?plain=1#L199-200

Both blobs are provided by the Rockchip, see here:

https://github.com/rockchip-linux/rkbin/tree/master/bin/rk35

So currently it seems mandatory to me to setup Buildroot in some way, that
these two blobs are obtained from the rkbin repo and provided to U-Boot during
build.

> If you refer to BL31 or something similar that should already be an
> infrastructure in Buildroot for it. I suggest you to take a look at
> other similar boards in buildroot/configs and filter what you need and
> give a try.

As you suggested, I looked for Buildroot infrastructure to support such
requirements and came across the following two patches on the ML, adding some
similar support for IMX SoCs in the past:

https://lists.buildroot.org/pipermail/buildroot/2021-September/622642.html
https://lists.buildroot.org/pipermail/buildroot/2021-September/622643.html

In recent Buildroot the support seems to be implemented as option
BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE here:

https://github.com/buildroot/buildroot/blob/master/boot/uboot/uboot.mk#L194-L208

The option is currently used in four defconfigs:

* imx8mn_bsh_smm_s2_defconfig
* imx8mn_bsh_smm_s2_pro_defconfig
* kontron_bl_imx8mm_defconfig
* kontron_pitx_imx8m_defconfig

However, the defconfigs don't set any option for some specific remote git
repository, from which the binaries can be obtained. Instead "firmware-imx" is
added to UBOOT_DEPENDENCIES in the uboot.mk. As I understand it, this
corresponds to the package "package/freescale-imx/firmware-imx".

So from my understanding, in order to set up the U-Boot build for the Rock 5b
in buildroot, I would have to do the following steps:

* Add a package "package/rockchip/firmware-rk" which fetches the rkbin
  repository properly, similar to "package/freescale-imx/firmware-imx"

* Implement the following targets in the uboot.mk similar to the IMX ones:
    BR2_TARGET_UBOOT_NEEDS_RK_FIRMWARE
    UBOOT_COPY_RK_FW_FILES
    and add UBOOT_COPY_RK_FW_FILES to UBOOT_PRE_BUILD_HOOKS

* Add a Rock 5b defconfig to buildroot with the BR2...UBOOT_NEEDS_RK_FIRMWARE
  option activated

What do you think? I would really like to do this! If I get it working it
actually would be my first opensource contribution. However, I am on a one
week vacation from tomorrow and will not have a laptop. So everybody who reads
this and does not urgently need Rock 5b boar support: Please be a bit patient
and let me do it in a week! ;)


> > And even if it was present: How
> > could I introduce a change, i.e. activate the Realtek R8169 driver?
>
> enable what we want using fragment files. Take a look here:
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/olimex_a20_
> olinuxino_lime2_defconfig#L29 and check the content of that .fragment file,
> you will see that you can en/disable options you need

> That is a very useful helper that does exist for gitlab too and it's
> defined in:
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/pkg-download.mk#L63
>
> it takes 3 argument when called and return the URL referred to Github.
> Same goes for Gitlab.

Thank you very much for the info!


Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
