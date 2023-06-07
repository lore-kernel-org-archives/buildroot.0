Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A99EC77B7A
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 19:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A97B60C0B;
	Wed,  7 Jun 2023 19:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A97B60C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e58IZYZcdVUD; Wed,  7 Jun 2023 19:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1BAB60B19;
	Wed,  7 Jun 2023 19:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1BAB60B19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14F761BF3C8
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 19:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2A22405AE
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 19:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2A22405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZwlarm2w0_G for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 19:30:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF9D940517
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF9D940517
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 19:30:16 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.99.62])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6yrFqnbfFTjpr6yrFq9cNJ; Wed, 07 Jun 2023 21:30:13 +0200
Message-ID: <dd7810ad-cc9f-aec5-0554-84716766c0b1@benettiengineering.com>
Date: Wed, 7 Jun 2023 21:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US, it
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <12221308.O9o76ZdvQC@kilian-aisec>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <12221308.O9o76ZdvQC@kilian-aisec>
X-CMAE-Envelope: MS4xfI9P5WI7z4gwrB+noUSeIZljJVzAKbHecHsmdGwx4tY/U+oldCwOtkMow+iz8gmjz1QgIn4msC9JIEaIMqnto5riplTul3FBof2aJ2uz3f6RzUgVFTiQ
 yO/zgFEzBmfNiQ3VSoryrQQhDeYVJKtFEUmXX7GxuI/7lOWJnB6EQBiz1raseT0XL56L2riVejViSfskbSq8vpuEmEBZ9frWUZ4XeGQ1nkbO26ojQgMDwjGo
 7xPrx/psYj+8kQlHZ//TIA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686166213; bh=9OJKbBEis45q+++koItBU3dSc+JU21+Mzyi/Bjh2XJI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Xac3ZjE02l9LTYaKNipOISdICY2Qxxn0ZCORuhRmKXZcvJZ+yF9t4UOIzQX737FC+
 HCdrZNmcMIA1E21tHTYIP0ajMV6Ds/6Hvd4HUO2HT++6ftcqW9VPoKHxnkYNcbiqI5
 PKm93mV1YODiw5P2pcm/Ney5stU3ZQZByZxkZFAWLnYwbDW4WYxsHRqsH616b1C8pF
 dRra7BBUzWgwlgjgL4BdVz8tCbO1IxZ2KO/KsE+pTVtB25D6q+uwHSA8kXKf+EahJp
 LLCggYEGmwqZLEhQfvoLRyWzjOGQJIV9oTM8h2w/zCAV5WbSfcIn1PM0MjeT7SgN29
 zQO3Mz4RCTCiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Xac3ZjE0
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

On 07/06/23 20:59, Kilian Zinnecker wrote:
> Hello,
> 
> this is my first email on this mailing list (and almost the first on an
> opensource mailinglist in general), so please forgive me and notify me about
> any mistake I make ;)
> 
> I would love to use buildroot to create images for the Radxa Rock 5b. However,
> I am not much experienced and have a few questions about it:
> 
> There exists a project on github from a user called flatmax, which provides
> files to support building bootable images with buildroot for different boards
> with Rockchip SoCs. Using this project, I was able to create a bootable image
> for the Rock 5b.
> 
> However, I would rather like to see buildroot natively supporting the Rock 5b,
> if possible.

that would be good

>  From what I see, the project from flatmax uses a special Linux kernel and
> u-boot, both provided by Radxa. In addition it also seems to need precompiled
> ATF binaries, provided by Rockchip. According to a blogpost on the Radxa
> forum, Rockchip does not provide the ATF sources for the particular SoC, but
> only compiled ATF binaries.

It's ok to use pre-built ATF if there are no open source solutions.
Official ATF doesn't provide source for RK3588:
https://github.com/ARM-software/arm-trusted-firmware/tree/master/plat/rockchip
but the prebuilt binary is here:
https://github.com/rockchip-linux/rkbin/tree/master/bin/rk35

It happens the same with GPU blobs or other closed-source blobs, so it's
not a problem.

> Hence, my first question is: Is it in general ok to provide a board support
> (i.e., a defconfig) to buildroot, which then uses such alternative sources
> (e.g., Radxa kernel, Radxa u-boot, Rockchip ATF binaries)?

Yes, even if possibly you should use mainline U-Boot, Linux, ATF.
In this case ATF is only provided as blob and maybe some driver has not
been mainlined for RK3588 on U-Boot or Linux.
You can take for example a look at i.MX family defconfigs.
Freescale(NXP) maintained Linux and U-Boot:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/freescale_imx6ullevk_defconfig
while mainlined defconfig is this:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/imx6ullevk_defconfig

> I also saw that someone from Collabora currently works on u-boot networking
> support for the Rock 5b. I am particular interested in that, as I would love
> to be able to setup a tftpboot. I was already successful in using the u-boot
> version from Collabora to boot the kernel image and rootfs from the flatmax
> buildroot via tftp and nfs. However, I built the Collabora u-boot seperately,
> i.e., not as part of buildroot.

If Collabora's U-Boot supports some feature not supported by Rockchip's 
one or Mainline U-Boot it could make sense.

> Hence my second question is, are there people interested in (or maybe even
> currently working on) buildroot support for the Rock 5b and could help me?

I think that ML and IRC can be the 2 place to find help to add support
for that board.

> I saw that > the defconfigs of other boards with Rockchip SoCs were dropped in the
> past due to lack of maintenance.

Sometimes it happens

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
