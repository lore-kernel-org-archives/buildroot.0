Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F7BC7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 16:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77DB6150B;
	Thu,  8 Jun 2023 16:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E77DB6150B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3U_hV9_qQXcS; Thu,  8 Jun 2023 16:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06CCE61502;
	Thu,  8 Jun 2023 16:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06CCE61502
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C90FC1BF39D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 16:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF73C83AB0
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 16:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF73C83AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npUfgHNjUz0X for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 16:40:00 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D056A82190
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D056A82190
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 16:39:59 +0000 (UTC)
Received: from [172.25.4.220] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7IZ9q5mtLdeVn7IZ9q6WGT; Thu, 08 Jun 2023 18:32:51 +0200
Message-ID: <80f02657-9cfa-f12c-e5ed-4c1e55e0f280@benettiengineering.com>
Date: Thu, 8 Jun 2023 18:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US, it
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <12221308.O9o76ZdvQC@kilian-aisec>
 <dd7810ad-cc9f-aec5-0554-84716766c0b1@benettiengineering.com>
 <4834301.31r3eYUQgx@kilian-aisec>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <4834301.31r3eYUQgx@kilian-aisec>
X-CMAE-Envelope: MS4xfN0bU6dFcT/KvgvakqJvWuitZC0Wp8zKLUcUgYWRc5YqyYb3xODtBitAhU64b2DNqJjAHr7hbkOid9smsDR/iEU8GgBzyPVn3vPB5vXCZB3/ZOokgppI
 WbC/4xDwFhHlunpox5hK+EX8E9plaYK5/wZbhf+FqNmF0gkaxoIOUi7RiVfL23HhUX1vJavTAnKGcNetdb5ospvQyrZUAdk5cptIP5KwnwCui95xkkEpNoYT
 /ZSvyLRyDp6LnOpSm+hRaQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686241971; bh=e68y96CvifLEmeV+NhlwKiwfP91aLAPm0ffUlwO2wBw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=e2XWBc7vH1txzxVl0difPsp9Z91FlB8Kx9BzqKF8FI0yYvTDMrtRMlDVbvPBaXn+3
 DDnifoTr5t4fYGxOAbEuNwQbdoz7ZnQPWdfQ46QWUn9Gaah91xrpFAY6rabY4x5lJR
 IFXtqQPYhcj8F189gRp5Cg/RoNyLv9h0px9l1Bz6jTHouoCKj4BP1AyBKzGWnLPmoO
 ddoxjNlyPHGGDA2bCIl6ctPS67m0/I6hiafbMgr4tZ4gev3P1JK9lyegAUPCaDxwRw
 SwxuLqDWKVhDnC0PcHeWkGB8eHcObBSqPQA6PqgUMWYnDYtjHDkCjSaGQPiko+mwwX
 Tooirsc7K8blQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=e2XWBc7v
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

On 08/06/23 17:09, Kilian Zinnecker wrote:
> Hi Giulio,
> 
> thanks for your very helpful answer!
> 
>>
>> that would be good
>>
>   
> I would like to try to use Collabora's U-Boot (and kernel) with the Rock 5b
> support, for starters.

To begin is ok, but I see U-Boot supports this board, this is the defconfig:
https://source.denx.de/u-boot/u-boot/-/blob/master/configs/rock5b-rk3588_defconfig
that uses this dts file:
https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/rk3588-rock-5b.dts

So I would go with mainline uboot.

> And I would like to setup the defconfig such, that
> buildroot fetches the sources from Github.

Using mainline uboot is not needed but

> Afaik this can be achieved by
> properly setting the respective CUSTOM_REPO_URL and CUSTOM_REPO_VERSION of
> the kernel and U-boot.

Yes you can do it with those 2 variables

> However, Collabora's U-Boot needs two of the ATF
> binaries during compilation. How could I fulfil this requirement in the
> defconfig? 

If you refer to BL31 or something similar that should already be an
infrastructure in Buildroot for it. I suggest you to take a look at
other similar boards in buildroot/configs and filter what you need and
give a try.

> I.e., how could I instruct buildroot to fetch both binaries, when
> attempting to build U-Boot? If the binaries are present, I think I should be
> able to use the CUSTOM_MAKEOPTS setting to tell U-Boot's makefile to use the
> two binaries.

As pointed above I think there should already be everything you need,
it's only about to try to imitate what it's already been done.

For example there are already boards with RK3399 that is similar to
R3588. Take a look here at this defconfig:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/rockpro64_defconfig

> 
> Also I would like to have a change to the used kernel config: I would like to
> have ethernet driver support activated in the kernel (CONFIG_R8169=y). Radxa's
> kernel version does feature a rockchip_linux_defconfig, which is also used by
> flatmax. However, Collabora's kernel repository does not. If the kernel
> defconfig was present in the kernel repository, I should be be able to use the
> BR2_LINUX_KERNEL_DEFCONFIG setting in the buildroot board defconfig to
> instruct buildroot to use that particular kernel defconfig, right?

Exactly

> But since
> that file is not present, what could I do? 

You can customize Linux in Buildroot like this:
$ make linux-menuconfig
then save it and:
$ cd output/build/linux.x.x/
$ make savedefconfig

the resulting defconfig is the defconfig you're looking for if you want 
something specific BUT in general in Buildroot we tend to keep
architecture default defconfig and...

> And even if it was present: How
> could I introduce a change, i.e. activate the Realtek R8169 driver?

enable what we want using fragment files. Take a look here:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/olimex_a20_olinuxino_lime2_defconfig#L29
and check the content of that .fragment file, you will see that you can
en/disable options you need

>>
>> You can take for example a look at i.MX family defconfigs.
>> Freescale(NXP) maintained Linux and U-Boot:
>> https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/freescale_i
>> mx6ullevk_defconfig while mainlined defconfig is this:
>> https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/imx6ullevk_
>> defconfig
>>
> 
> I also have a question regarding the freescale imx defconfig, you mentioned:
> There is a "call" command in the CUSTOM_TARBALL_LOCATION setting:
> 
> $(call github,nxp-imx,linux-imx,lf-<version>)/<some>.tar.gz
> 
> I suppose that this line results in buildroot downloading a particular tar
> from the net. But how does this command work in particular? Does it create
> some url from "github,nxp-imx,linux-imx,lf...."?

That is a very useful helper that does exist for gitlab too and it's
defined in:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/pkg-download.mk#L63

it takes 3 argument when called and return the URL referred to Github.
Same goes for Gitlab.

Best regards
-- 
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
