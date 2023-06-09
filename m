Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F266C7EE29
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 20:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62E0060B74;
	Fri,  9 Jun 2023 20:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62E0060B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ubhu1pVH_HNg; Fri,  9 Jun 2023 20:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 590BB60B0B;
	Fri,  9 Jun 2023 20:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 590BB60B0B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4951BF375
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 20:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB25960B0B
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 20:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB25960B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbtV56HAg-WF for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 20:57:49 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D541960AFE
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D541960AFE
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 20:57:48 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.99.62])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7j4DqySU8JCal7j4Dq76uM; Fri, 09 Jun 2023 22:50:41 +0200
Message-ID: <67b3c17a-25b9-1d6f-ee15-86340819c4a9@benettiengineering.com>
Date: Fri, 9 Jun 2023 22:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <12221308.O9o76ZdvQC@kilian-aisec>
 <4834301.31r3eYUQgx@kilian-aisec>
 <80f02657-9cfa-f12c-e5ed-4c1e55e0f280@benettiengineering.com>
 <5942184.lOV4Wx5bFT@kilian-aisec>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <5942184.lOV4Wx5bFT@kilian-aisec>
X-CMAE-Envelope: MS4xfJJ3c4cYFhd8frdmBFlPiEANIbmpZFSXZSfTF8ejkqPT58uMt8cIZBRasV7NYaFZnHK+i7mVOZ2Ge6XVaMrPiJlcAtKnH1oZ+BU/A4RLYzoOD0YFP7Rl
 PfGA/SCHdOUS7hCQDVZbhopwyQXvsZkJF+wqXG8zJHzzZIBMGAPk1IACVNI5qsHD7e7dJOdkMfI8kz2aaL+eSZZRvQ7fMo8Oc88eN4ZcUIe1yWdnXVee8KSA
 W03Pvo/2BmMMkhsPS7ifgw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686343841; bh=qjUYdhDTPBfZt1EwH3yUAKCD5GXor7oONC2jE5r+uHg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=fbzaxP6vvWWTu1RuYPcnEI4Uo+Wzmgi5YPnqnJiPp/jtWeBfhzXETXw9bJk5fS3AG
 eqr7XCbpM/ZGRFYNBmi2Xd5XeUunmS+wnNRHaloNAyQ1Vc5F3bOh1J59UU3ghfipc0
 FmGStOzyXLIqN6kVq271fdPBo/hU1D1Aw5RWAhssLKcPuwADnCe8qYaSR4/C3C55M+
 yyZfgehazp9Ohc3aiUzWuaOwrX12zapCd1ax78nl1u5GICc9uEsjnkdgF6m6T0msoZ
 pSh8ZkkjqDNi59F1UtObrOgwC2O2Y4uyMqVgbn2izNi2MUGg2iMPtz2zi2o88GIgge
 snQVlSJL21ivg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=fbzaxP6v
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

On 09/06/23 08:35, Kilian Zinnecker wrote:
> Hi Giulio
> 
> thanks again for your very helpful answer!
> 
>> To begin is ok, but I see U-Boot supports this board, this is the defconfig:
>> https://source.denx.de/u-boot/u-boot/-/blob/master/configs/rock5b-rk3588_defconfig
>> that uses this dts file:
>> https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/rk3588-rock-5b.dts
>>
>> So I would go with mainline uboot.
> 
> Yes, absolutely correct, and the changes to support the Rock 5b's ethernet in
> U-Boot are also mainline already:
> 
> https://source.denx.de/u-boot/u-boot/-/commit/
> bcbb64b1990cc1f3f8137c05fbc49b13fcb320ff
> 
> Thank you, I actually did not realize this and used Collabora's gitlab
> repository. I just compiled the mainline U-Boot and tested the tftpboot and it
> works just fine!

very well

> 
>> For example there are already boards with RK3399 that is similar to
>> R3588. Take a look here at this defconfig:
>> https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/
> rockpro64_defconfig
> 
> As far as I see the rk3399 is actually a different case: For this particular
> SoC the ATF is released as source and part of the ATF repository, see here:
> 
> https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/plat/
> rockchip.rst?plain=1#L12
> 
> This is different for the rk3588, which is the SoC on the Rock 5b: For the
> rk3588 Rockchip did not release the ATF source code,

