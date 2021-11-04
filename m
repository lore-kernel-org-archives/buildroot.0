Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D2FC433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 17:24:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAECC60EBC
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 17:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAECC60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD6E8400DD;
	Thu,  4 Nov 2021 17:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cTpG_p6llWd; Thu,  4 Nov 2021 17:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE4D940160;
	Thu,  4 Nov 2021 17:24:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF5AD1BF32B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 17:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EF28817FF
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 17:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcQAlUg8J6p8 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 17:24:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id B99178104F
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 17:23:59 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id igT0mR6zTsfk3igT1mIDOf; Thu, 04 Nov 2021 18:23:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636046639; bh=L6jtNK5L206PLvn6bGN3iJ1nOxPpqK/zNu23vOQcQHQ=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=hEKu7WNGHp5qWvPbOVLnVqNua52ubuZ7kaiWTXSIjiWBRFVKIIbEJjEto9O4grgU+
 +poO5bFBXcMsVUsDlBWj+sc8anVofHfLPKZaRpk8TQzcZuFRO8l68181oDtkkiynLk
 JzmXfU2bkqWcX1Tool3i5wul0ICWhpa9DF9lzdokdP0VsaLhDNBALhSyuOanVaYlvb
 XEal2mH/ubg2qS691sK1jN/MfL9sLqyJz7VkITGqY6DQGdKfTiaCgYq97FnBj3Zwf7
 /0vQpS3OyKGCGrKCJkY/PqPtgIiqcSqixNEu4bsREo6/wOMuvfgTWRg2gTu99EWoD+
 L0hNZbuMA4u8w==
To: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
References: <20211104063807.139604-1-giulio.benetti@benettiengineering.com>
 <20211104063807.139604-2-giulio.benetti@benettiengineering.com>
 <fcc23c74-070b-12cc-3d77-48bc2fcf5eb4@lucaceresoli.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <72be5698-98dc-d5b2-50a6-342326d9dacf@benettiengineering.com>
Date: Thu, 4 Nov 2021 18:23:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fcc23c74-070b-12cc-3d77-48bc2fcf5eb4@lucaceresoli.net>
Content-Language: en-US
X-CMAE-Envelope: MS4wfKXq5oMvGDC3mBDhSOEOiMjCPcsttmcx/UerZRE3lVIvm80W20bDBktK9GzKO8r4pMSuRBQ38f+0T82SLazkqg0IK89HYEcfJxnJXF6vGQ7nckg+0O/d
 NhwY45ugVI1gnXmvGen9p0x7wrwJOWJQIKKVpfYY58A7XnmqfTLPuPvHBKceihgCUoYnkHisx+WwQu4FNmBUSgFPZaNIxmcmTCXC0Lzovgg2dk059kpTOeyg
 st6Z0AJkm2cEJ0lc+Y+eYuQASODZo1/n2P8FOvF4PcJAoTdjzhW21HYP2Xm4Yl07KY2DT4YhZqFlARVAhuPgQ3qKyd1yx/wlNnVj5MN+gIYpPIck8HRsLCu9
 A420wOOEKBNOI9kzHqtuBHh/zrphmqpYAylL+Pg2+2t/Ky6tkkdwZJ6bA5qDhwWibxkUa3IjuDmkU/maumyY11sHS/a7fFcermpvLE8h1JwOqzBxMZFmEVXF
 HvYAegWTmI/uA0Qr
Subject: Re: [Buildroot] [PATCH 1/2] package/sunxi-mali-utgard: rename from
 sunxi-mali-mainline
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

On 11/4/21 10:26 AM, Luca Ceresoli wrote:
> Hi Giulio,
> 
> thanks for these and the other olimex patches you are sending. Thomas
> applied them faster than I could review and test them... let me try this
> time :)

I've just sent the v2 series, do we wait until you give a Tested-by: ?

Thanks for reviewing!

-- 
Giulio Benetti
Benetti Engineering sas

> On 04/11/21 07:38, Giulio Benetti wrote:
>> From: Miquel Raynal <miquel.raynal@bootlin.com>
>>
>> This package provides Mali libraries for Sunxi Mali Utgard GPUs. The
>> trailing -mainline is historical and was used at a time when there was
>> two packages providing these libraries. The "non-upstream" package has
>> been removed some time ago so before adding new packages bringing
>> support for other ARM Mali GPU versions or implementations, rename
>> sunxi-mali-mainline into sunxi-mali-utgard.
>>
>> Add a legacy entry.
>>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> [Giulio: rebase on master. Rename SUNXI_MALI_MAINLINE_REV to
>> SUNXI_MALI_UTGARD_REV in sunxi-mali-mailine-driver.mk and
>> BR2_PACKAGE_SUNXI_MALI_MAINLINE to BR2_PACKAGE_SUNXI_UTGARD in
>> sunxi-mali-mainline-driver/Config.in to respect bisectability]
> 
> [...]
> 
>> diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
>> index ed279326bc..d0ebeb53a3 100644
>> --- a/configs/olimex_a20_olinuxino_lime2_defconfig
>> +++ b/configs/olimex_a20_olinuxino_lime2_defconfig
>> @@ -32,7 +32,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
>>   
>>   # sunxi packages
>>   BR2_PACKAGE_SUNXI_TOOLS=y
>> -BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
>> +BR2_PACKAGE_SUNXI_MALI_UTGARD=y
>>   BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
>>   
>>   # Filesystem
>> diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
>> index cd88a2d19a..000071b11c 100644
>> --- a/configs/olimex_a20_olinuxino_lime_defconfig
>> +++ b/configs/olimex_a20_olinuxino_lime_defconfig
>> @@ -32,7 +32,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
>>   
>>   # sunxi packages
>>   BR2_PACKAGE_SUNXI_TOOLS=y
>> -BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
>> +BR2_PACKAGE_SUNXI_MALI_UTGARD=y
>>   BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
>>   
>>   # Filesystem
> 
> Both lime defconfigs still have this line:
> 
>    # glibc is needed for sunxi-mali-mainline-package.
> 
> which sould be updated.
> 
> While there, please change replace "-package" -> " package".
> 
> The rest looks good.
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
