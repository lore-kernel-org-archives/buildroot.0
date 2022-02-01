Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13839C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB210415BF;
	Tue,  1 Feb 2022 23:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2TbrswccsrE; Tue,  1 Feb 2022 23:06:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13C2C41592;
	Tue,  1 Feb 2022 23:06:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E4371BF2BD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF6B240137
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSvbfc3qgsfH for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:06:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC531400CC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:06:45 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2EVnnDwGks1JF2EWnXdPN; Wed, 02 Feb 2022 00:06:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643756804; bh=mobwJ8RNu5ZCTJMmamHZejfbzxvSGi3be1d+6tYY7f8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Af/7HW8SDmfme3+21EXgkTtmb3WvJ9n5W49NNGh0kD1qosxD9wgsEdGIwTxL4YPVn
 8We0Vbakgq2+kOGbWgNg0YJa9ELQrYGOckhiMNH+YM1KHAfUUHT1SSU3ceTw8I+R9S
 2DizzOuOlHOeoUwrKjfJIFAMRMg6bPVO7R/WMCwY6GQb3Ye6RlV+Q0oyaIiL/496fl
 GET/nIf4dyMrEXPE9qMHmKW6TqaqDkJgU3tf7cN0vWbJF9+DvQMQ+upxh9IlFUPCt4
 AWv6G0ErYN7TbNUiWGYGROxdnDWzpA4uMZ64TrHUHQytM8+nsDwFZhmHjtu4dQZOH4
 IoAYqmZn52WHg==
Message-ID: <037b8bb1-8191-2410-ca36-272597898584@benettiengineering.com>
Date: Wed, 2 Feb 2022 00:06:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
 <20220201230414.4144930-4-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220201230414.4144930-4-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4wfC6L3fwoaPO1Gv3Q2yAuSXasoyRx+5mp0bhnC9OftbB6EB6EPiA+zGfBZpCRf58tWd2ECv41dDC0NhmJNKAy3REitP/01mC8/b0l+/G02/qQ+dwKS7fA
 bLoQUQXw/IqAYaJN/qoryiwixl/99TCeFuKpCBq9ybfp4S/6/pbZXA48x7fBChK6sm3H999rRiJV9jECBY5pmkkt7oxh1LGxw2c8QLSS2WLLxxC27rm3PUkf
 wmGYzPcpdINRpuWxfztSnISoQ9YQfIBg3YVhSfGRV1w031x7IgkxIR+QeIU969R05hbSObi9e541Rots2RiOeYHcaMmwlkTesDOy5ilZ/oT4F1kdMawhqlUV
 IWzupAP+QA1dfo20e5H322ilrUab2RjDA0UJkStbp11NZJOJFpRU3e127HqZdDsjbx1hJQdR
Subject: Re: [Buildroot] [PATCH v2 3/6]
 configs/microchip_sama5d2_icp_mmc_defconfig: linux needs host openssl
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lothar Felten <lothar.felten@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/02/22 00:04, Giulio Benetti wrote:
> Fixes:
> https://gitlab.com/ymorin/buildroot/-/jobs/2035821094
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I've left back this:
Reviewed-by: Michael Trimarchi <michael@amarulasolutions.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   configs/microchip_sama5d2_icp_mmc_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/microchip_sama5d2_icp_mmc_defconfig b/configs/microchip_sama5d2_icp_mmc_defconfig
> index 4bb3625f83..27ea4970f1 100644
> --- a/configs/microchip_sama5d2_icp_mmc_defconfig
> +++ b/configs/microchip_sama5d2_icp_mmc_defconfig
> @@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,li
>   BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_icp"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="120M"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