you're right

> hence one needs to use 2
> ATF blobs for U-Boot, see also the U-Boot documentation about this:
> 
> https://source.denx.de/u-boot/u-boot/-/blob/master/doc/board/rockchip/
> rockchip.rst?plain=1#L199-200
> 
> Both blobs are provided by the Rockchip, see here:
> 
> https://github.com/rockchip-linux/rkbin/tree/master/bin/rk35
> 
> So currently it seems mandatory to me to setup Buildroot in some way, that
> these two blobs are obtained from the rkbin repo and provided to U-Boot during
> build.

totally

>> If you refer to BL31 or something similar that should already be an
>> infrastructure in Buildroot for it. I suggest you to take a look at
>> other similar boards in buildroot/configs and filter what you need and
>> give a try.
> 
> As you suggested, I looked for Buildroot infrastructure to support such
> requirements and came across the following two patches on the ML, adding some
> similar support for IMX SoCs in the past:
> 
> https://lists.buildroot.org/pipermail/buildroot/2021-September/622642.html
> https://lists.buildroot.org/pipermail/buildroot/2021-September/622643.html
> 
> In recent Buildroot the support seems to be implemented as option
> BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE here:
> 
> https://github.com/buildroot/buildroot/blob/master/boot/uboot/uboot.mk#L194-L208

yes

> The option is currently used in four defconfigs:
> 
> * imx8mn_bsh_smm_s2_defconfig
> * imx8mn_bsh_smm_s2_pro_defconfig
> * kontron_bl_imx8mm_defconfig
> * kontron_pitx_imx8m_defconfig
> 
> However, the defconfigs don't set any option for some specific remote git
> repository, from which the binaries can be obtained. Instead "firmware-imx" is
> added to UBOOT_DEPENDENCIES in the uboot.mk. As I understand it, this
> corresponds to the package "package/freescale-imx/firmware-imx".

exactly, "firmware-imx" is defined in package/freescale-imx/Config.in

> So from my understanding, in order to set up the U-Boot build for the Rock 5b
> in buildroot, I would have to do the following steps:
> 
> * Add a package "package/rockchip/firmware-rk" which fetches the rkbin
>    repository properly, similar to "package/freescale-imx/firmware-imx"
> 
> * Implement the following targets in the uboot.mk similar to the IMX ones:
>      BR2_TARGET_UBOOT_NEEDS_RK_FIRMWARE
>      UBOOT_COPY_RK_FW_FILES
>      and add UBOOT_COPY_RK_FW_FILES to UBOOT_PRE_BUILD_HOOKS
> 
> * Add a Rock 5b defconfig to buildroot with the BR2...UBOOT_NEEDS_RK_FIRMWARE
>    option activated
> 
> What do you think?

It works for me, so this way you follow what's already been done for imx.

> I would really like to do this! If I get it working it
> actually would be my first opensource contribution. However, I am on a one
> week vacation from tomorrow and will not have a laptop. So everybody who reads
> this and does not urgently need Rock 5b boar support: Please be a bit patient
> and let me do it in a week! ;)

Usually board patches take long time to be committed and they don't show
up everyday in the Mailing List :-)

So I wait for you upcoming patch to review it.

By the way, as a second step you could enable GPU acceleration. 
Rockchip-mali package is already there and needs some adjustment to 
point to a specific Mali model. I see here [1] that Valhalla G610 is
supported and package mali-driver is available in Buildroot even if I
still have to fix it with Linux 6.2 :-/
Even if while writing it came to my mind that Valhalla Mali driver is
probably not compatible with Midgard/Bifrost. But that is other work
that can be done later.

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> 
>>> And even if it was present: How
>>> could I introduce a change, i.e. activate the Realtek R8169 driver?
>>
>> enable what we want using fragment files. Take a look here:
>> https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/olimex_a20_
>> olinuxino_lime2_defconfig#L29 and check the content of that .fragment file,
>> you will see that you can en/disable options you need
> 
>> That is a very useful helper that does exist for gitlab too and it's
>> defined in:
>> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/pkg-download.mk#L63
>>
>> it takes 3 argument when called and return the URL referred to Github.
>> Same goes for Gitlab.
> 
> Thank you very much for the info!
> 
> 
> Best regards,
> Kilian
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
